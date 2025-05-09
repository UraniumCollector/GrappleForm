extends CharacterBody2D
@export var jumpKey = "ui_accept"
@export var right = "ui_right"
@export var left = "ui_left"
@export var grappleKey = ""
@export var player = 1
@onready var animated_sprite = $AnimatedSprite2D
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var airSpeed = 0.1

var animation
var grappleSpeed = 200
var target
var isGrappling = false

func _ready():
	if player == 1:
		animation = "P1Run"
		animated_sprite.play(animation)
		animated_sprite.stop()
	elif player == 2:
		animation = "P2Run"
		animated_sprite.play(animation)
		animated_sprite.stop()

func _process(delta: float) -> void:
	
	
	if Input.is_action_pressed(right):
		animated_sprite.play(animation)
		animated_sprite.flip_h = false
	elif Input.is_action_pressed(left):
		animated_sprite.play(animation)
		animated_sprite.flip_h = true
	else:
		animated_sprite.stop()
		

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis(left, right)
	# Add the gravity.
	if not is_on_floor() and not isGrappling:
		velocity += get_gravity() * delta
		velocity.x += direction * SPEED * airSpeed

		if velocity.x > SPEED:
			velocity.x = SPEED
		elif velocity.x < -SPEED:
			velocity.x = -SPEED

	# Handle jump.
	if Input.is_action_just_pressed(jumpKey) and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if player == 1:
		if(Input.is_action_just_pressed("p1g")):
			target = %Player2.position
			isGrappling = !isGrappling
	elif player == 2:
		if(Input.is_action_just_pressed("p2g")):
			target = %Player.position
			isGrappling = !isGrappling
	
	if isGrappling:
		velocity = -Vector2(position - target).normalized() * grappleSpeed
		move_and_slide()
	
	
	if direction and is_on_floor() and not isGrappling:
		velocity.x = direction * SPEED
	elif is_on_floor():
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

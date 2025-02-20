extends RayCast2D
@export var targetPlayer: Node2D
@export var hook: Resource
var launched = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HookTexture.texture = hook


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(!launched):
		#thank you godot forum user for the code I adapted here! https://forum.godotengine.org/t/help-with-look-at-function/39999/4
		look_at(targetPlayer.position)
		rotate(PI * 1.5)
	else:
		pass

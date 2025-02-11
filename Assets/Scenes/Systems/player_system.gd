extends Node2D

@export var player_1_x = 0
@export var player_1_y = 0
@export var player_2_x = 0
@export var player_2_y = 0

@onready  var p1h = $Player/P1Hook
@onready var p2h = $Player2/P2Hook

func _ready() -> void:
	$Player.position = Vector2i(player_1_x,player_1_y)
	$Player2.position = Vector2i(player_2_x,player_2_y)
	Globals.p1Position = Vector2i(player_1_x,player_1_y)
	Globals.p2Position = Vector2i(player_2_x,player_2_y)
	

func _process(delta: float) -> void:
	
	Globals.p1Position = $Player.position
	Globals.p2Position = $Player2.position
	

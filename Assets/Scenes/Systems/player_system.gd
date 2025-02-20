extends Node2D

@export var player_1_x = 0
@export var player_1_y = 0
@export var player_2_x = 0
@export var player_2_y = 0

@export var mapLimit: TileMapLayer

@onready  var p1h = $Player/P1Hook
@onready var p2h = $Player2/P2Hook

var x_min
var y_min
var x_max
var y_max

var usedSpace
func _ready() -> void:
	$Player.position = Vector2i(player_1_x,player_1_y)
	$Player2.position = Vector2i(player_2_x,player_2_y)
	Globals.p1Position = Vector2i(player_1_x,player_1_y)
	Globals.p2Position = Vector2i(player_2_x,player_2_y)
	
	

func _process(delta: float) -> void:
	var c = mapLimit
	Globals.p1Position = $Player.position
	Globals.p2Position = $Player2.position
	
	usedSpace = mapLimit.get_used_rect()
	y_min = mapLimit.position.y + (usedSpace.size.y * 22 / 2)
	y_max = mapLimit.position.y - (usedSpace.size.y * 16 / 2)
	x_min = mapLimit.position.x - (usedSpace.size.x * 16 / 2)
	x_max = mapLimit.position.x + (usedSpace.size.x * 16 / 2)
	%Camera2D.limit_bottom = y_min
	

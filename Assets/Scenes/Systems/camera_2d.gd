extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x = (Globals.p1Position.x + Globals.p2Position.x) / 2
	position.y = (Globals.p1Position.y + Globals.p2Position.y) / 2
	#pass

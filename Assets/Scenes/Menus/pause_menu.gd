extends Control

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta):
	if Input.is_action_just_pressed("menu"):
		
		if(get_tree().paused):
			get_tree().paused = false
			hide()
		else:
			get_tree().paused = true
			show()
		

func _on_resume_pressed() -> void:
	get_tree().paused = false
	hide()



func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Assets/Scenes/Menus/main_menu.tscn")
	

extends Control




func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Menus/main_menu.tscn")



func _on_lvl_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Levels/level_1.tscn")

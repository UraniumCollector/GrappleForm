extends Control
static var volume = 100


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Menus/level_select.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/menus/options.tscn")

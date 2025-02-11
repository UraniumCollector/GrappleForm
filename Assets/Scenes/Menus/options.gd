extends Control
var fullscreen = true
var res1080 = Vector2i(1920,1080)
var res720 = Vector2i(1280,720)
var res360 = Vector2i(640,360)
var res144 = Vector2i(256,144)
var selectedRes = res720

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/menus/main_menu.tscn")

func _ready() -> void:
	if(Config.vsync):
		$AspectRatioContainer/VBoxContainer/Settings/Video/VsyncToggle/Vsync.button_pressed = true
	else:
		$AspectRatioContainer/VBoxContainer/Settings/Video/VsyncToggle/Vsync.button_pressed = false
	
	if(Config.fullscreen):
		$AspectRatioContainer/VBoxContainer/Settings/Video/FScreenToggle/FullScreen.button_pressed = true
	else:
		$AspectRatioContainer/VBoxContainer/Settings/Video/FScreenToggle/FullScreen.button_pressed = false

#video controls
func _on_full_screen_toggled(toggled_on: bool) -> void:
	if(toggled_on):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		Config.fullscreen = true
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		Config.fullscreen = false
		if(selectedRes != null):
			DisplayServer.window_set_size(selectedRes)


func _on_resolution_item_selected(index: int) -> void:
	if(index == 0):
		DisplayServer.window_set_size(res1080)
		selectedRes = res1080
	elif(index == 1):
		DisplayServer.window_set_size(res720)
		selectedRes = res720
	elif(index == 2):
		DisplayServer.window_set_size(res360)
		selectedRes = res360
	elif(index == 3):
		DisplayServer.window_set_size(res144)
		selectedRes = res144


func _on_vsync_toggled(toggled_on: bool) -> void:
	if(toggled_on):
		DisplayServer.window_set_vsync_mode(DisplayServer.VSyncMode.VSYNC_ENABLED)
		Config.vsync = true;
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSyncMode.VSYNC_DISABLED)
		Config.vsync = false;

#audio controls
func _on_h_slider_value_changed(value: float) -> void:
	$AspectRatioContainer/VBoxContainer/Settings/Audio/HBoxContainer/VolumeInd.text = str(value)
	Config.volume = value

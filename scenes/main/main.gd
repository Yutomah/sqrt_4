extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.window_set_min_size(Vector2(800, 500))
	GB.change_theme.connect(on_theme_change)
	GB.change_sound_volume.connect(on_change_sound_value)
	
func on_theme_change(current_theme):
	theme = current_theme
	
func on_change_sound_value(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
	call_deferred("play_sound")

func play_sound():
	$AudioStreamPlayer.play()

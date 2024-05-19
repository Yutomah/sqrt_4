extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.window_set_min_size(Vector2(800, 500))
	GB.change_theme.connect(on_theme_change)
	
func on_theme_change(current_theme):
	theme = current_theme
	

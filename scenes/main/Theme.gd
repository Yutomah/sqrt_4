extends Button

var white_theme
var default_theme

var current_theme:Theme = default_theme
func _ready():
	white_theme = load("res://themes/white.tres")
	default_theme = load("res://themes/default.tres")
	GB.change_theme.emit(default_theme)
	
	

func _on_pressed():
	if current_theme == default_theme:
		GB.change_theme.emit(white_theme)
		current_theme = white_theme
	else:
		GB.change_theme.emit(default_theme)
		current_theme = default_theme

extends Button




func _on_pressed():
	DisplayServer.clipboard_set($"../LineEdit".text)

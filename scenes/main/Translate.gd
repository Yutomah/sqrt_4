extends Button



func _on_pressed():
	$PopupMenu.visible = true


func _on_popup_menu_id_pressed(id):
	match(id):
		0:
			GB.change_language.emit("ru")
		1:
			GB.change_language.emit("en")

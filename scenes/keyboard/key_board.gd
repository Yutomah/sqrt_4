extends PanelContainer


signal add_symbol(symbol)
signal remove_symbol()

func _on_key_1_pressed():
	add_symbol.emit("1")


func _on_key_2_pressed():
	add_symbol.emit("2")


func _on_key_3_pressed():
	add_symbol.emit("3")


func _on_key_4_pressed():
	add_symbol.emit("4")


func _on_key_5_pressed():
	add_symbol.emit("5")


func _on_key_6_pressed():
	add_symbol.emit("6")


func _on_key_7_pressed():
	add_symbol.emit("7")


func _on_key_8_pressed():
	add_symbol.emit("8")


func _on_key_9_pressed():
	add_symbol.emit("9")


func _on_key_point_pressed():
	add_symbol.emit(".")


func _on_key_0_pressed():
	add_symbol.emit("0")


func _on_key_c_pressed():
	remove_symbol.emit()

extends GridContainer


func _ready():
	$Input.text_changed.connect(on_text_changed)
	$HBoxContainer/SpinBox.get_line_edit().text_changed.connect(_on_spin_box_value_changed)
	
func on_text_changed(new_text, new_caret_pos, text_line):
	var result = SqrtComputator.is_valid_common_sqrt(new_text)
	match(result):
		"valid":
			text_line.change_old_text(new_text)
			text_line.change_old_caret_pos(new_caret_pos)
			$Output.change_text(SqrtComputator.get_bignum_sqrt(new_text, $HBoxContainer/SpinBox.value))
		"incorect":
			GB.show_message.emit("Неправильный символ")
			text_line.return_to_old_text()
			text_line.return_to_old_caret_pos()
		"negative":
			GB.show_message.emit("Число должно быть положительным")
			text_line.return_to_old_text()
			text_line.return_to_old_caret_pos()
	
		


func _on_spin_box_value_changed(value):
	print("spin")
	var new_text = $Input.get_current_text()
	$Output.change_text(SqrtComputator.get_bignum_sqrt(new_text, value))

extends GridContainer


func _ready():
	$Input.text_changed.connect(on_text_changed)
	
func on_text_changed(new_text, new_caret_pos, text_line):
	var result = SqrtComputator.is_valid_common_sqrt(new_text)
	match(result):
		"valid":
			text_line.change_old_text(new_text)
			text_line.change_old_caret_pos(new_caret_pos)
			text_line.play_key_sound()
			$Output.change_text(SqrtComputator.get_common_sqrt(new_text))
		"incorect":
			GB.show_message.emit("Неправильный символ")
			text_line.return_to_old_text()
			text_line.return_to_old_caret_pos()
		"negative":
			GB.show_message.emit("Число должно быть положительным")
			text_line.return_to_old_text()
			text_line.return_to_old_caret_pos()
	
		

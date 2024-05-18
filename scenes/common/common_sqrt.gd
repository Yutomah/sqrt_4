extends GridContainer


func _ready():
	$Input.text_changed.connect(on_text_changed)
	
func on_text_changed(new_text, new_caret_pos):
	var result = SqrtComputator.is_valid_common_sqrt(new_text)
	match(result):
		"valid":
			$Input.change_old_text(new_text)
			$Input.change_old_caret_pos(new_caret_pos)
			$Output.change_text(SqrtComputator.get_common_sqrt(new_text))
		"incorect":
			GB.show_message.emit("Неправильный символ")
			$Input.return_to_old_text()
			$Input.return_to_old_caret_pos()
		"negative":
			GB.show_message.emit("Число должно быть положительным")
			$Input.return_to_old_text()
			$Input.return_to_old_caret_pos()
	
		

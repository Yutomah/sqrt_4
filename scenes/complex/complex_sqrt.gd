extends GridContainer

@onready var real_input = $RealInput
@onready var img_input = $ImgInput

func _ready():
	real_input.text_changed.connect(on_text_changed)
	img_input.text_changed.connect(on_text_changed)
	
func on_text_changed(new_text, new_caret_pos, text_line):
	var result = SqrtComputator.is_valid_complex_sqrt(new_text)
	if result:
		text_line.change_old_text(new_text)
		text_line.change_old_caret_pos(new_caret_pos)
	else:
		GB.show_message.emit("Неправильный символ")
		text_line.return_to_old_text()
		text_line.return_to_old_caret_pos()
		
		
	var real_text = real_input.get_current_text()
	var result_real = SqrtComputator.is_valid_complex_sqrt(real_text)
	var img_text = img_input.get_current_text()
	var result_img = SqrtComputator.is_valid_complex_sqrt(img_text)
	if result_real and result_img:
		var complex_sqrt = SqrtComputator.get_complex_sqrt(real_text, img_text)
		$RealOutput.change_text(complex_sqrt[0])
		$ImgOutput.change_text(complex_sqrt[1])
		
	

extends Button

var text_ru = "Эта программа имеет 3 вкладки: 
Обычный корень -  для вычисления обычных корней
Длинный корень - для вычисления корней от больших чисел с заданной точностью
Комплексный корень - для вычисления корней от комплексных чисел

Тех поддержка: 
Электронная почта - coolsqrtapp@gmail.com"

var title_ru = "Помощь"


var text_en = "This program has 3 tabs:
Common square root - for calculating ordinary roots
Long square root - for calculating the roots of large numbers with a given accuracy
Complex square root - for calculating the roots of complex numbers

Technical support:
Email address - coolsqrtapp@gmail.com"

var title_en = "Help"

func _on_pressed():
	$AcceptDialog.visible = true


func _ready():
	GB.change_language.connect(on_change_language)
	$AcceptDialog.dialog_text = text_en
	$AcceptDialog.title = title_en
	
func on_change_language(lang):
	match(lang):
		"ru":
			$AcceptDialog.dialog_text = text_ru
			$AcceptDialog.title = title_ru
		"en":
			$AcceptDialog.dialog_text = text_en
			$AcceptDialog.title = title_en

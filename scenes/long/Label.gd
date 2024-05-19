extends Label

var text_ru:String = "Точность"
var text_en:String = "Precision"
# Called when the node enters the scene tree for the first time.
func _ready():
	GB.change_language.connect(on_change_language)
	text = text_en
	
func on_change_language(lang):
	match(lang):
		"ru":
			text = text_ru
		"en":
			text = text_en

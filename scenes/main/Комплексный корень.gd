extends MarginContainer

var title_ru:String = "Комплексный корень"
var title_en:String = "Complex square root"
# Called when the node enters the scene tree for the first time.
func _ready():
	GB.change_language.connect(on_change_language)
	name = title_en
	
func on_change_language(lang):
	match(lang):
		"ru":
			name = title_ru
		"en":
			name = title_en

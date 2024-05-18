extends VBoxContainer

@export var line_title:String = "text"
@export var editable:bool = true
@export var line_size:int = 16
signal text_changed(new_text, new_caret_pos)

var old_text:String = ""
var old_caret_pos:int = 0

func _ready():
	$Label.text = line_title
	$LineEdit.editable = editable
	
func _on_line_edit_text_changed(new_text):
	text_changed.emit(new_text, $LineEdit.caret_column)

func change_text(new_text):
	$LineEdit.text = new_text

func return_to_old_text():
	$LineEdit.text = old_text
	
func change_old_text(new_text):
	old_text = new_text

func return_to_old_caret_pos():
	$LineEdit.caret_column = old_caret_pos
	
func change_old_caret_pos(new_pos):
	old_caret_pos = new_pos

extends VBoxContainer
class_name text_line
@export var line_title_ru:String = "текст"
@export var line_title_en:String = "text"

@export var editable:bool = true
@export var line_size:int = 16
@export var key_board:KeyBoard = null
signal text_changed(new_text, new_caret_pos, text_line)
@onready var line_edit = $HBoxContainer/LineEdit

@export var is_main_keyboard:bool = true

var old_text:String = ""
var old_caret_pos:int = 0

func _ready():
	if key_board != null:
		key_board.add_symbol.connect(on_add_symbol)
		key_board.remove_symbol.connect(on_remove_symbol)
		
	GB.change_language.connect(on_change_language)
	$Label.text = line_title_en
	line_edit.editable = editable
	
func _on_line_edit_text_changed(new_text):
	text_changed.emit(new_text, line_edit.caret_column, self)
	
func get_current_text():
	return line_edit.text
	
func change_text(new_text):
	line_edit.text = new_text

func return_to_old_text():
	line_edit.text = old_text
	
func change_old_text(new_text):
	old_text = new_text

func return_to_old_caret_pos():
	line_edit.caret_column = old_caret_pos
	
func change_old_caret_pos(new_pos):
	old_caret_pos = new_pos

func on_add_symbol(symbol):
	if line_edit.has_focus() or (is_main_keyboard and !get_viewport().gui_get_focus_owner() is text_line):
		line_edit.grab_focus()
		line_edit.insert_text_at_caret(symbol)
		text_changed.emit(line_edit.text, line_edit.caret_column, self)
	
	
func on_remove_symbol():
	if line_edit.has_focus() or (is_main_keyboard and get_viewport().gui_get_focus_owner() == null):
		line_edit.grab_focus()
		line_edit.delete_char_at_caret()
		text_changed.emit(line_edit.text, line_edit.caret_column, self)
	

func on_change_language(lang):
	match(lang):
		"ru":
			$Label.text = line_title_ru
		"en":
			$Label.text = line_title_en

func play_key_sound():
	$AudioStreamPlayer2D.play()

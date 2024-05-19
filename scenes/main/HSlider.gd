extends HSlider




func _on_drag_ended(value_changed):
	GB.change_sound_volume.emit(value)
	

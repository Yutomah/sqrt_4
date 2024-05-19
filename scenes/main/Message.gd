extends PanelContainer


func _ready():
	GB.show_message.connect(on_show_message)
	
func on_show_message(message):
	$Label.text = message
	$Timer.start()
	$AudioStreamPlayer.play()
	show()
	

func _on_timer_timeout():
	hide()


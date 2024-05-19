extends PanelContainer


func _ready():
	GB.show_message.connect(on_show_message)
	
func on_show_message(message):
	print(123)
	$Label.text = message
	$Timer.start()
	show()
	

func _on_timer_timeout():
	hide()


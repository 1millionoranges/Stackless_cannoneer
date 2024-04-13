extends Area2D


@export var text: String

func _ready():
	pass
	#set_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_text(new_text: String = text):
	$Popup/Label.text = new_text
	
func _on_mouse_entered():
	$Popup.visible = true
func _on_mouse_exited():
	$Popup.visible = false

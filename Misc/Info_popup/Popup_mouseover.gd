extends Area2D
@export var popup: Node

func _on_mouse_entered():
	popup.visible = true

func _on_mouse_exited():
	popup.visible = false

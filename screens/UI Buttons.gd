extends Node2D
var main_node: Node2D

func _ready():
	main_node = get_parent()
	


func _on_next_turn_pressed():
	main_node.next_turn();

extends Node2D

func get_cannon(index):
	return find_child("Cannon" + str(index+1));

func next_turn():
	for child in get_children():
		child.next_turn()

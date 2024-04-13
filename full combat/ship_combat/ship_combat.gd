extends Node2D

func get_cannon(cannon_index):
	var search_string = "cannon" + str(cannon_index+1)
	return $Ship.find_child(search_string)
func next_turn():
	pass

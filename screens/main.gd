extends Node2D
var num_cannons = 2

func next_turn():
	$Inventory.next_turn();
	for i in num_cannons:
		var cannon_string = "Cannon" + str(i+1)
		find_child(cannon_string).next_turn()

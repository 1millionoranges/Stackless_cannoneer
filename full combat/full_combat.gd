extends Node2D
var cannon_combat_node
var ship_combat_node
func _ready():
#	cannon_combat_node = $CannonViewportContainer.find_child("SubViewport").find_child("CannonCombat", true);
	cannon_combat_node = $CannonCombat;
	ship_combat_node = $ShipViewportContainer.find_child("SubViewport").find_child("ShipCombat", true);
	cannon_combat_node.get_cannon(0).set_linked_cannon(ship_combat_node.get_cannon(0))
	cannon_combat_node.get_cannon(1).set_linked_cannon(ship_combat_node.get_cannon(1))

func next_turn():
	cannon_combat_node.next_turn()
	ship_combat_node.next_turn()

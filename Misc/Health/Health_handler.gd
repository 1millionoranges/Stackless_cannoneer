extends Node
@export var max_health: float = 2000
@export var current_health: float = 2000;
var health_ratio = current_health / max_health;
signal on_change

func take_damage(damage: float):
	current_health -= damage;
	health_ratio = current_health / max_health;
	on_change.emit()
	

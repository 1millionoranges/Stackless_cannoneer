extends Node2D
@export var health_handler: Node;

func _ready():
	health_handler.on_change.connect(update_image);
	
func update_image():
	$Health.scale.x = health_handler.health_ratio;

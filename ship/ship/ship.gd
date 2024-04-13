extends RigidBody2D
class_name Ship

var target_global_pos: Vector2
var target_rotation: float
func _ready():
	target_global_pos = global_position
	target_rotation = rotation
func get_hit(pos, vel):
	apply_impulse(sqrt(vel.length()) * vel.normalized() * 10, pos - global_position)
	var health_handler = $Health_handler;
	if health_handler:
		health_handler.take_damage(vel.length());
func _process(delta):
	var pos_difference = target_global_pos - global_position
	var rotation_difference = target_rotation - rotation
	apply_central_force(pos_difference)
	apply_torque(rotation_difference * 100000)

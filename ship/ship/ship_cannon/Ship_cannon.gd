extends Node2D
var fire_angle_variance = PI / 10

@export var projectile_scene: PackedScene		
func fire(speed,fire_mass=1):
	var direction = Vector2.from_angle(rotation - PI/2)
	var angle_deviation = (randf()-0.5) * fire_angle_variance
	var fire_direction = direction.normalized().rotated(angle_deviation)
	var fire_velocity = fire_direction * speed
	var projectile = projectile_scene.instantiate()
	projectile.velocity = fire_velocity
	add_child(projectile)
	projectile.top_level = true
	projectile.global_position = global_position
	var parent = get_parent()
	parent.apply_impulse(-fire_velocity * fire_mass * 10, global_position - parent.global_position)
	$Sprite.play("fire")
func add_projectiles(projectile_list: Array):
	for projectile in projectile_list:
		add_child(projectile)
		projectile.top_level = true
		projectile.velocity = projectile.velocity.rotated(global_rotation-(PI/2))
		projectile.global_position = global_position

func _on_animations_animation_finished():
	$Sprite.play("default")

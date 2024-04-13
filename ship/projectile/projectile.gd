extends Node2D
var velocity: Vector2
var disabled: bool = false

func _process(delta):
	if not disabled:
		position += velocity

func _on_area_2d_area_entered(area):
	if disabled:
		return
	area.get_parent().get_hit(global_position, velocity)
	explode()

func get_hit(a,b):
	queue_free()

func explode():
	disable()
	$Sprite.play("explode")
func disable():
	disabled = true
	velocity = Vector2.ZERO
	

func _on_sprite_animation_finished():
	queue_free()

func _on_lifetime_timeout():
	if disabled:
		return
	disable()
	$Sprite.play("splash")

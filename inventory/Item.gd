extends Node2D
class_name Item

enum ID{CANNONBALL, GUNPOWDER, TORCH, SUPER_GUNPOWDER, GOLD, SILVER, MASSIVE_CANNONBALL, PROXIMITY_CANNONBALL, BOMB, WOOD, CHAIN}
@export var id: ID
@export var projectile_scene: PackedScene
@export var projectile_spread_curve: Curve;
@export var projectile_spread_range: float = PI/6;
var descriptions: Dictionary = {
	ID.CANNONBALL: "When fired, Does one damage for each gunpowder below.",
	ID.GUNPOWDER: "Adds one gunpowder.",
	ID.TORCH: "Fires the cannon.",
	ID.SUPER_GUNPOWDER: "Adds one gunpowder for each gunpowder below.",
	ID.GOLD: "5 Money.",
	ID.SILVER: "2 Money.",
	ID.MASSIVE_CANNONBALL: "Does less damage, but pushes very hard.",
	ID.PROXIMITY_CANNONBALL: "Does much more damage when very close",
	ID.BOMB: "Explodes after a short delay.",
	ID.WOOD: "Repairs some damage.",
	ID.CHAIN: "Connects two items together and does extra damage."
}
enum TYPE{CANNON, MONEY}
func _ready():
	update_id();
var types_dict: Dictionary = {
	TYPE.CANNON: [ID.CANNONBALL, ID.GUNPOWDER, ID.TORCH, ID.SUPER_GUNPOWDER],
	TYPE.MONEY: [ID.GOLD, ID.SILVER]
}
func set_id(new_id: int):
	id = new_id
	update_id()
func set_sprite():
	$Sprite.frame = id
func is_id(new_id:ID):
	return id == new_id
func is_type(type:TYPE):
	return types_dict[type].has(id)
func on_fire_cannon(cannon_state: CannonState):
	var return_projectiles: Array = []
	if(id == ID.GUNPOWDER):
		cannon_state.explosives += 1;
	elif(id == ID.CANNONBALL):
		var explosives = cannon_state.explosives
		var new_projectile = projectile_scene.instantiate()
		new_projectile.velocity = Vector2(sqrt(explosives) * 10, 0);
		var spread_angle = projectile_spread_range * (projectile_spread_curve.sample(randf()) - 0.5);
		new_projectile.velocity = new_projectile.velocity.rotated(spread_angle);
		return_projectiles.append(new_projectile)
	return return_projectiles;
func update_id():
	set_sprite()
	set_info_popup_label()
	
func set_info_popup_label():
	$Info_popup.set_text(descriptions[id])

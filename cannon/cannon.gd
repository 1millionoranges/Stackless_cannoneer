extends Node2D
var mouse_follower_node: Node2D
var held_items:int = 0;
var fuse_lit:bool = false
@export var linked_ship_cannon: Node2D

func set_linked_cannon(other_cannon):
	linked_ship_cannon = other_cannon
	$Popup_mouseover.popup = linked_ship_cannon.find_child("popup")
	
func _ready():
	var root = get_tree().root
	var main = root.get_child(0)
	mouse_follower_node = main.find_child("Mouse_follower");
func fire_cannon():
	fuse_lit = false
	$Fuse_particles.emitting = false
	var cannon_state = CannonState.new()
	for i in held_items:
		var item = $Item_holders.find_child("Item_holder"+str(i+1)).get_item();
		var projectiles = item.on_fire_cannon(cannon_state);
		item.queue_free();
		linked_ship_cannon.add_projectiles(projectiles);
	held_items = 0
		
func next_turn():
	if fuse_lit:
		fire_cannon()
func light_fuse():
	fuse_lit = true
	$Fuse_particles.emitting = true
func put_item(new_item: Item):
	if not new_item or new_item.id == Item.ID.TORCH:
		return
	held_items+=1;
	$Item_holders.find_child("Item_holder"+str(held_items)).put_item(new_item);
func fuse_item(new_item: Item):
	if not new_item:
		return
	if new_item.id == Item.ID.TORCH:
		new_item.queue_free()
		light_fuse();
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if not event.pressed:
			put_item(mouse_follower_node.give())


func _on_fuse_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if not event.pressed:
			fuse_item(mouse_follower_node.give())

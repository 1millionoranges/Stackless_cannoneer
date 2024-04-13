extends Node2D
var mouse_follower_node: Node2D
@export var is_interactable: bool = true;
func _ready():
	var root = get_tree().root
	var main = root.get_child(0)
	mouse_follower_node = main.find_child("Mouse_follower");

func has_item():
	return $Item_holder_node.get_child_count() > 0;
	
func pickup_item():
	if has_item():
		mouse_follower_node.take(get_item())
func get_item():
	return $Item_holder_node.get_child(0)
	
func put_item(new_item):
	if not new_item:
		return
	if !has_item():
		new_item.reparent($Item_holder_node)
		new_item.position = Vector2.ZERO;
		return true
	return false
	
func _on_area_2d_input_event(viewport, event, shape_idx):
	if not is_interactable:
		return;
	if(event is InputEventMouseButton):
		if event.pressed:
			pickup_item()
		else:
			put_item(mouse_follower_node.give())
			

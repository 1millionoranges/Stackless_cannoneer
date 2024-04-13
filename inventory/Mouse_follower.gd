extends Node2D

func _process(delta):
	global_position = get_global_mouse_position()
	
func has_item():
	return $Item_holder_node.get_child_count() > 0;

func take(new_item):
	if !has_item():
		new_item.reparent($Item_holder_node)
func give():
	if has_item():
		return $Item_holder_node.get_child(0);

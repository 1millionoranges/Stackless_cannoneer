extends Node2D
@export var item_scene: PackedScene;

var item_count: Dictionary = {
	Item.ID.CANNONBALL: 10,
	Item.ID.GUNPOWDER: 10,
	Item.ID.TORCH: 2
}
var items: Array = []
func _ready():
	populate_items()
	next_turn()
func populate_items():
	items.clear()
	for key in item_count:
		var amount = item_count[key]
		for i in amount:
			items.append(key);


func next_turn():
	var item_holders_count = 5;
	for i in item_holders_count:
		if items.size() <= 0:
			return
		var new_item_id = items.pick_random()
		items.erase(new_item_id)
		var new_item = item_scene.instantiate()
		new_item.set_id(new_item_id)
		add_child(new_item);
		if !find_child("Item_holder" + str(i+1)).put_item(new_item):
			new_item.queue_free()

extends Node
@export var item_scene: PackedScene
var permanent_stockpile: Array = []

func _ready():
	generate_basic_stockpile()
	initialize_combat()
	
func generate_basic_stockpile():
	add_item(Item.ID.CANNONBALL, 1)
	add_item(Item.ID.GUNPOWDER, 1)
	add_item(Item.ID.SUPER_GUNPOWDER, 1)
	add_item(Item.ID.TORCH, 1)

func initialize_combat():
	generate_temp_stockpile()
	$stack.on_empty.connect(generate_temp_stockpile)
	
func shuffle_deck():
	var temp_stockpile: Array = []
	
func generate_temp_stockpile():
	var temp_stockpile: Array = permanent_stockpile.duplicate()
	temp_stockpile.shuffle()
	while temp_stockpile.size() > 0:
		$stack.add_item(temp_stockpile.pop_front().id)
		
func add_item(item_id: Item.ID, quantity: int = 1):
	for i in quantity:
		var new_item = item_scene.instantiate()
		new_item.set_id(item_id)
		permanent_stockpile.append(new_item)

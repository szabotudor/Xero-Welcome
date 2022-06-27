extends Node2D


func _ready():
	var welcome: Node2D = load("res://Scenes/Welcome.tscn").instance()
	welcome.position = Vector2(0, 128)
	add_child(welcome)


func switch_menu(path:String):
	for menu in get_tree().get_nodes_in_group("Menu"):
		if menu.deleted:
			menu.queue_free()
		else:
			menu._delete()
	
	var menu: Node2D = load(path).instance()
	menu.position = Vector2(0, 128)
	add_child(menu)

extends Node2D


func _ready():
	var f: File = File.new()
	if not f.file_exists("user://xerotooldata.wsd"):
		print("Create data file")
		f.open("user://xerotooldata.wsd", File.WRITE)
		var data: Dictionary = {
			"zsh":false,
			"autostart":true
		}
		f.store_var(data)
		f.close()
	
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

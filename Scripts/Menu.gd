extends Node2D


var deleted: bool = false


func _ready():
	_init_children()


func _init_children(node:Node = null, time:float = 0.3):
	if node == null:
		node = self
	for child in node.get_children():
		if child is Button:
			child.modulate.a = 0
			$Tween.interpolate_property(child, "modulate:a", 0, 1, 0.25, Tween.TRANS_SINE, Tween.EASE_IN_OUT, time)
			$Tween.start()
			time += 0.125
		time = _init_children(child, time)
	return time


func _delete_recurse(node:Node = null, time:float = 0):
	if node == null:
		node = self
	for child in node.get_children():
		if child is Button:
			child.modulate.a = 1
			$Tween.interpolate_property(child, "modulate:a", 1, 0, 0.25, Tween.TRANS_SINE, Tween.EASE_IN_OUT, time)
			$Tween.start()
			time += 0.125
		time = _delete_recurse(child, time)
	return time


func _delete():
	_delete_recurse()
	deleted = true

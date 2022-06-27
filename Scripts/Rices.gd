extends GridContainer


func _on_Back_pressed():
	get_parent().get_parent().switch_menu("res://Scenes/Welcome.tscn")


func _on_Preview_pressed():
	OS.execute("xdg-open", ["https://imgur.com/a/00m53IT"])


func _on_Rices_pressed():
	OS.execute("konsole", ["--noclose",  "-e",  "sh", "/usr/local/bin/data/rswitch"])

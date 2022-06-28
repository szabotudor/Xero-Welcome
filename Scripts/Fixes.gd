extends GridContainer


func _ready():
	pass


func _on_Back_pressed():
	get_parent().get_parent().switch_menu("res://Scenes/Welcome.tscn")


func _on_Mirror_pressed():
	OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/pcmn"])


func _on_Shutfix_pressed():
	OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/shutfix"])


func _on_Dolphin_pressed():
	OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/dolphroot"])


func _on_Pamac_pressed():
	OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/rpmc"])


func _on_GPG_pressed():
	OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/keyfix"])


func _on_Wayland_pressed():
	OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/xway"])

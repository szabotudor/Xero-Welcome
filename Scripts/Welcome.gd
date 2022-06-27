extends GridContainer


func _on_Update_pressed():
	OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/sysupd"])


func _on_Rices_pressed():
	get_parent().get_parent().switch_menu("res://Scenes/Rices.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Apps_pressed():
	OS.execute("konsole", ["-e", "sudo -E /usr/lib/xero-piai/xero-piai --setupmode"])

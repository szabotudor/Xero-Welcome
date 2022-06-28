extends GridContainer


func _ready():
	var f: File = File.new()
	f.open("user://xerotooldata.wsd", File.READ)
	var data: Dictionary = f.get_var()
	f.close()
	if data["autostart"]:
		$"Disable Autostart".text = "Disable Autostart"
		$"../Label".text = "**Currently, autostart is enabled"
	else:
		$"Disable Autostart".text = "Enable Autostart"
		$"../Label".text = "**Currently, autostart is disabled"


func _on_Update_pressed():
	OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/sysupd"])


func _on_Rices_pressed():
	get_parent().get_parent().switch_menu("res://Scenes/Rices.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Apps_pressed():
	OS.execute("konsole", ["-e", "sudo -E /usr/lib/xero-piai/xero-piai --setupmode"])


func _on_Configs_pressed():
	get_parent().get_parent().switch_menu("res://Scenes/Configs.tscn")


func _on_Disable_Autostart_pressed():
	var f: File = File.new()
	f.open("user://xerotooldata.wsd", File.READ)
	var data: Dictionary = f.get_var()
	f.close()
	if data["autostart"]:
		$"Disable Autostart".text = "Enable Autostart"
		$"../Label".text = "**Currently, autostart is disabled"
		data["autostart"] = false
		OS.execute("konsole", ["-e", "rm $HOME/.config/autostart/xero-tool.desktop"])
	else:
		$"Disable Autostart".text = "Disable Autostart"
		$"../Label".text = "**Currently, autostart is enabled"
		data["autostart"] = true
	f.open("user://xerotooldata.wsd", File.WRITE)
	f.store_var(data)


func _on_Apply_pressed():
	get_parent().get_parent().switch_menu("res://Scenes/Fixes.tscn")

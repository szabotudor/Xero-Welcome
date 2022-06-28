extends GridContainer


func _ready():
	var f: File = File.new()
	f.open("user://xerotooldata.wsd", File.READ)
	var data: Dictionary = f.get_var()
	f.close()
	if data["zsh"]:
		$"../Label".text = "**Currently, ZSH Shell is used"
		$Shell.text = "Switch to Bash Shell"
		$"Update bash".text = "Update .zshrc"
	else:
		$"../Label".text = "**Currently, Bash Shell is used"
		$Shell.text = "Switch to ZSH Shell"
		$"Update bash".text = "Update .bashrc"


func _on_Shell_pressed():
	var f: File = File.new()
	f.open("user://xerotooldata.wsd", File.READ)
	var data: Dictionary = f.get_var()
	f.close()
	if data["zsh"]:
		$"../Label".text = "**Currently, Bash Shell is used"
		$Shell.text = "Switch to ZSH Shell"
		$"Update bash".text = "Update .bashrc"
		data["zsh"] = false
		OS.execute("konsole", ["--noclose", "-e", "sh", "-c", "/usr/local/bin/data/tobash"])
	else:
		$"../Label".text = "**Currently, ZSH Shell is used"
		$Shell.text = "Switch to Bash Shell"
		$"Update bash".text = "Update .zshrc"
		data["zsh"] = true
		OS.execute("konsole", ["--noclose", "-e", "sh", "-c", "/usr/local/bin/data/tozsh"])
	f.open("user://xerotooldata.wsd", File.WRITE)
	f.store_var(data)


func _on_Back_pressed():
	get_parent().get_parent().switch_menu("res://Scenes/Welcome.tscn")


func _on_Update_bash_pressed():
	var f: File = File.new()
	f.open("user://xerotooldata.wsd", File.READ)
	var data: Dictionary = f.get_var()
	f.close()
	if data["zsh"]:
		OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/bashup"])
	else:
		OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/zshup"])


func _on_Kvm_pressed():
	OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/kvm"])


func _on_Snapper_pressed():
	OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/snapcfg"])


func _on_Firewall_pressed():
	OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/firewalled"])


func _on_HBlock_pressed():
	OS.execute("konsole", ["--noclose", "-e", "sh", "/usr/local/bin/data/hblkaur"])

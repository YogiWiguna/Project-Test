extends Node2D

@onready var LoginManager = $".."

func _on_login_pressed():
	LoginManager.LoginInputMenu()


func _on_info_button_pressed():
	LoginManager.InfoMenu()


func _on_setting_button_pressed():
	LoginManager.SettingMenu()


func _on_register_pressed():
	LoginManager.RegisterInputMenu()

extends Control

@onready var MainMenuManager = $"../.."

var gamemanager = true
var mainmenumanager = true

func _on_back_cross_button_pressed():
	MainMenuManager.SettingMenu()
	

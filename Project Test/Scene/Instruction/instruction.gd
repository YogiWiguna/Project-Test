extends Control

@onready var MainMenuManager = $"../.."


func _on_back_cross_button_pressed():
	MainMenuManager.InstructionMenu()

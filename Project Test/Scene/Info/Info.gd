extends Control

@onready var LoginManager = $"../.."


func _on_back_cross_button_pressed():
	LoginManager.InfoMenu()

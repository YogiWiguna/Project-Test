extends Node2D

@onready var MainMenuManager = $".."
#var select_char_scene = preload("res://Scene/Select_Character_Scene/select_char.tscn").instantiate()


func _ready():
	$username.text = Global.email

func _on_play_button_pressed():
#	get_tree().change_scene_to_file("res://Scene/Select_Character_Scene/select_char.tscn")
	MainMenuManager.select_Char()
#	get_tree().root.add_child(select_char_scene)


func _on_setting_button_pressed():
	MainMenuManager.SettingMenu()


func _on_instruction_button_pressed():
	MainMenuManager.InstructionMenu()


func _on_profile_button_2_pressed():
	MainMenuManager.AccountMenu()

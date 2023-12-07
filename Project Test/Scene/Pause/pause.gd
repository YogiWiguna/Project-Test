extends Control

@onready var GameManager = $"../.."


func _on_resume_pressed():
	GameManager.pauseMenu()


func _on_exit_pressed():
	get_tree().quit()


func _on_setting_button_pressed():
	GameManager.SettingMenu()


func _on_info_button_pressed():
	GameManager.InfoMenu()


func _on_restart_pressed():
	GameManager.Restart()

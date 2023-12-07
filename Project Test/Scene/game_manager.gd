extends Node


@onready var pause_Menu = $Pause_Canvas/pause
@onready var setting_In_Pause = $Setting_Canvas/Setting
@onready var info_In_Pause = $Info_Canvas/Info
@onready var Char_img_zoom = $Char_img_zoom/Char_img_zoom
@onready var action = get_node("/root/GameManager/Board_Canvas/Turn_Canvas/TurnQueue/Action")
var paused = true
var settingInPause = true
var infoInPause = true
var charImgZoom = true


func _ready():
	Global.resume()
	print("Game Start")

func _process(_delta):
#	print("game")
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
	

func Restart():
	get_tree().reload_current_scene()
	action.hide()
	print("reload")

func pauseMenu():
	if paused:
		pause_Menu.show()
		Global.pause()
	else :
		pause_Menu.hide()
		Global.resume()
		
	
	paused = !paused


func SettingMenu():
	if settingInPause:
		pause_Menu.hide()
		setting_In_Pause.show()
		Global.pause()
	else :
		setting_In_Pause.hide()
		pause_Menu.show()
		
	
	settingInPause = !settingInPause

func InfoMenu():
	if infoInPause:
		pause_Menu.hide()
		info_In_Pause.show()
		Global.pause()
		
	else :
		info_In_Pause.hide()
		pause_Menu.show()
		
	
	infoInPause = !infoInPause

func CharImgZoom():
	if charImgZoom:
		Char_img_zoom.show()
	else:
		Char_img_zoom.hide()
		
	charImgZoom = !charImgZoom

extends Node

@onready var Setting_Menu = $Setting_Canvas/Setting
@onready var Info_Menu = $Info_Canvas/Info
@onready var Login_Input = $Login_Input
@onready var Register_Input = $register_Input

@onready var usernameText = get_node("register_Input/Username")
@onready var passwordText = get_node("register_Input/Password")
@onready var errorText = get_node("register_Input/Error")
var setting = true
var info = true
var loginInput = true
var registerInput = true


func SettingMenu():
	if setting:
		Setting_Menu.show()
		Global.pause()
	else :
		Setting_Menu.hide()
		Global.resume()
	
	setting = !setting


func InfoMenu():
	if info:
		Info_Menu.show()
		Global.pause()
	else :
		Info_Menu.hide()
		Global.resume()
	
	info = !info

func RegisterInputMenu():
	if registerInput:
		Register_Input.show()
		Global.pause()
	else :
		Register_Input.hide()
		Global.resume()
	
	registerInput = !registerInput

func LoginInputMenu():
	if loginInput:
		Login_Input.show()
		Global.pause()
	else :
		Login_Input.hide()
		Global.resume()
	
	loginInput = !loginInput

func login_show():
	Register_Input.hide()
	Login_Input.show()


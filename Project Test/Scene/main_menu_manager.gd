extends Node


@onready var Setting_Menu = $Setting_Canvas/Setting
@onready var Instruction_Menu = $Instruction_Canvas/Instruction
@onready var Account_Menu = $Account_Canvas/account
@onready var select_char = $Select_Char

var setting = true
var instruction = true
var account = true

func select_Char():
	select_char.show()
	
func SettingMenu():
	if setting:
		Setting_Menu.show()
		Global.pause()
	else :
		Setting_Menu.hide()
		Global.resume()
	
	setting = !setting

func InstructionMenu():
	if instruction:
		Instruction_Menu.show()
		Global.pause()
	else :
		Instruction_Menu.hide()
		Global.resume()
	
	instruction = !instruction

func AccountMenu():
	if account:
		Account_Menu.show()
		Global.pause()
	else :
		Account_Menu.hide()
		Global.resume()
	
	account = !account

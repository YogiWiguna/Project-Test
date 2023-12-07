extends Control

@onready var GameManager = $".."
@onready var TeacherDatabase = preload("res://Database/Teacher_Database.gd")
@onready var TeacherDatabaseTemp = TeacherDatabase.new()
@onready var TeacherInfo = TeacherDatabaseTemp.DATA



# Called when the node enters the scene tree for the first time.
func _ready():
	change_img_character()
#	print(TeacherInfo[Global.character].img_game)


func _on_pause_button_pressed():
	GameManager.pauseMenu()

func change_img_character():
	$Player.texture_normal = ResourceLoader.load(TeacherInfo[Global.character].img_game)
#	if Global.character == "char1":
#		$Teacher_img.texture_normal = ResourceLoader.load(TeacherInfo.char1.img)
#
#	elif Global.character == "char2":
#		$Teacher_img.texture_normal = ResourceLoader.load(TeacherInfo.char2.img)
#
#	elif Global.character == "char3":
#		$Teacher_img.texture_normal = ResourceLoader.load(TeacherInfo.char3.img)
#
#	elif Global.character == "char4":
#		$Teacher_img.texture_normal = ResourceLoader.load(TeacherInfo.char4.img)
#
#	elif Global.character == "char5":
#		$Teacher_img.texture_normal = ResourceLoader.load(TeacherInfo.char5.img)
#
#	elif Global.character == "char6":
#		$Teacher_img.texture_normal = ResourceLoader.load(TeacherInfo.char6.img)


func _on_player_pressed():
	GameManager.CharImgZoom()

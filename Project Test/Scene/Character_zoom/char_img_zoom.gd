extends Control

@onready var GameManager = $"../.."
@onready var TeacherDatabase = preload("res://Database/Teacher_Database.gd")
@onready var TeacherDatabaseTemp = TeacherDatabase.new()
@onready var TeacherInfo = TeacherDatabaseTemp.DATA


func _ready():
	$Teacher_img_zoom.texture = ResourceLoader.load(TeacherInfo[Global.character].img_game)
	



func _on_blur_background_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed :
			GameManager.CharImgZoom()

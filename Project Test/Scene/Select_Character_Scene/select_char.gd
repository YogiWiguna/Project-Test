extends Node2D


@onready var TeacherDatabase = preload("res://Database/Teacher_Database.gd")
@onready var TeacherDatabaseTemp = TeacherDatabase.new()
@onready var TeacherInfo = TeacherDatabaseTemp.DATA

# 
@onready var title = $Description_Bars/Char_Title/Char_Title
@onready var plant_number = $Description_Bars/PlantBar/Plant_Numbers/CenterContainer/Plant_Numbers
@onready var adapt_number = $Description_Bars/AdaptibilityBar/Adaptibility_Numbers/CenterContainer/Adaptibility_Numbers
@onready var wisdom_number = $Description_Bars/WisodmBar/Wisdom_Numbers/CenterContainer/Wisdom_Numbers


func _ready():
	Global.resume()


func _on_pick_char_pressed():
	get_tree().change_scene_to_file("res://Scene/game_manager.tscn")


func change_data(character):
	title.text = TeacherInfo[character].title
	plant_number.text = TeacherInfo[character].knowledge
	adapt_number.text = TeacherInfo[character].adapt
	wisdom_number.text = TeacherInfo[character].wisdom
	$Char_Pic.texture = ResourceLoader.load(TeacherInfo[character].img_char)
	Global.set_character(character)
	

func _on_char_1_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed :
			change_data("char1")


func _on_char_2_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed :
			change_data("char2")


func _on_char_3_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed :
			change_data("char3")

func _on_char_4_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed :
			change_data("char4")

func _on_char_5_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed :
			change_data("char5")

func _on_char_6_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed :
			change_data("char6")


func _on_char_1_mouse_entered():
#	await get_tree().process_frame
#	$Char/CenterContainer/Char_Box.add_theme_constant_override("separation", 200)
	$Char/CenterContainer/Char_Box/Char1.scale = Vector2(1.2 , 1.2)

func _on_char_1_mouse_exited():
#	await get_tree().process_frame
	$Char/CenterContainer/Char_Box/Char1.scale = Vector2(1,1)
#	$Char/CenterContainer/Char_Box.add_theme_constant_override("separation", 100)


func _on_char_2_mouse_entered():
	$Char/CenterContainer/Char_Box/Char2.scale = Vector2(1.2 , 1.2)

func _on_char_2_mouse_exited():
	$Char/CenterContainer/Char_Box/Char2.scale = Vector2(1,1)


func _on_char_3_mouse_entered():
	$Char/CenterContainer/Char_Box/Char3.scale = Vector2(1.2 , 1.2)

func _on_char_3_mouse_exited():
	$Char/CenterContainer/Char_Box/Char3.scale = Vector2(1,1)


func _on_char_4_mouse_entered():
	$Char/CenterContainer/Char_Box/Char4.scale = Vector2(1.2 , 1.2)

func _on_char_4_mouse_exited():
	$Char/CenterContainer/Char_Box/Char4.scale = Vector2(1,1)


func _on_char_5_mouse_entered():
	$Char/CenterContainer/Char_Box/Char5.scale = Vector2(1.2 , 1.2)

func _on_char_5_mouse_exited():
	$Char/CenterContainer/Char_Box/Char5.scale = Vector2(1,1)


func _on_char_6_mouse_entered():
	$Char/CenterContainer/Char_Box/Char6.scale = Vector2(1.2 , 1.2)

func _on_char_6_mouse_exited():
	$Char/CenterContainer/Char_Box/Char6.scale = Vector2(1,1)

class_name TurnQueue
extends Node

signal textbox_closed

var active_character
@onready var timer = $TimerPlayer
@onready var label = $TimerPlayer/Time
@onready var TeacherDatabase = preload("res://Database/Teacher_Database.gd")
@onready var TeacherDatabaseTemp = TeacherDatabase.new()
@onready var TeacherInfo = TeacherDatabaseTemp.DATA
@onready var EnemyInfo = TeacherDatabaseTemp.DATA_ENEMY
@onready var player = $Another_Player/Player
@onready var enemy = $Another_Player/Enemy
@onready var attack_phase = $Action/Actions/Attack_Phase
@onready var plant_phase = $Action/Actions/Plant_Phase
@onready var end_phase = $Action/Actions/End_Phase
@onready var action = $Action
@onready var phase_turn = $Phase_Turn
@onready var phase_label = $Phase_Turn/Phase_Label

#@onready var deck_just_press = preload("res://Scene/UI/hand.gd")
#@onready var hand = get_node("/root/GameManager/Board_Canvas/Board/BoardUI/Hand")
@onready var draw_pile_seed = get_node("/root/GameManager/Board_Canvas/Board/DrawPileSeed")
@onready var draw_pile_plant = get_node("/root/GameManager/Board_Canvas/Board/DrawPilePlant")
@onready var drop_point_card = get_node("/root/GameManager/Board_Canvas/Board/BoardUI/Hand")

func _ready():
	# Configuration for the First time get into the game manager scene
	phase_turn.hide()
	action.hide()
		
	# Calling the first player
	Player1()
	label.hide()
	
	#call the img from the select char scene
	change_img_character()
	
	# Pause the draw deck and card on hand 
	pause_deck_and_card_on_hand()

	
func _process(_delta):
	#starting the timer 
	label.text = str(roundf(timer.time_left))


func change_img_character():
	player.texture_normal = ResourceLoader.load(TeacherInfo[Global.character].img_game)
	
func _input(_event):
	if Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $Phase_Turn.visible:
		phase_turn.hide()
		emit_signal("textbox_closed")

func display_Text(text):
	phase_turn.show()
	phase_label.text = text

func Player1():
	await get_tree().create_timer(5).timeout
	
	player.texture_normal = ResourceLoader.load(TeacherInfo[Global.character].img_game)
	enemy.visible = true
	enemy.texture_normal = ResourceLoader.load(EnemyInfo[Global.enemy].img_game)
	display_Text("Your Turn")
	
	# Unpause the draw deck and card on hand 
	unpause_deck_and_card_on_hand()

	await get_tree().create_timer(1).timeout
	phase_turn.hide()
	await get_tree().create_timer(0.5).timeout
	
	
	attack_phase.disabled = false
	plant_phase.disabled = false
	
	#start timer 20second
	timer.start()
	action.show() 
	label.show()
	label.text = str(roundf(timer.time_left))
	

func EnemyTurn():
	pause_deck_and_card_on_hand()
	player.texture_normal = ResourceLoader.load(EnemyInfo[Global.enemy].img_game)
	enemy.visible = false
	await get_tree().create_timer(1).timeout
	display_Text("Enemy Turn")
	await get_tree().create_timer(1).timeout
	display_Text("Enemy Attack and Move")
	await get_tree().create_timer(2).timeout
	
	Player1()

func initialize():
	active_character = get_child(0)

func play_turn():
	await active_character.play_turn().completed
	var new_index : int = (active_character.get_index() +1) % get_child_count()
	active_character = get_child(new_index)

func _on_end_turn_button_pressed():
	pass


func _on_attack_phase_pressed():
	display_Text("Player 1 Attack")
	await self.textbox_closed
	await get_tree().create_timer(0.25).timeout
	attack_phase.disabled = true


func _on_plant_phase_pressed():
	display_Text("Player 1 Planting")
	await self.textbox_closed
	await get_tree().create_timer(0.25).timeout
	plant_phase.disabled = true
	

func _on_end_phase_pressed():
	display_Text("End Phase")
	label.hide()
	action.hide()
	await get_tree().create_timer(0.5).timeout
	timer.stop()
	EnemyTurn()

func _on_timer_player_timeout():
	await get_tree().create_timer(0.01).timeout
	display_Text("Timeout")
	label.hide()
	action.hide()
	await get_tree().create_timer(1).timeout
	display_Text("End Phase")
	await get_tree().create_timer(1).timeout
	EnemyTurn()

func pause_deck_and_card_on_hand():
	draw_pile_seed.disabled = true
	draw_pile_plant.disabled = true
	drop_point_card.process_mode = 4

func unpause_deck_and_card_on_hand():
	draw_pile_seed.disabled = false
	draw_pile_plant.disabled = false
	drop_point_card.process_mode = 0


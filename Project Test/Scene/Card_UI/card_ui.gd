class_name CardUI
extends Control

signal reparent_requested(which_card_ui: CardUI)

@onready var color: ColorRect = $Color
@onready var state: Label = $State
@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine
@onready var targets: Array[Node] = []
@onready var card_base = $Card_Base

var area_token 
var initial_img 
var type : String

func _ready() -> void:
	card_state_machine.init(self)
#	callPlantImg(str(randi_range(0,4)))


func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)


func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)


func _on_mouse_entered() -> void :
	card_state_machine._on_mouse_entered()


func _on_mouse_exited() -> void:
	card_state_machine._on_mouse_exited()


func _on_drop_point_detector_area_entered(area: Area2D) -> void :
#	print("dropin")
#	print(card_base.texture.resource_path)
	initial_img = card_base.texture.resource_path
#	initial_img.substr(29,1)
	var img_get_str = initial_img.rsplit("/",true,2)
#	print(img_get_str)
#	Rsplit array 2 = "res://Assets/Cards", "seed", "seed_0.png"

	if img_get_str[1] == "seed":
		card_base.texture = load("res://Assets/Token/Seed/" + img_get_str[2])		
	elif img_get_str[1] == "plant":
		card_base.texture = load("res://Assets/Token/Plant/" + img_get_str[2])
	
	# Get back the card size from token
	card_base.size = Vector2(80,76)
	var card_pos = get_local_mouse_position()
	card_pos.x -= 35
	card_pos.y -= 35
	card_base.position = card_pos
	
	
	if not targets.has(area):
		targets.append(area)


func _on_drop_point_detector_area_exited(area):
	print("dropexit")
	card_base.texture = load(initial_img)
	card_base.size = Vector2(150,210)
	card_base.position = Vector2.ZERO
	targets.erase(area)


func callSeedImg(p_type : String):
	type = p_type
	var textureCard = load("res://Assets/Cards/seed/seed_"+ type +".png")
	$Card_Base.texture = textureCard
	return get_node(".")

func callPlantImg(p_type : String):
	type = p_type
	var textureCard = load("res://Assets/Cards/plant/plant_"+ type +".png")
	$Card_Base.texture = textureCard
	return get_node(".")
	
func is_lower_value(card: Node) -> bool:
	var lower_type = int(type) < int(card.type)
	return lower_type

func matches_number(card: Node) -> bool:
	return type == card.type


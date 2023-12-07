extends Control

var card_scene := preload("res://Scene/Cards/card_2d.tscn")
var card_played: Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



## SEED
func _on_draw_pile_seed_pressed() -> void:
	var new_card := instance_card_seed()
	$Hand.add_child(new_card)
	update_hand_spacing()
	
	#move the card into the correct ordered place
	var cards = $Hand.get_children()
	for i in len(cards):
		if new_card.is_lower_value(cards[i]):
			$Hand.move_child(new_card, i)
			break


#func _on_Card_button_down(card: Node) -> void:
#	play_card(card)
#
#func play_card(card: Node) -> void:
#	if card.matches_number(card_played):
#		card_played.queue_free()
#		$Hand.remove_child(card)
#		update_hand_spacing()
#
#		add_playpile(card)


#func add_playpile(card: Node) -> void:
#	$Playpile.add_child(card)
#	card.position.x = 0
#	card.disconnect("button_down", Callable(self, "_on_Card_button_down"))
#	card_played = card


func instance_card_seed() -> Node :
	var type := str(randi_range(0,4))
	var card = card_scene.instantiate().callSeedImg(type) 
#	card.connect("button_down",Callable(self, "_on_Card_button_down").bind(card))
	return card 


## PLANT 
func _on_draw_pile_plant_pressed():
	var new_card := instance_card_plant()
	$Hand.add_child(new_card)
	update_hand_spacing()
	
	#move the card into the correct ordered place
	var cards = $Hand.get_children()
	for i in len(cards):
		if new_card.is_lower_value(cards[i]):
			$Hand.move_child(new_card, i)
			break

func instance_card_plant() -> Node :
	var type := str(randi_range(0,4))
	var card = card_scene.instantiate().callPlantImg(type) 
#	card.connect("button_down",Callable(self, "_on_Card_button_down").bind(card))
	return card 

func update_hand_spacing() -> void:
	var cards = $Hand.get_children()
	if len(cards) == 0: 
		return
	
	var hand_size = $Hand.size.x / 1.5;
	var space_remaining: float = hand_size - cards[0].size.x * len(cards)
	var spacing: float = space_remaining / len(cards) -1
	$Hand.add_theme_constant_override("separation", min(spacing, -40))





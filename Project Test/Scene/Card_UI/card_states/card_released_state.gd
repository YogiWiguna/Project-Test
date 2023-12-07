extends CardState

var played : bool
@onready var hand = get_node("/root/GameManager/Board_Canvas/Board/BoardUI/Hand")

func enter() -> void :
	card_ui.color.color = Color.DARK_VIOLET
	card_ui.state.text = "RELEASED"
	
	played = false
#	print(hand.get_children())
	if not card_ui.targets.is_empty():
		played = true
		print("play card for target(s) ", card_ui.targets)


func on_input(_event: InputEvent) -> void :
#	print("on-input")
	
	if not played:
#		
		transition_requested.emit(self, CardState.State.BASE)
		card_ui.reparent(hand)
	return
	

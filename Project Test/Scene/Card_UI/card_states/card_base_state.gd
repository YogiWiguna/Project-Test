extends CardState

@onready var collision_shape_2d = $"../../DropPointDetector/CollisionShape2D"
@onready var card_base = $"../../Card_Base"

func enter() -> void:
	if not card_ui.is_node_ready():
		await card_ui.ready
	
	print("cardBase")
	card_ui.reparent_requested.emit(card_ui)
	card_ui.color.color = Color.WEB_GREEN
	card_ui.state.text = "BASE"
#	card_ui.pivot_offset = Vector2.ZERO
	card_ui.size_flags_vertical = Control.SIZE_SHRINK_END
#	card_ui.custom_minimum_size = Vector2(150,210)
#	collision_shape_2d.position = Vector2(75,105)
	card_ui.z_index = 0
	

func on_gui_input(event: InputEvent) -> void :
	if event.is_action_pressed("left_mouse"):
		card_ui.pivot_offset = card_ui.get_global_mouse_position() - card_ui.global_position
		transition_requested.emit(self, CardState.State.CLICK)

func on_mouse_entered()-> void :
	card_ui.scale = Vector2(1.2 , 1.2)
	card_ui.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	card_ui.z_index = 1
#	card_ui.custom_minimum_size = Vector2(200,210)
#	collision_shape_2d.position = Vector2(100,105)
	


func on_mouse_exited()-> void :
	card_ui.scale = Vector2(1 , 1)
	card_ui.size_flags_vertical = Control.SIZE_SHRINK_END
	card_ui.z_index = 0
#	card_ui.custom_minimum_size = Vector2(150,210)
#	collision_shape_2d.position = Vector2(75,105)
	
	

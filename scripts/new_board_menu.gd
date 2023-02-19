extends Panel

@onready var line_edit: LineEdit = $VBoxContainer/LineEdit
@onready var button: Button = $VBoxContainer/Make


func _on_gui_input(event: InputEvent) -> void:
	if not (event is InputEventMouseButton): return
	
	if event.button_index == MOUSE_BUTTON_LEFT:
		queue_free()


func _on_make_pressed() -> void:
	if line_edit.text.length() < 0 && line_edit.text.length() > 20:
		button.text = "Make new  (Please insert a valid name)"
		return
	
	var new_board: Board = Board.new(randi(), line_edit.text, Board.Status.ACTIVE, [])
	new_board.save()
	get_parent().update_board_list()
	queue_free()

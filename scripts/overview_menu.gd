extends Control

@onready var boards_list: VBoxContainer = $BoardsList
@onready var make_new: Button = $MakeNew

signal update_list()

func _ready() -> void:
	update_list.connect(self.update_board_list)
	
	setup_project()
	update_board_list()

func update_board_list():
	for child in boards_list.get_children():
		boards_list.remove_child(child)
	
	
	var boards: PackedStringArray = load_boards()
	for file in boards:
		var new = Button.new()
		new.text = file
		boards_list.add_child(new)

func load_boards() -> PackedStringArray:
	var dir = DirAccess.open("user://boards")
	return  dir.get_files()


func setup_project() -> void:
	var dir: DirAccess = DirAccess.open("user://")
	if not dir.dir_exists("boards"):
		dir.make_dir("boards")


func _on_make_new_pressed() -> void:
	var modal: PackedScene = preload("res://scenes/new_board_menu.tscn")
	add_child(modal.instantiate())

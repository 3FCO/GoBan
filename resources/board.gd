class_name Board extends Resource

enum Status {
	ACTIVE,
	ARCHIVED
}

var id: int
var name: StringName
var status: Status
var lists: Array[CardList] = []

func _init(_id:int, _name:StringName, _status:Status, _lists:Array[CardList]) -> void:
	id = _id
	name = _name
	status = _status
	lists = _lists

func save():
	ResourceSaver.save(self, "user://boards/" + str(id) + ".tres")

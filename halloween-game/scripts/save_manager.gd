extends Node

const SAVE_PATH := "user://save_data.json"

var high_score: int = 0

func _ready():
	load_data()

func save_data():
	var data = {
		"high_score": high_score
	}
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(data))
		file.close()

func load_data():
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var data = JSON.parse_string(content)
		if typeof(data) == TYPE_DICTIONARY and "high_score" in data:
			high_score = data["high_score"]
		file.close()

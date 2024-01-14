extends Node

const SAVE_PATH = "res://savegame.bin"

func save_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"PlayerHP": Game.PlayerHP,
		"Gold": Game.Gold,
	}
	var json_str = JSON.stringify(data)
	file.store_line(json_str)
	
func load_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) and not file.eof_reached():
		var current_line = JSON.parse_string(file.get_line())
		if current_line:
			Game.PlayerHP = current_line['PlayerHP']
			Game.Gold = current_line['Gold']

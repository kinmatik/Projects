extends Node

func _ready():
	global.value += 10
	$Value.text = str(global.value)
	pass

func _go_to():
	get_tree().change_scene_to_file("res://second.tscn")
	pass

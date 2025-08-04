extends Node2D


func get_state_dict() -> Dictionary:
	var nodes = get_children()
	var dict = {}
	for node in nodes:
		dict[node.name] = node
	return dict

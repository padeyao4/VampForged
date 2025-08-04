extends Node2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		print("player enter")
		queue_free()
		pass
	pass # Replace with function body.

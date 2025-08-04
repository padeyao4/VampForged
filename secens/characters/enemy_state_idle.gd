extends Node2D

@onready var animation_player: AnimationPlayer = %AnimationPlayer


func _on_enter() -> void:
	print("idle enter")
	animation_player.play("idle")


func _update() -> void:
	pass


func _on_exit() -> void:
	print('exit idle')
	pass

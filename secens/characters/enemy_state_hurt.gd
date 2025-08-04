extends Node2D
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var sprite_2d: Sprite2D = $"../../Sprite2D"


func _on_enter():
	print("enter hurt")
	animation_player.play("hurt")
	pass


func _update():
	pass


func _on_exit():
	sprite_2d.visible = true
	print("exit hurt")
	pass

class_name Gun
extends Node2D

#const gun_len: int = 20

#var bullet_packed: PackedScene = preload("res://secens/gun/bullet.tscn")

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func get_direction() -> Vector2:
	return(get_global_mouse_position() - global_position).normalized()


func play_shoot() -> void:
	animation_player.play("shoot")
	#var bullet: Bullet = bullet_packed.instantiate()
	#bullet.scale *= 0.4
	#var direction = get_direction()
	#bullet.set_direction(direction)
	#bullet.global_position = direction * gun_len + global_position
	#add_child(bullet)


func play_reset() -> void:
	animation_player.play("RESET")

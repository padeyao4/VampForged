extends Node2D

var speed: float = 40
var direction: Vector2 = Vector2.ZERO

@onready var enemy: CharacterBody2D = $"../.."
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var sprite_2d: Sprite2D = $"../../Sprite2D"


func _on_enter() -> void:
	print("run enter")
	animation_player.play("run")
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	enemy.velocity = direction * speed
	_filp()


# 根据敌人移动方向翻转敌人的朝向
# 当敌人向左移动时(velocity.x < 0)，将scale.x设为-1使其朝向左边
# 当敌人向右移动时(velocity.x > 0)，将scale.x设为1使其朝向右边
func _filp() -> void:
	if enemy.velocity.x < 0:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false


func _on_exit() -> void:
	enemy.velocity = Vector2.ZERO
	print("exit run")


func _update():
	enemy.move_and_slide()

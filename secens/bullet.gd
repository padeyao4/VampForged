class_name Bullet
extends Node2D

var direction: Vector2 = Vector2.ZERO
var origin_position: Vector2 = Vector2.ZERO

var speed: int = 0
var throughs: int = 0
var len: int = 0


func _ready() -> void:
	speed = GameManager.bullet_speed
	throughs = GameManager.bullet_through
	len = GameManager.bullet_max_len
	pass


func _process(delta: float) -> void:
	position += delta * direction.normalized() * GameManager.bullet_speed


func _physics_process(delta: float) -> void:
	len -= (delta * direction.normalized() * speed).length()
	if throughs <= 0 or len <= 0:
		queue_free()


func set_direction(value: Vector2) -> void:
	direction = value
	rotation = direction.angle()

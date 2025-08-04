extends CharacterBody2D

var hp: int = 3
var speed: float = 40

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var state_machine: Node2D = $StateMachine
@onready var current_state = $StateMachine/Idle
@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	current_state._on_enter()
	# 随机设置初始状态
	# 设置初始位置
	global_position = Vector2(randf_range(0, 640), randf_range(0, 360))


func _physics_process(_delta: float) -> void:
	current_state._update()
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Bullet:
		var bullet: Bullet = area.get_parent()
		bullet.throughs -= 1
		hp -= GameManager.gun_damage
		if hp <= 0:
			var food = preload("res://secens/food.tscn").instantiate()
			food.position = position
			get_parent().add_child(food)
			queue_free()
			print("enemy free")
		else:
			# 播放受伤动画并切换到HURT状态
			current_state._on_exit()
			current_state = $StateMachine/Hurt
			current_state._on_enter()
		print("damege,left hp ", hp)


func _on_timer_timeout() -> void:
	current_state._on_exit()
	current_state = state_machine.get_children()[randi_range(0, 1)]
	current_state._on_enter()

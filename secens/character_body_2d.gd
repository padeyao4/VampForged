extends CharacterBody2D

var max_speed: float = 60

var time: float = 0 # 累计时间

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine: AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")
@onready var gun: Gun = $Gun


func _ready() -> void:
	animation_tree.active = true


func _process(_delta: float) -> void:
	gun.look_at(get_global_mouse_position())
	if get_local_mouse_position().x - gun.position.x < 0:
		if gun.scale.y > 0:
			gun.scale.y *= -1
	if get_local_mouse_position().x - gun.position.x > 0:
		if gun.scale.y < 0:
			gun.scale.y *= -1
	pass


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction.normalized() * max_speed
	if velocity.length() != 0:
		animation_tree.set("parameters/move/blend_position", velocity * Vector2(1, -1))
		animation_tree.set("parameters/idle/blend_position", velocity * Vector2(1, -1))
		state_machine.travel("move")
	else:
		state_machine.travel("idle")
	if Input.is_action_pressed("shoot") and time <= 0:
		gun.shoot()
		time = 1 / GameManager.bullet_nums
	else:
		gun.idle()
	time -= delta
	move_and_slide()

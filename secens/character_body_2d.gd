extends CharacterBody2D

var max_speed: float = 100

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine: AnimationNodeStateMachinePlayback = animation_tree.get("parameters/playback")


func _ready() -> void:
	animation_tree.active = true


func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction.normalized() * max_speed
	if velocity.length() != 0:
		animation_tree.set("parameters/move/blend_position", velocity * Vector2(1, -1))
		animation_tree.set("parameters/idle/blend_position", velocity * Vector2(1, -1))
		state_machine.travel("move")
	else:
		state_machine.travel("idle")
	move_and_slide()

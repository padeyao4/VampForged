extends CharacterBody2D

var max_speed: float = 100


func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction.normalized() * max_speed
	move_and_slide()

extends CharacterBody2D

var hp: int = 200

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _process(_delta: float) -> void:
	if velocity.x < 0:
		scale.x = -1
		pass
	pass

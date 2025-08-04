extends PanelContainer


func _ready() -> void:
	visible = false


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("menu"):
		visible = !visible
	pass

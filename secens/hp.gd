extends Label


func _ready() -> void:
	text = str(GameManager.player_hp)


func _process(_delta: float) -> void:
	text = str(GameManager.player_hp)

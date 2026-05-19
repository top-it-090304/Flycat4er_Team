extends Camera2D

var max_left = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Следуем за персонажем
	if get_parent():
		position = get_parent().position
	
	# Ограничиваем камеру слева
	if position.x < max_left:
		position.x = max_left

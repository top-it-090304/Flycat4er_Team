extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta):
	if $"../Mario/Mini_Mario".position.x >= 1550:
		make_buttons_transparent(0.3)

func make_buttons_transparent(alpha: float):
	$Left.modulate = Color(1, 1, 1, alpha)
	$Right.modulate = Color(1, 1, 1, alpha)
	$Jump.modulate = Color(1, 1, 1, alpha)

extends CanvasLayer

@export var mario: Node2D
var original_top = 333.0
var boss_top = 400.0
var in_boss_zone = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta):
	if not mario: return
	var mario_x = mario.global_position.x
	var camera = mario.get_node("Camera2D")
	if mario_x >= 1550 and mario_x <= 2272:
		if not in_boss_zone:
			in_boss_zone = true
			camera.limit_top = boss_top
	else:
		if in_boss_zone:
			in_boss_zone = false
			camera.limit_top = original_top

func make_buttons_transparent(alpha: float):
	$Left.modulate = Color(1, 1, 1, alpha)
	$Right.modulate = Color(1, 1, 1, alpha)
	$Jump.modulate = Color(1, 1, 1, alpha)

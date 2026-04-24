extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "TIME" + '\n' + str($"../../Mario/Mini_Mario".time)


func _on_checkpoint_lvl_2_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_exit_lvl_4_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

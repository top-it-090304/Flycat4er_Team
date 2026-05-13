extends Node2D

var hide_text = true

var the_end = false

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hide_text == true and the_end == false: 
		$"YouSavedOurPrincess!".visible = false
	elif hide_text == false and the_end == false: 
		$"YouSavedOurPrincess!".visible = true
	elif the_end == true: 
		TransitionScene.change_scene("res://happy_end.tscn")
	
func _on_timer_timeout() -> void:
	hide_text = false

func _on_timer_2_timeout() -> void:
	the_end = true

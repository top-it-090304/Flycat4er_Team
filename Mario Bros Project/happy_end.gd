extends Node2D

var vis = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if vis == false: 
		$Quit_game/Quit.visible = false 
	elif vis == true: 
		$Quit_game/Quit.visible = true 

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_timer_timeout() -> void:
	vis = true 

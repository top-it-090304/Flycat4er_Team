extends Node2D


func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func _on_bottom_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		get_tree().change_scene_to_file("res://menu.tscn")

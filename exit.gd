extends CanvasLayer

func _on_button_pressed() -> void:
	$"../Mini_Mario"
	get_tree().change_scene_to_file("res://menu.tscn")

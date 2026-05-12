extends CanvasLayer


func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass 
	
func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")

extends CanvasLayer


func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	$"../Mario/Mini_Mario".cur_lvl = 1
	get_tree().change_scene_to_file("res://menu.tscn")

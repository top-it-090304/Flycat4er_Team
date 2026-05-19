extends Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timeout() -> void:
	if $"../../Mario/Mini_Mario".time != 0:
		$"../../Mario/Mini_Mario".time -= 1
	elif $"../../Mario/Mini_Mario".cur_lvl == 1: 
		get_tree().change_scene_to_file("res://level.tscn")
	elif $"../../Mario/Mini_Mario".cur_lvl == 2: 
		get_tree().change_scene_to_file("res://level_2.tscn")
	elif $"../../Mario/Mini_Mario".cur_lvl == 3: 
		get_tree().change_scene_to_file("res://level_3.tscn")
	elif $"../../Mario/Mini_Mario".cur_lvl == 4: 
		get_tree().change_scene_to_file("res://level_4.tscn")

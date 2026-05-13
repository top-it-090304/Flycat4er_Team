extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../Telepotr_to_end".but == true: 
		$Button.visible = false 
		$"../MobileControl".visible = false

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")

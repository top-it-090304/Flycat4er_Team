extends CharacterBody2D

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if $"../../Mario/Mini_Mario".break_bridge == true: 
		queue_free()

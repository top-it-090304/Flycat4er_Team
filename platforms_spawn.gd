extends Node2D

var platform_preload = preload("res://platform.tscn")


func _on_timer_timeout() -> void:
	platform_1_spawn()

func platform_1_spawn():
	var platform = platform_preload.instantiate()
	platform.position = Vector2(100, 500)
	$".".add_child(platform)

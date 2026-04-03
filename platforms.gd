extends Node2D

var platform_preload = preload("res://platform.tscn")


func _on_timer_timeout() -> void:
	platform_spawn()

func platform_spawn():
	var platform = platform_preload.instantiate()
	platform.position = Vector2(2225, 635)
	$".".add_child(platform)

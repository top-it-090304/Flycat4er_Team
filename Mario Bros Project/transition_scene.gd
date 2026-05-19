extends CanvasLayer

func _ready():
	$ColorRect.color = Color(0, 0, 0, 0)

func change_scene(target: String) -> void:
	$AnimationPlayer.play("Fade_to_black")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("Fade_to_black")

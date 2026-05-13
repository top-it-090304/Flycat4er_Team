extends Area2D

var sound_cnt = 0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		body.break_bridge = true
		if !$Bridge_break.playing and sound_cnt == 0:
			$Bridge_break.play()
			sound_cnt += 1

extends Area2D

var speed = 100.0

func _physics_process(delta):
	position.x -= speed * delta
	if position.x < 1150:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		$"../../Mario/Mini_Mario".health -= 1
		$"../../Mario/Mini_Mario".Mario_heat = true

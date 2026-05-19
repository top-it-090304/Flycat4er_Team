extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

var speed = 25

var alive = true

var direction = -1

func _physics_process(delta: float) -> void:
	if alive == true: 
		if position.y <= 410:
			direction *= -1
		elif position.y >= 520:  
			direction *= -1
		velocity.y = speed * direction
		anim.play("Fly")
	if alive == false: 
		$CollisionShape2D.disabled = true
		$Turtle_fly_body/CollisionShape2D.disabled = true
		velocity.y = 225
		anim.play("Die")
	move_and_slide()

func _on_turtle_fly_head_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		alive = false
		body.velocity.y = -300
		$"../../Mario/Mini_Mario".score += 100
		if !$Hit_sound.playing:
			$Hit_sound.play()
		
func _on_turtle_fly_body_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		$"../../Mario/Mini_Mario".health -= 1
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score -= 100

extends CharacterBody2D # НА ВОЗВЫШЕННОСТИ

@onready var anim = $AnimatedSprite2D

var speed = -25

var direction = 1

var trigger = false

var alive = true

func _physics_process(delta: float) -> void:
	if trigger == true:
		velocity.x = direction * speed
		if not is_on_floor():
			velocity += get_gravity() * delta
		if alive == true: 
			anim.play("Walk")
		if alive == false: 
			velocity.x = 0
			death_mushroom_under()
	elif trigger == false: 
		velocity.x = 0 
		anim.play("Walk")
		
	move_and_slide()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		trigger = true 

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		trigger = false 
		
func _on_head_body_entered(body: Node2D) -> void: #голова 
	if body.name == "Mini_Mario":
		if !$Dead_sound.playing:
				$Dead_sound.play()
		body.velocity.y -= 125
		$"../../Mario/Mini_Mario".score += 100
		alive = false
		
func _on_body_body_entered(body: Node2D) -> void: #туловище 
	if body.name == "Mini_Mario":
		$"../../Mario/Mini_Mario".health -= 1
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score -= 100
	elif body.name == "TileMap": # or body.is_in_group("turtle_under"):
		direction *= -1
	elif body.name == "Turtle_underground":
		if !$Dead_sound.playing:
				$Dead_sound.play()
		alive = false
		$Body/Body_colision.set_deferred("disabled", true)
		$CollisionShape2D.set_deferred("disabled", true)
		$"../../Mario/Mini_Mario".score += 100
		anim.play("Die")
		await $Dead_sound.finished
		queue_free()

func death_mushroom_under():
	anim.play("Die")
	$Body/Body_colision.disabled = true
	await anim.animation_finished
	queue_free()

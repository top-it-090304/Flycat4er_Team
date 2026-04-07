extends CharacterBody2D # НА ВОЗВЫШЕННОСТИ

@onready var anim = $AnimatedSprite2D

var speed = -25

var direction = 1

var trigger = false

var alive = true

func _physics_process(delta: float) -> void:
	print("speed: ", speed, " | direction: ", direction, " | velocity.x: ", velocity.x)
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
		body.velocity.y -= 125
		$"../../Mario/Mini_Mario".score += 100
		alive = false
		
func _on_body_body_entered(body: Node2D) -> void: #туловище 
	if body.name == "Mini_Mario":
		$"../../Mario/Mini_Mario".health -= 1
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score -= 100
	elif body.name == "TileMap" or body.is_in_group("reverse_mush"):
		direction *= -1 

func death_mushroom_under():
	anim.play("Die")
	$Body/Body_colision.disabled = true
	await anim.animation_finished
	queue_free()

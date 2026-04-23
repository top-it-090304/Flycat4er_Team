extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

var trigger = false

var speed = -20

var direction = 1

var alive = true

var left_bounce = false

var right_bounce = false

var shots = 0

func _physics_process(delta: float) -> void:
	if alive == true:
		if position.x >= 1885:
			direction *= -1
			$AnimatedSprite2D.flip_h = false 
		elif position.x <= 1762:
			direction *= -1
			$AnimatedSprite2D.flip_h = true
		velocity.x = speed * direction
		# print("Pos: ", position.x, " Dir: ", direction, " Vel: ", velocity.x)
		if not is_on_floor():
			velocity += get_gravity() * delta
		anim.play("Walk")
	elif alive == false:
		if not is_on_floor():
			velocity += get_gravity() * delta
		$Turtle_body/Body_collision.disabled = true #после того, как убили черепаху, отключчаем тело
		velocity.x = 0
		anim.play("Die")
		if left_bounce == true: 
			velocity.x = 250
		if right_bounce == true: 
			velocity.x = -250
	move_and_slide()
	
	
func _on_trigger_area_body_entered(body: Node2D) -> void: # тригерная зона черепахи
	if body.name == "Mini_Mario":
		trigger = true

func _on_turtle_head_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		alive = false
		body.velocity.y -= 125
		if !$Heat_sound.playing:
			$Heat_sound.play()
		if shots < 1:
			$"../Mario/Mini_Mario".score += 100
			shots += 1
			
func _on_turtle_body_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		$"../Mario/Mini_Mario".health -= 1
		$"../Mario/Mini_Mario".Mario_heat = true
		if $"../Mario/Mini_Mario".score > 0:
			$"../Mario/Mini_Mario".score -= 100

func _on_left_bounce_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario" and shots == 1: 
		$"../Mario/Mini_Mario".score += 100
		left_bounce = true
		if !$Heat_sound.playing:
			$Heat_sound.play()
		shots += 1
	elif body.name == "Mini_Mario" and shots == 2: 
		$"../Mario/Mini_Mario".health -= 1
		$"../Mario/Mini_Mario".Mario_heat = true

func _on_right_bounce_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario" and shots == 1: 
		$"../Mario/Mini_Mario".score += 100
		right_bounce = true
		if !$Heat_sound.playing:
			$Heat_sound.play()
		shots += 1
	elif body.name == "Mini_Mario" and shots == 2: 
		$"../Mario/Mini_Mario".health -= 1
		$"../Mario/Mini_Mario".Mario_heat = true

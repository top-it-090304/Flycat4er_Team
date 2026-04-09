extends CharacterBody2D 

@onready var anim = $AnimatedSprite2D

var speed = -20

var direction = 1

var trigger = false

var alive = true

var shots = 0

var left_bounce = false

var right_bounce = false

func _physics_process(delta: float) -> void:
	#print("shots: ", shots)
	if trigger == true: 
		velocity.x = direction * speed
		if not is_on_floor():
			velocity += get_gravity() * delta
		if alive == true: 
			anim.play("Walk")
		if alive == false: 
			$Turle_body/Body_colision.disabled = true # убираем смерть от черепахи
			velocity.x = 0
			anim.play("Die")
		if left_bounce == true: 
			velocity.x = direction * 250
		if right_bounce == true: 
			velocity.x = direction * -250
	elif trigger == false: 
		velocity.x = 0
		anim.play("Walk")
	move_and_slide()
	
func _on_area_2d_body_entered(body: Node2D) -> void: 
	if body.name == "Mini_Mario":
		trigger = true 
# не прописываем выход из зоны, т.к. в дальнейшем черепаха будет двигаться сама

func _on_turtle_head_body_entered(body: Node2D) -> void: #голова
	if body.name == "Mini_Mario":
		if !$Dead_sound.playing:
				$Dead_sound.play()
		alive = false
		body.velocity.y -= 125
		if shots < 1:
			$"../../Mario/Mini_Mario".score += 100
			shots += 1
	
func _on_turle_body_body_entered(body: Node2D) -> void: # туловище
	if body.name == "Mini_Mario":
		$"../../Mario/Mini_Mario".health -= 1
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score -= 100
	elif (body.name == "TileMap" or body.is_in_group("mushroom_under")) and direction < 0:
		direction *= -1
		$AnimatedSprite2D.flip_h = false 
	elif (body.name == "TileMap" or body.is_in_group("mushroom_under")) and direction > 0:
		direction *= -1
		$AnimatedSprite2D.flip_h = true

func _on_left_bounce_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario" and shots == 1:
		if !$Dead_sound.playing:
				$Dead_sound.play()
		$"../../Mario/Mini_Mario".score += 100
		left_bounce = true
		shots += 1
	elif body.name == "Mini_Mario" and shots == 2:
		$"../../Mario/Mini_Mario".health -= 1
		$"../../Mario/Mini_Mario".Mario_heat = true
	elif (body.name == "TileMap") and direction < 0:
		if !$Dead_sound.playing:
				$Dead_sound.play()
		direction *= -1
		$AnimatedSprite2D.flip_h = false 
	elif (body.name == "TileMap") and direction > 0:
		if !$Dead_sound.playing:
				$Dead_sound.play()
		direction *= -1
		$AnimatedSprite2D.flip_h = true

func _on_right_bounce_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario" and shots == 1: # первый удар марио по боку
		if !$Dead_sound.playing:
				$Dead_sound.play()
		$"../../Mario/Mini_Mario".score += 100
		right_bounce = true
		shots += 1
	elif body.name == "Mini_Mario" and shots == 2: # второй удар марио по боку
		$"../../Mario/Mini_Mario".health -= 1
		$"../../Mario/Mini_Mario".Mario_heat = true
	elif (body.name == "TileMap") and direction < 0:
		if !$Dead_sound.playing:
				$Dead_sound.play()
		direction *= -1
		$AnimatedSprite2D.flip_h = false 
	elif (body.name == "TileMap") and direction > 0:
		if !$Dead_sound.playing:
				$Dead_sound.play()
		direction *= -1
		$AnimatedSprite2D.flip_h = true

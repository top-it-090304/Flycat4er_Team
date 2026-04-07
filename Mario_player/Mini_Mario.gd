extends CharacterBody2D


const SPEED = 100.0

const JUMP_VELOCITY = -310.0

var score = 0

var gravity = 750.0

var health = 1

var Mario_heat = false # создано для подсчета смертей

var time = 350 

var coins = 0

@onready var anim = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump_mini")
	
	if Input.is_action_just_released("ui_accept") and velocity.y < 0:
		velocity.y *= 0.4
		anim.play("Jump_mini")
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction > 0 and health > 0 and Mario_heat == false:
		$AnimatedSprite2D.flip_h = false
		velocity.x = move_toward(velocity.x, SPEED * direction, 4)
		if velocity.y == 0: 
			anim.play("Walk_mini")
		if velocity.y < 0:
			anim.play("Jump_mini")
		if velocity.y > 0:
			anim.play("Jump_mini")
	elif direction == 0 and velocity.y == 0 and health > 0 and Mario_heat == false:
		velocity.x = move_toward(velocity.x, 0, 8)
		anim.play("Idle_mini")
	elif direction < 0 and health > 0 and Mario_heat == false:
		$AnimatedSprite2D.flip_h = true
		velocity.x = move_toward(velocity.x, SPEED * direction, 4)
		if velocity.y == 0: 
			anim.play("Walk_mini")
		if velocity.y < 0:
			anim.play('Jump_mini')
		if velocity.y > 0: 
			anim.play('Fall_mini')
	elif velocity.y > 0 and health > 0 and Mario_heat == false: 
		anim.play("Fall_mini")
	elif health <= 0 and Mario_heat == true: 
		$CollisionShape2D.disabled = true
		anim.play("Death_mini")
		velocity.x = 0
		velocity.y = -20
		move_and_slide()
		await anim.animation_finished
		get_tree().change_scene_to_file.call_deferred("res://menu.tscn")
		queue_free()
	elif health > 0 and Mario_heat == true:
		Mario_heat = false	
	move_and_slide()
	

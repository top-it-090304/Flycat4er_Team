extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

var speed = -25

var alive = true

var direction = 1

var trigger = false

func _physics_process(delta: float) -> void: #обновление 60 раз в секунду
	if trigger == true:
		if not is_on_floor():
			velocity += get_gravity() * delta
		velocity.x = direction * speed
		if alive == true: 
			anim.play("Walk")
		if alive == false: 
			velocity.x = 0
			death_mashroom()
	elif trigger == false: 
		velocity.x = 0
		anim.play("Walk")
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario": 
		body.velocity.y = -125
		$"../../Mario/Mini_Mario".score += 100
		alive = false

func _on_site_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario": 
		$"../../Mario/Mini_Mario".health -= 1
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score -= 100
	elif body.name == "TileMap": 
		direction *= -1 

func _on_trigger_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		trigger = true
		
func _on_trigger_body_exited(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		trigger = true

func death_mashroom ():
	anim.play("Die")
	$Site/Death.disabled = true
	await anim.animation_finished
	queue_free()
	

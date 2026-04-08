extends CharacterBody2D

var original_position: Vector2

var is_moving = false

var moving_up = false

var move_distance = -5.0

var move_speed= 60

func _ready():
	original_position = self.position

func _physics_process(delta: float) -> void:
	if is_moving:
		if moving_up:
			# Двигаемся вверх
			velocity.y = move_speed * sign(move_distance)
			# Проверяем, достигли ли верхней точки
			if position.y <= original_position.y + move_distance:
				moving_up = false
				velocity.y = 0
		else:
			# Двигаемся вниз (возвращаемся)
			velocity.y = -move_speed * sign(move_distance)
			# Проверяем, вернулись ли на исходную позицию
			if position.y >= original_position.y:
				position.y = original_position.y
				velocity.y = 0
				is_moving = false
		
		move_and_slide()
	else:
		velocity.y = 0


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario" and is_moving == false:
		is_moving = true
		moving_up = true

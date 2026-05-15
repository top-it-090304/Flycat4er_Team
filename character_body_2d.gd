extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

var trigger = false
var alive = true

const JUMP_VELOCITY = -200.0
@export var move_speed: float = 25.0
@export var move_range_start: float = 2065.0
@export var move_range_end: float = 2065.0
@export var jump_chance: float = 0.015 
@export var change_dir_chance: float = 0.005

var current_dir: int = 1 

@export var firebullet_scene: PackedScene
@export var min_fire_y: float = 450.0
@export var max_fire_y: float = 550.0
@export var shoot_interval: float = 1.2

var shoot_timer: float = 0.0
var second_shot_pending: bool = false

func _physics_process(delta):
	if trigger == true and alive == true: 
		anim.play("Walk")
		if not is_on_floor():
			velocity += get_gravity() * delta
		handle_movement()
		if is_on_floor() and randf() < jump_chance:
			velocity.y = JUMP_VELOCITY
		handle_shooting(delta)
		move_and_slide()
	elif alive == false: 
		queue_free()

func handle_movement():
	if randf() < change_dir_chance:
		current_dir = -current_dir

	velocity.x = move_speed * current_dir

	if global_position.x <= move_range_start:
		current_dir = 1
	elif global_position.x >= move_range_end:
		current_dir = -1
	anim.flip_h = (current_dir == 1)
	

func handle_shooting(delta):
	shoot_timer -= delta
	if not second_shot_pending and shoot_timer <= 0:
		spawn_fireball()
		second_shot_pending = true
		shoot_timer = 0.15 
	elif second_shot_pending and shoot_timer <= 0:
		spawn_fireball()
		second_shot_pending = false
		shoot_timer = shoot_interval

func spawn_fireball():
	var fireball = firebullet_scene.instantiate()
	var random_y = randf_range(min_fire_y, max_fire_y)
	fireball.position = Vector2(global_position.x + 40, random_y)
	get_parent().add_child(fireball)
	if !$AudioStreamPlayer.playing: 
		$AudioStreamPlayer.play()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		trigger = true

func _on_death_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario":
		$"../../Mario/Mini_Mario".health -= 1
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score = 0

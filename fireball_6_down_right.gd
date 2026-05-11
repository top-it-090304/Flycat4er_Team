extends Node2D

@export var rotation_speed: float = 2.3
@export var direction: int = -1

func _physics_process(delta):
	rotate(rotation_speed * direction * delta)


func _on_fireball_1_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario": 
		$"../../Mario/Mini_Mario".health = 0
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score -= 100

func _on_fireball_2_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario": 
		$"../../Mario/Mini_Mario".health = 0
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score -= 100

func _on_fireball_7_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario": 
		$"../../Mario/Mini_Mario".health = 0
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score -= 100

func _on_fireball_3_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario": 
		$"../../Mario/Mini_Mario".health = 0
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score -= 100

func _on_fireball_4_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario": 
		$"../../Mario/Mini_Mario".health = 0
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score -= 100

func _on_fireball_5_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario": 
		$"../../Mario/Mini_Mario".health = 0
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score -= 100

func _on_fireball_6_body_entered(body: Node2D) -> void:
	if body.name == "Mini_Mario": 
		$"../../Mario/Mini_Mario".health = 0
		$"../../Mario/Mini_Mario".Mario_heat = true
		if $"../../Mario/Mini_Mario".score > 0:
			$"../../Mario/Mini_Mario".score -= 100

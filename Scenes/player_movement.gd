extends CharacterBody2D

const ATAQUE = preload("res://Ataque.tscn")

@export var movement_speed : float = 150
var character_direction : Vector2

func handle_ataque():
	var ataque = ATAQUE.instantiate()
	ataque.position = get_global_position()
	if(Input.is_action_just_pressed("ataque_baixo")):
		%sprite.animation = "Attack"
		ataque.set_direcao(Vector2.DOWN)
	if(Input.is_action_just_pressed("ataque_cima")):
		%sprite.animation = "Attack"
		ataque.set_direcao(Vector2.UP)
	if(Input.is_action_just_pressed("ataque_direita")):
		%sprite.animation = "Attack"
		ataque.set_direcao(Vector2.RIGHT)
	if(Input.is_action_just_pressed("ataque_esquerda")):
		%sprite.animation = "Attack"
		ataque.set_direcao(Vector2.LEFT)
		
	if(ataque.direcao):
		get_parent().add_child(ataque)

func _physics_process(delta):
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")
	
	if character_direction.x > 0: %sprite.flip_h = false
	if character_direction.x < 0: %sprite.flip_h = true
	
	if character_direction:
		velocity = character_direction * movement_speed
		if %sprite.animation != "Walking": %sprite.animation = "Walking"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		if %sprite.animation != "Attack": %sprite.animation = "Idle"
		
	move_and_slide()
	
	handle_ataque()

extends CharacterBody2D

@export var move_speed: float = 500.0
@export var vertical_speed: float = 500.0

var rebote_activo := false
var rebote_timer := 0.0

func _physics_process(delta):
	if rebote_activo:
		rebote_timer -= delta
		if rebote_timer <= 0:
			rebote_activo = false
		move_and_slide()
		return

	var direction = Vector2.ZERO
	direction.x = 1  # Movimiento hacia la derecha

	if Input.is_action_pressed("move_forward") and global_position.y > 79:
		direction.y -= 1
	if Input.is_action_pressed("move_back") and global_position.y < 579:
		direction.y += 1

	# Interpolamos la velocidad actual hacia la dirección deseada para suavizar el cambio
	velocity = velocity.lerp(direction.normalized() * move_speed, 0.1)

	move_and_slide()

	# Mover la cámara
	$"../Camera2D".global_position.x = $Node2D.global_position.x


func rebotar(origen: Vector2):
	var direccion_rebote = (global_position - origen).normalized()
	velocity = direccion_rebote * move_speed
	rebote_activo = true
	rebote_timer = 0.2

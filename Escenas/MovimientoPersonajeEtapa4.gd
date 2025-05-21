extends CharacterBody2D

@export var velocidad := 250  # píxeles por segundo
var direccion := 1  # 1 = derecha, -1 = izquierda

func _process(delta):
	position.x += direccion * velocidad * delta

	# Si llega a cierto límite, cambia de dirección
	if Input.is_action_pressed("move_left"):
		direccion = -1
	if Input.is_action_pressed("move_right"):
		direccion = 1

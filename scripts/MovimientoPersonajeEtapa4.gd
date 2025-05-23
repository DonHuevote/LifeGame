extends CharacterBody2D

@export var velocidad := 250  # píxeles por segundo
var direccion := 1  # 1 = derecha, -1 = izquierda
var sePuedeMover = true
func _process(delta):
	
	position.x += direccion * velocidad * delta
	if sePuedeMover:
		# Si llega a cierto límite, cambia de dirección
		if Input.is_action_pressed("move_left"):
			direccion = -1
		if Input.is_action_pressed("move_right"):
			direccion = 1



func _on_area_de_caida_body_exited(body: Node2D) -> void:
	if body.is_in_group("Personaje"):
		direccion = direccion * -1
		sePuedeMover = false
		
	pass # Replace with function body.


func _on_area_de_caida_body_entered(body: Node2D) -> void:
	if body.is_in_group("Personaje"):
		sePuedeMover = true
	pass # Replace with function body.

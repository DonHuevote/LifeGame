extends CharacterBody3D

const SPEED := 1.0
const JUMP_VELOCITY := 2
const GRAVITY := 9.8
var vidas = 3

func _physics_process(delta):
	var direction = Vector3.ZERO
	var moving = false # Bandera para saber si se está moviendo

	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
		moving = true
	if Input.is_action_pressed("move_back"):
		direction += transform.basis.z
		moving = true
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
		moving = true
	if Input.is_action_pressed("move_right"):
		direction += transform.basis.x
		moving = true

	direction = direction.normalized()

	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED


	# Gravedad y salto
	if not is_on_floor():
		velocity.y -= GRAVITY * delta
	else:
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY

	move_and_slide()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Personaje":
		vidas -= 1
		$"../Label".text = "VIDAS: "+str(vidas)
		if vidas < 0:
			get_tree().change_scene_to_file("res://Escenas/PantallaDePerder.tscn")
	pass # Replace with function body.

extends Node2D

@export var delay := 4.0  # segundos que se muestra la pantalla

func _ready() -> void:
	$ColorRect.color = Color.BLACK

	match Globalsed.nivel:
		1:
			$Label.text = "Nivel 1: Nacimiento\n\nBienvenido a la vida. Cada comienzo es una aventura, ¡disfrútala!"
		2:
			$Label.text = "Nivel 2: Aprendiendo a caminar\n\nTus primeros pasos. Recuerda, no tengas miedo de caer, ¡así se aprende!"
		3:
			$Label.text = "Nivel 3: Aprendiendo a leer\n\nAh, qué lindo leer. ¡Pero cuidado con el papel, no te cortes!"
		4:
			$Label.text = "Nivel 4: Primer amor\n\n¡Ahh, el primer amor! Como olvidarlo, ¡disfruta cada latido!"
		5:
			$Label.text = "Nivel 5: Trabajo\n\nUff, trabajar... qué divertido... ¡A dar lo mejor!"
		6:
			$Label.text = "Nivel 6: Ascendiendo al cielo\n\nTus últimos respiros fueron dados. Trata de no desperdiciar nada, todo cuenta."
		_:
			$Label.text = "Nivel desconocido\n\n Como llegaste aca ?."

	# Esperar el delay y cambiar escena
	await get_tree().create_timer(delay).timeout
	cambiar_escena()

func cambiar_escena() -> void:
	match Globalsed.nivel:
		1:
			get_tree().change_scene_to_file("res://Escenas/etapa_1_nacimiento.tscn")
		2:
			get_tree().change_scene_to_file("res://Escenas/Etapa_2_Caminar.tscn")
		3:
			get_tree().change_scene_to_file("res://Escenas/etapa_3_lectura.tscn")
		4:
			get_tree().change_scene_to_file("res://Escenas/etapa_4_PrimerAmor.tscn")
		5:
			get_tree().change_scene_to_file("res://Escenas/Etapa_5_Trabajo.tscn")
		6:
			get_tree().change_scene_to_file("res://Escenas/etapa6_CielitoLindo.tscn")
		_:
			print("Nivel no válido")

extends Node2D

@onready var texto_objetivo = $RichTextLabel
@onready var dia = $Fecha
var diasPasados = 1
var palabra = "los lobos terribles han sido traidos a la vida real, gracias a la modificacion de adn, esto como afecta a la economia, es simple, el precio de la poli cola va a subir, profe, apruebeme, y por lo tanto la inflacion estimada de enero va a subir"
var indice_actual = 0

func _ready():
	Globalsed.nivel = 5 
	texto_objetivo.bbcode_enabled = true
	actualizar_texto()

func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		var letra_presionada := OS.get_keycode_string(event.keycode).to_lower()

		# Saltar espacios, comas y puntos automáticamente
		while indice_actual < palabra.length() and palabra[indice_actual] in [" ", ",", "."]:
			indice_actual += 1

		if indice_actual < palabra.length():
			var letra_objetivo := palabra[indice_actual].to_lower()

			if letra_presionada == letra_objetivo:
				indice_actual += 1
				actualizar_texto()

				# Volver a saltar espacios, comas y puntos si hay
				while indice_actual < palabra.length() and palabra[indice_actual] in [" ", ",", "."]:
					indice_actual += 1

				if indice_actual == palabra.length():
					get_tree().change_scene_to_file("res://Escenas/etapa6_CielitoLindo.tscn")
					print("¡Texto completo!")


func actualizar_texto():
	var texto_formateado = ""

	for i in palabra.length():
		var letra = palabra[i]

		if i < indice_actual:
			texto_formateado += "[color=green]" + letra + "[/color]"
		else:
			texto_formateado += "[color=gray]" + letra + "[/color]"

	texto_objetivo.text = texto_formateado


func _on_timer_timeout() -> void:
	diasPasados += 1
	if diasPasados == 2:
		$Fecha.text = "FECHA: MARTES"
	if diasPasados == 3:
		$Fecha.text = "FECHA: MIERCOLES"
	if diasPasados == 4:
		$Fecha.text = "FECHA: JUEVES"
	if diasPasados == 5:
		$Fecha.text = "FECHA: VIERNES"
	if diasPasados == 6:
		$Fecha.text = "FECHA: SABADO"
	if diasPasados == 7:
		$Fecha.text = "FECHA: DOMINGO"
		await get_tree().create_timer(1.0).timeout
		$Fecha.text = "PERDISTE"
		get_tree().change_scene_to_file("res://Escenas/PantallaDePerder.tscn")
		

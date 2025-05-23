extends Node2D

func _ready() -> void:
	if  Globalsed.nivel == 1 :
		$TextureRect.texture = load("res://Sprites/Etapa1_Perder.png")
		$Descripcion.text = "La ciugueña no llego a destino, no naces!!"
	if  Globalsed.nivel == 2 :
		$TextureRect.texture =  load("res://Sprites/Etapa2_Perder.png")
		$Descripcion.text = "De tanto caerte te resignas, y vives toda tu vida gateando"
	if  Globalsed.nivel == 3 :
		$TextureRect.texture =  load("res://Sprites/Etapa3_Perder.png")
		$Descripcion.text = "Eres un analfabeta, probablemente no sepas leer esto"
	if  Globalsed.nivel == 4 :
		$TextureRect.texture =  load("res://Sprites/Etapa4_Perder.png")
		$Descripcion.text = "Te rechazan, y vives toda tu vida con un corazon roto"
	if  Globalsed.nivel == 5 :
		$TextureRect.texture =  load("res://Sprites/Etapa5_Perder.png")
		$Descripcion.text = "Te despiden, no tienes dinero, vives en la inmundicia"
	if  Globalsed.nivel == 6 :
		$Descripcion.text = "Te vas al infierno, y seras torturado de por vida laburando"
		$TextureRect.texture =  load("res://Sprites/Etapa6_Perder.png")



func _on_button_pressed() -> void:
	if  Globalsed.nivel == 1 :
		get_tree().change_scene_to_file("res://Escenas/etapa_1_nacimiento.tscn")
	if  Globalsed.nivel == 2 :
		get_tree().change_scene_to_file("res://Escenas/Etapa_2_Caminar.tscn")
	if  Globalsed.nivel == 3 :
		get_tree().change_scene_to_file("res://Escenas/etapa_3_lectura.tscn")
	if  Globalsed.nivel == 4 :
		get_tree().change_scene_to_file("res://Escenas/etapa_4_PrimerAmor.tscn")
	if  Globalsed.nivel == 5 :
		get_tree().change_scene_to_file("res://Escenas/Etapa_5_Trabajo.tscn")
	if  Globalsed.nivel == 6 :
		get_tree().change_scene_to_file("res://Escenas/etapa6_CielitoLindo.tscn")
	pass # Replace with function body.

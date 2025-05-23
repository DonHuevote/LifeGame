extends Node2D

@export var objeto_escena: PackedScene
@onready var zona_spawn = $AreaDeCaida


var generados := 0
var progreso
var cantidad = 37
func _ready():
	progreso = get_node("/root/Etapa4PrimerAmor/BarraDeAmor/Progreso")
	$Timer.start()
	Globalsed.nivel = 4


func _process(delta: float) -> void:
	if progreso.size.x >= 367:
		print("ganaste")
		get_tree().change_scene_to_file("res://Escenas/Etapa_5_Trabajo.tscn")
	if generados >= cantidad:
		get_tree().change_scene_to_file("res://Escenas/PantallaDePerder.tscn")
		print("Perdiste")
		return


func _on_timer_timeout() -> void:
	var shape = zona_spawn.get_node("CollisionShape2D").shape
	var rect = Rect2(shape.extents, shape.extents *100)
	
	var zona_pos = zona_spawn.position
	
	if generados >= cantidad:
		$Timer.stop()
		return
	var instancia = objeto_escena.instantiate()
	var pos = Vector2(
		
		randf_range(rect.position.x, rect.position.x + rect.size.x),
		0
	)
	instancia.position = pos
	add_child(instancia)
	
	pass # Replace with function body.


func aumentarProgreso() -> void:
	progreso.set_size(Vector2(progreso.size.x, progreso.size.y+10))
	print(str(progreso.size.y))







func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "corazon":
		generados += 1
	pass # Replace with function body.

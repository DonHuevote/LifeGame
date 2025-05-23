extends Node3D

func  _ready() -> void:
	Globalsed.nivel = 3
	$hoja1.rotating = true
	
func _process(delta: float) -> void:
	for i in range(1, 9):
		var hoja_actual = get_node("hoja" + str(i))
		var hoja_siguiente = get_node("hoja" + str(i + 1))
	
		if hoja_actual.end and not hoja_siguiente.end:
			hoja_siguiente.rotating = true
			break  # Solo activar una hoja a la vez

	if get_node("hoja9").end:
		Globalsed.nivel = 4
		get_tree().change_scene_to_file("res://Escenas/LevelIntro.tscn")

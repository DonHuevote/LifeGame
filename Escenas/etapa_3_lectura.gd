extends Node3D

func  _ready() -> void:
	$hoja1.rotating = true
	
func _process(delta: float) -> void:
	if $hoja1.rotation_degrees.x > -0.5:
		$hoja2.rotating = true
	if $hoja2.rotation_degrees.x > -0.5:
		$hoja3.rotating = true
		

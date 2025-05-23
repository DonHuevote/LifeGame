extends CharacterBody2D

var target_rotation_deg = 20
var rotation_speed = 50  # grados por segundo
var pasosDados = 0
var goingRight = true
var estaDentro = false
var yaApreto = false
var count = 0
var tiempo = 3
var isReady = false
@onready var animationPlayer = $"../Jugador/AnimatedSprite2D"
var estaCaido = false

func _process(delta):
	Globalsed.nivel = 2
	if isReady:
		tiempo -= 1 * delta
		count -= 1 * delta
		var tiempoRedondeado : int = round(tiempo)
		$"../tiempo".text = str(tiempoRedondeado)
		
		if count <= 0:
			$"../aviso".text = ""
		if goingRight:
			rotation_degrees = rotation_degrees+rotation_speed * delta
			if rotation_degrees >= 20:
				goingRight = false
		if !goingRight:
			rotation_degrees = rotation_degrees-rotation_speed * delta
			if rotation_degrees <= -20:
				goingRight = true
				
		if Input.is_action_pressed("caminar"):
			if estaDentro && !yaApreto && !estaCaido: 
				animationPlayer.frame = 1
				animationPlayer.play("Walk")
				var jugador = $"../Jugador"
				jugador.global_position += Vector2(30, 0)
				yaApreto = true
				pasosDados += 1
				if pasosDados == 10 ||  pasosDados == 20 || pasosDados == 30:
					count = 3
					$"../aviso".text = "MAS RAPIDO!!"  
					rotation_speed += 10
			elif estaDentro && !yaApreto && estaCaido: 
				yaApreto = true
				$"../instrucciones".text = "Presiona E"
				animationPlayer.frame = 0
				animationPlayer.play("Walk")
				estaCaido = false
			elif !estaDentro:
				animationPlayer.play("Fall")
				estaCaido = true
				$"../instrucciones".text = "Levantate!!"
				
		if tiempo <= 0:
			get_tree().change_scene_to_file("res://Escenas/PantallaDePerder.tscn")
		if $"../Jugador".global_position.x >1150:
			Globalsed.nivel = 3
			get_tree().change_scene_to_file("res://Escenas/LevelIntro.tscn")
	else:
		tiempo -= 1 * delta
		var tiempoRedondeado : int = round(tiempo)
		$"../aviso".text = str(tiempoRedondeado)
		if tiempoRedondeado == 0:
			$"../aviso".text = "READY?"
		if tiempo < 0:
			count = 1
			$"../aviso".text = "GO"
			tiempo = 45
			isReady = true
		
func _on_metronomo_statico_body_entered(body: Node2D) -> void:
	if body.name == self.name:
		estaDentro = true
	pass # Replace with function body
	



func _on_metronomo_statico_body_exited(body: Node2D) -> void:
	if body.name == self.name:
		yaApreto = false
		estaDentro = false
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished() -> void:
	animationPlayer.stop()
	pass # Replace with function body.

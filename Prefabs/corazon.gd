extends Area2D

var velocidad_caida := 200 

func _process(delta):
	position.y += velocidad_caida * delta
	rotation += 1.5 * delta  # 1.5 radianes por segundo

		


	

func _on_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("Personaje"):
		self.queue_free()
		self.get_parent().aumentarProgreso()
		self.get_parent().generados += 1


		
	pass # Replace with function body.

extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Personaje"):
		if body.has_method("rebotar"):
			body.rebotar(global_position)

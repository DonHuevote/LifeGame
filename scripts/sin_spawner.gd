extends Node2D

@export var sin_scene: PackedScene
@export var spawn_area_width: float = 640.0

func _ready() -> void:
	$Timer.timeout.connect(_on_Timer_timeout)

func _on_Timer_timeout() -> void:
	if sin_scene:
		var sin_instance = sin_scene.instantiate()
		var x_pos = randf_range(-spawn_area_width / 2, spawn_area_width / 2)
		sin_instance.position = global_position + Vector2(x_pos, 0)
		get_parent().add_child(sin_instance)

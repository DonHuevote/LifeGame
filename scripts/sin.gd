extends Area2D

@export var fall_speed: float = 150.0
@export var sprite_options: Array[Texture2D] 
@export var min_scale: float = 0.1
@export var max_scale: float = 0.5
@export var rotation_speed: float = 90.0  # grados por segundo


func _ready() -> void:
	add_to_group("sins")
	if sprite_options.size() > 0:
		var chosen_sprite = sprite_options[randi() % sprite_options.size()]
		$Sprite2D.texture = chosen_sprite
	var scale_factor = randf_range(min_scale, max_scale)
	scale = Vector2.ONE * scale_factor
	rotation_speed = randf_range(-180.0, 180.0)


func _process(delta: float) -> void:
	position.y += fall_speed * delta
	if position.y > 1000:
		queue_free()
	rotation += deg_to_rad(rotation_speed) * delta

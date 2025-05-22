extends Area3D

@export var rotation_speed := 10.0 # grados por segundo
var rotating := false
@export var rotation_remaining := 0.0
var end = false




func _process(delta):

	if rotating:
		var step = rotation_speed * delta
		if step >= rotation_remaining:
			monitoring = false
			rotation_degrees.x += rotation_remaining
			rotation_remaining = 0.0
			rotating = false
			end = true

		else:
			rotation_degrees.x += step
			rotation_remaining -= step

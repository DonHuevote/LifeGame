extends CharacterBody2D

signal damaged(lives_left)

@export var speed: float = 200.0
@export var max_lives: int = 3
var lives: int
var is_invincible: bool = false

const INVINCIBILITY_TIME := 1.5
const BLINK_INTERVAL := 0.1

var blink_timer: Timer
var blink_time_passed: float = 0.0

func _ready() -> void:
	lives = max_lives

	blink_timer = Timer.new()
	blink_timer.wait_time = BLINK_INTERVAL
	blink_timer.one_shot = false
	blink_timer.connect("timeout", Callable(self, "_on_blink_timeout"))
	add_child(blink_timer)

func take_damage() -> void:
	if is_invincible:
		return

	lives -= 1
	emit_signal("damaged", lives)
	print("Vidas restantes: ", lives)
	if lives <= 0:
		die()
		return

	is_invincible = true
	blink_time_passed = 0.0
	blink_timer.start()

func _on_blink_timeout() -> void:
	blink_time_passed += BLINK_INTERVAL
	$Sprite2D.visible = !$Sprite2D.visible

	if blink_time_passed >= INVINCIBILITY_TIME:
		$Sprite2D.visible = true
		blink_timer.stop()
		is_invincible = false

func die() -> void:
	print("quedo")

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1

	velocity = direction.normalized() * speed
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("sins"):
		take_damage()
		area.queue_free()

extends Node2D

@onready var countdown_label: Label = $CountdownLabel
@onready var progress_bar: ProgressBar = $LevelProgressBar
@onready var lives_label: Label = $LivesLabel
@onready var player: Node = $Player

var countdown := 3
var game_started := false

const LEVEL_DURATION := 60.0  
var level_timer := 0.0
var level_complete := false

func _ready() -> void:
	Globalsed.nivel = 6 
	$CountdownLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	$CountdownLabel.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	countdown_label.text = ""
	progress_bar.value = 0
	player.set_physics_process(false)  # Desactiva movimiento del jugador
	start_countdown()
	lives_label.text = "Vidas: %d" % player.lives
	player.connect("damaged", Callable(self, "_on_player_damaged"))

func _process(delta):
	if level_complete or not game_started:
		return

	level_timer += delta
	progress_bar.value = level_timer

	if level_timer >= LEVEL_DURATION:
		level_complete = true
		on_level_complete()

func _on_player_damaged(lives_left: int) -> void:
	lives_label.text = "Vidas: %d" % lives_left

func on_level_complete():
	print("¡Ganaste!")

func start_countdown():
	countdown = 3
	countdown_label.text = str(countdown)

	var countdown_timer = Timer.new()
	countdown_timer.wait_time = 1.0
	countdown_timer.one_shot = false
	add_child(countdown_timer)
		
	countdown_timer.timeout.connect(func():
		countdown -= 1
		if countdown > 0:
			countdown_label.text = str(countdown)
		elif countdown == 0:
			countdown_label.text = "¡ESQUIVÁ ESOS PECADOS!"
		else:
			countdown_label.text = ""
			countdown_timer.stop()
			countdown_timer.queue_free()
			start_game()
	)
	
	countdown_timer.start()

func start_game():
	game_started = true
	player.set_physics_process(true)  # Activa movimiento del jugador
	print("¡Comienza el juego!")

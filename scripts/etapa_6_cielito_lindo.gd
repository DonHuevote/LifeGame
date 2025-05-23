extends Node2D

@onready var progress_bar: ProgressBar = $LevelProgressBar
@onready var lives_label: Label = $LivesLabel
@onready var player: Node = $Player

const LEVEL_DURATION := 60.0  
var level_timer := 0.0
var level_complete := false

func _process(delta):
	if level_complete:
		return

	level_timer += delta
	progress_bar.value = level_timer

	if level_timer >= LEVEL_DURATION:
		level_complete = true
		on_level_complete()


func _ready() -> void:
	progress_bar.value = 0
	lives_label.text = "Vidas: %d" % player.lives
	player.connect("damaged", Callable(self, "_on_player_damaged"))

func _on_player_damaged(lives_left: int) -> void:
	lives_label.text = "Vidas: %d" % lives_left

func on_level_complete():
	print("gana")

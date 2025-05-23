extends Control

signal closed

@onready var back_button = $Panel2/back  # Ajustá el path según tu escena

func _ready():
	back_button.pressed.connect(_on_back_pressed)

func _on_back_pressed():
	visible = false
	emit_signal("closed")

extends Control

@onready var slider: HSlider = $Panel/HSlider
@onready var back_button: Button = $Panel/Button3

func _ready():
	slider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
	slider.value_changed.connect(_on_slider_value_changed)
	back_button.pressed.connect(_on_back_pressed)

func _on_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Escenas/main_menu.tscn")

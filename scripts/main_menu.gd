extends Control

@onready var slider: HSlider = $OptionsPanel/Panel/HSlider
@onready var play_button = $Panel/play
@onready var quit_button =$Panel/quit
@onready var options_panel = $OptionsPanel
@onready var main_panel = $Panel

func _ready():
	play_button.pressed.connect(_on_play_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	slider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
	slider.value_changed.connect(_on_slider_value_changed)

func _on_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)



func _on_play_pressed():
	get_tree().change_scene_to_file("res://Escenas/etapa_1_nacimiento.tscn")  

func _on_options_pressed():
	main_panel.visible = false
	options_panel.visible = true
	
func _on_back_pressed():
	main_panel.visible = true
	options_panel.visible = false
func _on_quit_pressed():
	get_tree().quit()

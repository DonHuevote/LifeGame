extends Control

@onready var play_button = $Panel/play
@onready var quit_button = $Panel/quit
@onready var main_panel = $Panel

var options_panel: Control = null
var slider: HSlider = null

func _ready():
	play_button.pressed.connect(_on_play_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

	# Cargar y agregar el panel de opciones
	var options_scene = load("res://Escenas/options_menu.tscn")
	options_panel = options_scene.instantiate()
	add_child(options_panel)
	options_panel.visible = false
	options_panel.connect("closed", Callable(self, "_on_options_closed"))
	
	# Buscar el slider dentro del options_panel
	print(options_panel.get_path())
	print(options_panel.get_node("Panel2/HSlider"))  # Debería imprimir algo distinto de null

	slider = options_panel.get_node("Panel2/HSlider")  # ajusta el path según tu OptionsPanel
	slider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
	slider.value_changed.connect(_on_slider_value_changed)
	
	# Conectar el botón opciones del menú principal para mostrar el panel
	$Panel/options.pressed.connect(_on_options_pressed)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Escenas/LevelIntro.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_options_pressed():
	main_panel.visible = false
	options_panel.visible = true

func _on_options_closed():
	main_panel.visible = true
	options_panel.visible = false

func _on_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)

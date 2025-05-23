extends Control

@onready var menu_button: Button = $VBoxContainer/MenuButton

func _ready():
	menu_button.pressed.connect(_on_menu_pressed)

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Escenas/main_menu.tscn")

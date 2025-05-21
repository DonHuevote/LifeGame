extends Node2D

@export var objeto_escena: PackedScene
@onready var zona_spawn = $ZonaSpawn
var tiempo = 80
var segundos : int
var minutos : int


func _ready():
	# Obtener el 'CollisionShape2D' y su rectángulo delimitador
	var shape = zona_spawn.get_node("CollisionShape2D").shape
	var rect = Rect2(-shape.extents, shape.extents *2)

	# Cantidad de objetos a generar
	var cantidad = 75

	# Obtener la posición local de la zona
	var zona_pos = zona_spawn.position

	for i in range(cantidad):
		var instancia = objeto_escena.instantiate()

		# Generar posición aleatoria dentro del rectángulo
		var pos = Vector2(
			randf_range(rect.position.x, rect.position.x + rect.size.x),
			randf_range(rect.position.y, rect.position.y + rect.size.y)
		)

		# Ajustar la posición considerando la posición global de la zona
		instancia.position = zona_pos + pos

		# Añadir la instancia como hijo
		add_child(instancia)

func _process(delta: float) -> void:
	tiempo -= delta
	segundos = round(tiempo) 
	
	while( segundos >= 60):
		tiempo -= 60
		segundos -= 60
		minutos += 1
	while( segundos < 0):
		tiempo += 59
		segundos += 59
		minutos -= 1
		
	if segundos > 9:
		$Camera2D/Label.text =   str(minutos) + ":" + str(segundos)
	else :
		$Camera2D/Label.text =   str(minutos) + ":0" + str(segundos)

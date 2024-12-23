class_name Personaje
extends CharacterBody2D

signal player_hit

@export var gravity = 100  # Gravedad personalizada
@export var jump_speed = 120
@export var speed = 500
@export var bottom_limit = 1000
@onready var sprite_2d: Sprite2D = $Sprite2D

var jump_time = 0  # Para controlar la duración del salto

func _physics_process(delta: float) -> void:
	# Aplicar gravedad
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Horizontal
	var direction = Input.get_axis("izquierda","derecha")
	velocity.x = speed * direction
	
	# Mover imagen
	if direction!= 0:
		sprite_2d.scale.x = direction
	
	# Saltar
	var jump_pressed = Input.is_action_just_pressed("saltar")
	if jump_pressed:
		if is_on_floor():
			velocity.y += velocity.y - jump_speed
	# Mover al personaje
	move_and_slide()

	# Liberar nodo si cae por debajo del límite
	if position.y > bottom_limit:
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	#pass # Replace with function body.
	print("Un cuerpo ha entrado en el area:", body.name)

func damage_received():
	print("Daño recibido")
	player_hit.emit()

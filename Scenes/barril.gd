class_name Barril
extends RigidBody2D

const BARREL_RED = preload("res://Assets/Enemies/barrel_red.png")

var damage_done = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y > 800:
		queue_free()


func _on_body_entered(body: Node) -> void:
	#pass # Replace with faunction body.
	if body is Personaje:
		if not damage_done:
			print("Jugador golpeado.")
			damage_done = true
			$BarrelYellow.texture = BARREL_RED
			if body.has_method("damage_received"):
				body.damage_received()

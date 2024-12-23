class_name Boss
extends Node2D

@onready var animation_player = $AnimationPlayer
const ESCENA_BARRIL = preload("res://Scenes/barril.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if animation == null:
		#animation = find_child("AnimationPlayer")
		#animation = get_node("AnimationPlayer")
	#animation_player.play("lanzar")


func launch_barrel():
	#await(get_tree().create_timer(randi_range(3, 7)))
	var instancia_barril = ESCENA_BARRIL.instantiate()
	instancia_barril.position = $CharacterSquareRed/CharacterHandRed.position
	add_child(instancia_barril)
	animation_player.play("reposo")


func _on_timer_timeout() -> void:
	animation_player.play("lanzar")
	$Timer.wait_time = randf_range(4,6)

extends Node2D

signal player_health_updated(new_player_health)
signal time_updated(seconds_left)

@export var player_health = 3
@export var time_seconds = 100

const SCENE_FINISH_FILE = "res://Scenes/scene_finish.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func game_over():
	#pass
	print("Perdiste")
	get_tree().change_scene_to_file(SCENE_FINISH_FILE)


func game_victory():
	#pass
	print("Ganaste el juego!")
	var scene_finis_instance = preload(SCENE_FINISH_FILE).instantiate()
	scene_finis_instance.set_title("Ganaste!!!")
	add_child(scene_finis_instance)

func _on_personaje_player_hit() -> void:
	#pass # Replace with function body.
	print("Personaje dañado por un barril.")
	if player_health > 0:
		player_health -= 1
		player_health_updated.emit(player_health)
	else:
		game_over()


func _on_area_2d_body_entered(body: Node2D) -> void:
	#pass # Replace with function body.
	game_victory()


func _on_timer_timeout() -> void:
	#pass # Replace with function body.
	if time_seconds > 0:
		time_seconds -= 1
	else:
		game_over()
	time_updated.emit(time_seconds)

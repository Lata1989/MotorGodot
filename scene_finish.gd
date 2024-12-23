extends CanvasLayer

const LEVEL_1 = "res://Scenes/level_1.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	#pass # Replace with function body.
	get_tree().change_scene_to_file(LEVEL_1)

func set_title(title):
	$VBoxContainer/Label.text = title

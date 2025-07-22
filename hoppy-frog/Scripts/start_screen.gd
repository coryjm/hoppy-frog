extends CanvasLayer

signal easy
signal medium
signal hard


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_easy_button_pressed() -> void:
	print("easy")
	easy.emit()


func _on_medium_button_pressed() -> void:
	print("med")
	medium.emit()


func _on_hard_button_pressed() -> void:
	print("hard")
	hard.emit()

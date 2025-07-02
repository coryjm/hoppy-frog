extends Area2D

var speed = randf_range(50.0, 300.0)




func _process(delta):
	position.x -= speed * delta  # Moves left every frame

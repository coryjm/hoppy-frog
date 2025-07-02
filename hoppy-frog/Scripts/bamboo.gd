extends RigidBody2D

var tree = randi() % 3 + 1
var speed = 200
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if tree == 1:
		$AnimatedSprite2D.play("short")
		$CollisionShape2D_Short.disabled = false
	elif tree == 2:
		$AnimatedSprite2D.play("medium")
		$CollisionShape2D_Medium.disabled = false
	elif tree == 3:
		$AnimatedSprite2D.play("long")
		$CollisionShape2D_Long.disabled = false
	linear_velocity.x = -speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta

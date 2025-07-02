extends Area2D
signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
@export var jump_impulse = 400
@export var pad_scene: PackedScene

var velocity = Vector2.ZERO


var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size 

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity.y += gravity  * delta

	if Input.is_action_just_pressed("hop"):
		velocity.y = -jump_impulse
		$AnimatedSprite2D.animation = "jump"
		$AnimatedSprite2D.play()
		spawn_pad()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_body_entered(_body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
	
func spawn_pad():
	var instance = pad_scene.instantiate()
	instance.position = position
	instance.gravity_scale = 0.01

	get_tree().current_scene.add_child(instance)

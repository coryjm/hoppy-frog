extends Node
@export var bamboo_scene: PackedScene
@export var cloud_scene: PackedScene

var score

func _ready():
	$CloudTimer.start()
	$BambooTimer.start()
	$ScoreTimer.start()
	score = 0


func _on_cloud_timer_timeout() -> void:
	var cloud = cloud_scene.instantiate()
	var cloud_spawn_location = $CloudPath/CloudSpawnLocation
	cloud_spawn_location.progress_ratio = randf()
	cloud.position = cloud_spawn_location.global_position
	
	var velocity = Vector2(-randf_range(50.0, 300.0), 0.0)

	add_child(cloud)


func _on_bamboo_timer_timeout() -> void:
	# Spawn bottom bamboo (right side up)
	var bottom_bamboo = bamboo_scene.instantiate()
	bottom_bamboo.position = $BambooBottom.global_position
	bottom_bamboo.rotation_degrees = 0  # Upright
	bottom_bamboo.speed = 200  # Consistent speed (adjust as needed)
	add_child(bottom_bamboo)

	# Spawn top bamboo (upside down)
	var top_bamboo = bamboo_scene.instantiate()
	top_bamboo.position = $BambooTop.global_position
	top_bamboo.rotation_degrees = 180  # Flipped upside down
	top_bamboo.speed = 200  # Same speed
	add_child(top_bamboo)


func _on_score_timer_timeout() -> void:
	score += 1
	print(score)


func _on_player_hit() -> void:
	print("game over")

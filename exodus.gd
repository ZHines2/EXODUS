extends Node

@onready var player = $Player  # Reference to the Player node
@onready var enemy_container = $EnemyContainer  # Container for all enemies
@onready var enemy_counter_label = $CanvasLayer/EnemyCounter  # UI counter for enemies
@onready var score_label = $CanvasLayer/Score  # UI for the score display

@export var max_enemies: int = 100  # Maximum number of enemies
@export var player_power: int = 6  # Player power (always higher than enemy power)

var enemy_scene: PackedScene = preload("res://enemy.tscn")  # Enemy scene to spawn
var score: int = 0  # Player's score

func _ready() -> void:
	update_enemy_counter()
	update_score()
	spawn_random_enemies()

func _process(delta: float) -> void:
	handle_combat()

func spawn_random_enemies() -> void:
	while enemy_container.get_child_count() < max_enemies:
		spawn_enemy()

func spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate()
	
	# Generate a random position within bounds
	var spawn_position = Vector2(randf_range(100, 700), randf_range(100, 500))
	
	# Ensure the enemy does not spawn too close to the player
	while player.position.distance_to(spawn_position) < 100:  # Minimum distance of 100 units
		spawn_position = Vector2(randf_range(100, 700), randf_range(100, 500))

	new_enemy.position = spawn_position
	new_enemy.power = int(randf_range(1, 6))  # Random power between 1 and 5
	enemy_container.add_child(new_enemy)
	update_enemy_counter()

func update_enemy_counter() -> void:
	enemy_counter_label.text = "Enemies: " + str(enemy_container.get_child_count())

func update_score() -> void:
	score_label.text = "Score: " + str(score)

func handle_combat() -> void:
	for enemy in enemy_container.get_children():
		if enemy.is_queued_for_deletion():
			continue

		# Reduced kill radius
		if player.position.distance_to(enemy.position) < 15:  # Reduced from 50
			obliterate_enemy(enemy)

func obliterate_enemy(target_enemy: Node) -> void:
	if target_enemy and not target_enemy.is_queued_for_deletion():
		target_enemy.queue_free()
		update_enemy_counter()
		increase_score()
		print("red ded")

func increase_score() -> void:
	score += 10  # Increment score by 10 points
	update_score()

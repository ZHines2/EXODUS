extends Node

@export var enemy_scene: PackedScene

func combine_overlapping_enemies(container: Node) -> void:
	var enemies = container.get_children()
	var combined_pairs = []
	var already_combined = {}

	for i in range(enemies.size()):
		var enemy_a = enemies[i]
		if enemy_a.is_queued_for_deletion():
			continue

		for j in range(i + 1, enemies.size()):
			var enemy_b = enemies[j]
			if enemy_b.is_queued_for_deletion():
				continue

			if enemy_a.position.distance_to(enemy_b.position) < 50:
				if enemy_a in already_combined or enemy_b in already_combined:
					continue
				combined_pairs.append([enemy_a, enemy_b])
				already_combined[enemy_a] = true
				already_combined[enemy_b] = true

	for pair in combined_pairs:
		combine_enemy_pair(pair[0], pair[1], container)

func combine_enemy_pair(enemy_a: Node, enemy_b: Node, container: Node) -> void:
	var combined_power = min(enemy_a.power + enemy_b.power, 5)
	enemy_a.queue_free()
	enemy_b.queue_free()

	var new_enemy = enemy_scene.instantiate()
	new_enemy.position = (enemy_a.position + enemy_b.position) / 2
	new_enemy.power = combined_power
	container.add_child(new_enemy)

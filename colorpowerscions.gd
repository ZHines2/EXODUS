extends Node2D

# Define scions with their symbols, colors, power, and stats including acuity
var scions = [
	{"name": "Aar", "symbol": "Ψ", "color": Color(1, 0, 0), "stats": {"power": 1, "imagination": 7, "agility": 6, "acuity": 3, "mutability": 3, "otherness": 5}},
	{"name": "Ro", "symbol": "Δ", "color": Color(0, 1, 0), "stats": {"power": 5, "imagination": 3, "agility": 2, "acuity": 5, "mutability": 5, "otherness": 5}},
	{"name": "Gio", "symbol": "φ", "color": Color(0, 0, 1), "stats": {"power": 6, "imagination": 2, "agility": 6, "acuity": 4, "mutability": 4, "otherness": 3}},
	{"name": "Mem", "symbol": "Ω", "color": Color(1, 1, 0), "stats": {"power": 7, "imagination": 2, "agility": 4, "acuity": 2, "mutability": 4, "otherness": 6}},
	{"name": "Red", "symbol": "Σ", "color": Color(1, 0, 1), "stats": {"power": 5, "imagination": 3, "agility": 3, "acuity": 4, "mutability": 4, "otherness": 6}},
	{"name": "Lag", "symbol": "Ξ", "color": Color(0, 1, 1), "stats": {"power": 5, "imagination": 2, "agility": 8, "acuity": 3, "mutability": 4, "otherness": 3}},
	{"name": "Bng", "symbol": "Ж", "color": Color(0.5, 0, 0.5), "stats": {"power": 6, "imagination": 4, "agility": 3, "acuity": 8, "mutability": 2, "otherness": 2}},
	{"name": "Yg", "symbol": "ϑ", "color": Color(0.5, 0.5, 0), "stats": {"power": 4, "imagination": 2, "agility": 2, "acuity": 8, "mutability": 5, "otherness": 4}},
	{"name": "Tsa", "symbol": "Π", "color": Color(0.5, 0, 0), "stats": {"power": 2, "imagination": 6, "agility": 4, "acuity": 3, "mutability": 5, "otherness": 5}},
	{"name": "Ith", "symbol": "Λ", "color": Color(0, 0.5, 0), "stats": {"power": 3, "imagination": 5, "agility": 4, "acuity": 4, "mutability": 3, "otherness": 6}},
	{"name": "Oj", "symbol": "Γ", "color": Color(0, 0, 0.5), "stats": {"power": 2, "imagination": 8, "agility": 2, "acuity": 4, "mutability": 3, "otherness": 6}},
	{"name": "Sha", "symbol": "Ш", "color": Color(0.5, 0.5, 0.5), "stats": {"power": 6, "imagination": 8, "agility": 6, "acuity": 3, "mutability": 2, "otherness": 0}},
	{"name": "Glo", "symbol": "Ю", "color": Color(1, 0.5, 0), "stats": {"power": 2, "imagination": 2, "agility": 6, "acuity": 7, "mutability": 4, "otherness": 4}},
	{"name": "Urc", "symbol": "Ѭ", "color": Color(0, 0.5, 0.5), "stats": {"power": 4, "imagination": 6, "agility": 5, "acuity": 4, "mutability": 2, "otherness": 4}},
	{"name": "Hot", "symbol": "Ѳ", "color": Color(0.5, 0, 1), "stats": {"power": 5, "imagination": 6, "agility": 4, "acuity": 3, "mutability": 5, "otherness": 2}},
	{"name": "Bo", "symbol": "З", "color": Color(0, 1, 0.5), "stats": {"power": 0, "imagination": 5, "agility": 3, "acuity": 3, "mutability": 9, "otherness": 5}},
	{"name": "He", "symbol": "Є", "color": Color(1, 0.5, 0.5), "stats": {"power": 4, "imagination": 3, "agility": 8, "acuity": 2, "mutability": 5, "otherness": 3}},
	{"name": "Viq", "symbol": "Ҩ", "color": Color(0.5, 0.5, 1), "stats": {"power": 1, "imagination": 8, "agility": 6, "acuity": 3, "mutability": 4, "otherness": 3}},
	{"name": "Wey", "symbol": "Ѡ", "color": Color(1, 1, 1), "stats": {"power": 4, "imagination": 6, "agility": 1, "acuity": 4, "mutability": 4, "otherness": 6}},
	{"name": "La", "symbol": "Ϟ", "color": Color(0.5, 1, 0), "stats": {"power": 2, "imagination": 3, "agility": 4, "acuity": 1, "mutability": 9, "otherness": 6}},
	{"name": "Gas", "symbol": "Ϡ", "color": Color(1, 0.5, 1), "stats": {"power": 3, "imagination": 4, "agility": 3, "acuity": 6, "mutability": 5, "otherness": 4}},
	{"name": "To", "symbol": "Ѧ", "color": Color(0.5, 1, 1), "stats": {"power": 4, "imagination": 2, "agility": 5, "acuity": 5, "mutability": 6, "otherness": 3}},
	{"name": "Mik", "symbol": "ϰ", "color": Color(1, 0, 0.5), "stats": {"power": 5, "imagination": 4, "agility": 4, "acuity": 8, "mutability": 3, "otherness": 1}},
	{"name": "Er", "symbol": "Ѯ", "color": Color(0.5, 0, 0.5), "stats": {"power": 7, "imagination": 4, "agility": 1, "acuity": 7, "mutability": 1, "otherness": 5}},
	{"name": "Z", "symbol": "ϡ", "color": Color(0.5, 1, 0.5), "stats": {"power": 2, "imagination": 6, "agility": 5, "acuity": 4, "mutability": 3, "otherness": 5}},
	{"name": "Din", "symbol": "Ϥ", "color": Color(1, 0.5, 0), "stats": {"power": 0, "imagination": 4, "agility": 6, "acuity": 7, "mutability": 4, "otherness": 4}},
	{"name": "Enn", "symbol": "Ҵ", "color": Color(0.5, 0.5, 0), "stats": {"power": 3, "imagination": 6, "agility": 7, "acuity": 2, "mutability": 4, "otherness": 3}},
	{"name": "Mor", "symbol": "Ѱ", "color": Color(0, 0.5, 1), "stats": {"power": 2, "imagination": 4, "agility": 3, "acuity": 5, "mutability": 5, "otherness": 6}},
	{"name": "Gan", "symbol": "Њ", "color": Color(1, 1, 0), "stats": {"power": 4, "imagination": 4, "agility": 2, "acuity": 5, "mutability": 3, "otherness": 7}},
	{"name": "Ac", "symbol": "Җ", "color": Color(0.5, 1, 1), "stats": {"power": 2, "imagination": 5, "agility": 4, "acuity": 3, "mutability": 6, "otherness": 5}}
]

# Scion class to handle movement and lock-on behavior based on acuity
class Scion extends Node2D:
	var symbol: String
	var color: Color
	var stats: Dictionary
	var player: Label  # Reference to the player node (Label)

	func _ready():
		var symbol_label = Label.new()
		symbol_label.text = symbol
		symbol_label.modulate = color
		add_child(symbol_label)

	func _process(delta: float):
		# Move the scion based on its agility and lock-on to the player based on acuity
		var agility = stats["agility"]
		var acuity = stats["acuity"]

		# Calculate random movement
		var random_move_distance = agility * delta * 40
		position.x += random_move_distance * (randf() - 0.5)
		position.y += random_move_distance * (randf() - 0.5)

		# Calculate lock-on movement towards the player
		if player:
			var direction_to_player = (player.position - position).normalized()
			var lockon_move_distance = acuity * delta
			position += direction_to_player * lockon_move_distance

		# Ensure the scion stays within bounds
		position.x = clamp(position.x, 0, 800)  # Assuming the game area width is 800
		position.y = clamp(position.y, 0, 600)  # Assuming the game area height is 600

extends Label

# Player properties
var speed = 200

func _ready():
	text = "🀐"  # ASCII representation of the player
	position = Vector2(400, 300)  # Starting position

func _process(delta):
	var direction = Vector2.ZERO

	# Player movement input
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	# Normalize direction and move player
	if direction.length() > 0:
		direction = direction.normalized()
	position += direction * speed * delta

	#print("Player position: ", position)
	

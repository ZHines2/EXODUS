extends Label

@export var speed: float = 40.0  # Enemy movement speed
@export var power: int = 1  # Enemy power level
var player: Node = null  # Reference to the Player node


func _ready() -> void:
	var label = Label.new()
	label.text = "🀫"  # Enemy marker
	label.modulate = Color(1, 0, 0)  # Red text for visibility
	add_child(label)

	player = get_tree().get_root().get_node("/root/EXODUS/Player")

func _process(delta: float) -> void:
	if player:
		var direction = (player.position - position).normalized()
		position += direction * speed * delta  # Move toward the player

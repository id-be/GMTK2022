extends Spatial

export var health = 100
export var damage = 100

onready var hlth = $UI/Health
onready var dam = $UI/Damage

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

	hlth.text = hlth.text + " " + str(health)
	dam.text = dam.text + " " + str(damage)

func _unhandled_input(event):
	if Input.is_action_pressed("QUIT"):
		get_tree().change_scene("res://Scenes/Title.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


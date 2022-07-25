extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().name != "root":
#		print("FUCK")
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#$Camera.look_at($Die.global_transform.origin, Vector3(0,1,0))

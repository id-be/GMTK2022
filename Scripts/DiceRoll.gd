extends RigidBody



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var x = rand_range(-10, 10)
	var y = rand_range(-10, 10)
	var z = rand_range(-10, 10)
	var r = rand_range(-10, 10)
	
	set_angular_velocity(Vector3(x, y, z))
	


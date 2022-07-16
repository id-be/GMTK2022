extends RigidBody

enum DieType { D4 = 4, D6 = 6, D8 = 8, D10 = 10, D12 = 12, D20 = 20 }

export(DieType) var dieType = DieType.D6
export var angular_vel = 20
export var damp = 0.9999999

# Called when the node enters the scene tree for the first time.
func _ready():
	$RayCast.set_debug_shape_custom_color(Color(1, 0, 0, 1))
	$RayCast.set_debug_shape_thickness(5)
	angular_damp = damp
	
	randomize()
	var x = rand_range(-angular_vel, angular_vel)
	var y = rand_range(-angular_vel, angular_vel)
	var z = rand_range(-angular_vel, angular_vel)
	var r = rand_range(-angular_vel, angular_vel)
	
	set_angular_velocity(Vector3(x, y, z))
	
	
func _physics_process(delta: float) -> void:
	if (linear_velocity.length() == 0.1):
		axis_lock_angular_x = true; axis_lock_angular_y = true; axis_lock_angular_z = true; 
		sleeping = true
	
	if (sleeping):
		$RayCast.set_debug_shape_custom_color(Color(0, 1, 0, 1))

func check_face():
	var rotate = fmod($RayCast.rotation.x, 25)
	pass

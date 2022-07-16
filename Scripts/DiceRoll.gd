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
	
	var bas = Basis(uniform_random_rotation())
	transform.basis = bas
	
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
		print(self.name + ": " + str(rotation_degrees))

func check_face():
	var rotate = fmod($RayCast.rotation.x, 25)
	pass


func uniform_random_rotation() -> Quat:
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var x0 = rng.randf();
	
	var theta1 = rng.randf_range(0, PI * 2);
	var theta2 = rng.randf_range(0, PI * 2);
	# Make this theta2 in the range (0, PI * 1) if you want w > 0
	
	var r1 = sqrt(1 - x0);
	var r2 = sqrt(x0);
	return Quat(cos(theta2) * r2, sin(theta1) * r1, cos(theta1) * r1, sin(theta2) * r2)
	

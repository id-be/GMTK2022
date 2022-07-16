extends RigidBody

enum DieType { D4 = 4, D6 = 6, D8 = 8, D10 = 10, D12 = 12, D20 = 20 }

export(DieType) var dieType = DieType.D6
export var angular_vel = 20
export var damp = 0.9999999

var pips = []

func _ready():
	# Get all "faces" from dice
	for face in get_tree().get_nodes_in_group('Pips'):
		if self.is_a_parent_of(face):
			 pips.append(face)
	
	
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
		emit_signal("sleeping_state_changed")
	
	if (sleeping):
		$RayCast.set_debug_shape_custom_color(Color(0, 1, 0, 1))
		print(self.name + ": " + str(rotation_degrees))
		print("Current Face Is: " + str(check_face()))

func check_face() -> int:
	var highest = null
	var best_dot = -1
	
	for face in pips:
		var dot_prod = (face.global_transform.origin - global_transform.origin).dot(Vector3.UP)
		
		if dot_prod > best_dot:
			best_dot = dot_prod
			highest = face
	return int(highest.name.replace("Point", ""))


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
	

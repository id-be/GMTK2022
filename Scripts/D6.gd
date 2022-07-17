extends RigidBody

var just_shot = false
var shot_impulse = Vector3(0,0,0)

export var shot_speed = 3.0

func _ready():
	pass

func _physics_process(delta):
	if just_shot:
		apply_central_impulse(shot_impulse)#base this off of the current cursor position on the time of the click.
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		apply_torque_impulse(Vector3(rng.randi_range(0, 10),rng.randi_range(0, 10),rng.randi_range(0, 10)))
		just_shot = false
		
func get_shot(aim):
	shot_impulse = aim * shot_speed
	just_shot = true

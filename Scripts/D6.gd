extends RigidBody

var just_shot = false
var shot_impulse = Vector3(0,0,0)

export var shot_speed = 1.0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if just_shot:
		apply_central_impulse(shot_impulse)#base this off of the current cursor position on the time of the click.

func get_shot(aim):
	shot_impulse = aim * shot_speed
	just_shot = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

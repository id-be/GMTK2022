extends Spatial

var shooting = false
var l := 0.0
var last_child = null
var going_up = null
export var aimspeed = 10.0

onready var gun_barrel = $GunBarrel
onready var ammo_load = $AmmoLoad
onready var crosshair_dist = $Crosshair.translation
# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	going_up = true
	var aim_curve = Curve3D.new()
	for child in $AimPathContainer.get_children():
		aim_curve.add_point(child.translation)
		last_child = child.translation.y
	$AimPath.set_curve(aim_curve)
	print(last_child)
	
func _physics_process(delta: float) -> void:
	if !shooting:
		if $Crosshair.translation.y < last_child && going_up:
			l += delta
		elif $Crosshair.translation.y == last_child && going_up:
			going_up = false
			l -= delta
		elif $Crosshair.translation.y < last_child && $Crosshair.translation.y > 0 && !going_up:
			l -= delta
		elif $Crosshair.translation.y == 0 && !going_up:
			going_up = true
			l += delta
		$AimPath/AimPathTracker.offset = l * aimspeed
		var cross = $AimPath/AimPathTracker.translation
		$Crosshair.translation = cross
#		else: l-= delta
#		print(cross)

func _input(event):
	if event.is_action_pressed("SHOOT"):
		shooting = true
		shot_check()

func randomize_crosshair():
	pass

func shot_check():
	if $Crosshair/CrossArea.get_overlapping_bodies().empty() != true:
		shoot_dice()
	$ShotTimer.start()

func shoot_dice():
	for die in ammo_load.get_children():
		die.transform.origin = gun_barrel.translation
#		print($Crosshair.translation)
#		var shot_dir = Vector3(1, 0,0)
##		var shot_dir = Vector3($Crosshair.translation.z, $Crosshair.translation.y-10, 0)
#
#		die.get_shot(shot_dir)

func _on_ShotTimer_timeout():
	shooting = false

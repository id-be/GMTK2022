extends Spatial

var shooting = false
var l := 0.0
var last_child = null
var going_up = null
var my_boy = null
var my_pool = null
export var aimspeed = 10.0

onready var gun_barrel = $GunBarrel
onready var ammo_load = $AmmoLoad
onready var crosshair_dist = $Crosshair.translation
onready var animator = $Ace/AceAnimationTree



func _ready():
	going_up = true
	var aim_curve = Curve3D.new()
	for child in $AimPathContainer.get_children():
		aim_curve.add_point(child.translation)
		last_child = child.translation.y
	$AimPath.set_curve(aim_curve)
#	print(last_child)
	
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

func load_bullets(bullets):
	for bullet in bullets:
		match bullet:
			"d4":
				my_pool = $AmmoPool/d4
			"d6":
				my_pool = $AmmoPool/d6
			"d8":
				my_pool = $AmmoPool/d8
			"d10":
				my_pool = $AmmoPool/d10
			"d12":
				my_pool = $AmmoPool/d12
			"d20":
				my_pool = $AmmoPool/d20
			_:
				pass
		my_boy = my_pool.get_child(0)
		my_pool.remove_child(my_boy)
		$AmmoPool.add_child(my_boy)
		my_boy.set_owner($AmmoLoad)

func shot_check():
	if $Crosshair/CrossArea.get_overlapping_bodies().empty() != true:
		shoot_dice()
	$ShotTimer.start()

func shoot_dice():
	if ammo_load.get_child_count() != 0:
		for die in ammo_load.get_children():
			die.global_transform.origin = gun_barrel.global_transform.origin
			die.linear_velocity = Vector3.ZERO
			# Here is where we apply the force
	#		print($Crosshair.translation)
			#var shot_dir = Vector3(5, 0,0)
			#var shot_dir = Vector3($Crosshair/CrossArea.translation.z - gun_barrel.translation.z, $Crosshair/CrossArea.translation.y - gun_barrel.translation.y, 0)
			var shot_dir = Vector3($Crosshair/CrossArea.global_transform.origin.x - \
			gun_barrel.global_transform.origin.x, $Crosshair/CrossArea.global_transform.origin.y - \
			gun_barrel.global_transform.origin.y, 0)
			die.get_shot(shot_dir)
			animator.set("parameters/conditions/isShooting", true)
			#animator.set("parameters/conditions/isShooting", false)
			#print(die.global_transform.origin)
	else:
		pass

func _on_ShotTimer_timeout():
	shooting = false
	animator.set("parameters/conditions/isShooting", false)

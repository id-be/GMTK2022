extends Spatial

var rando = RandomNumberGenerator.new()

onready var dice = [
$DicePool/D4Pool/d4_1, $DicePool/D4Pool/d4_2, $DicePool/D4Pool/d4_3,
$DicePool/D6Pool/d6_1, $DicePool/D6Pool/d6_2, $DicePool/D6Pool/d6_3,
$DicePool/D8Pool/d8_1, $DicePool/D8Pool/d8_2, $DicePool/D8Pool/d8_3,
$DicePool/D10Pool/d10_1, $DicePool/D10Pool/d10_2,
$DicePool/D12Pool/d12_1, $DicePool/D12Pool/d12_2,
$DicePool/D20Pool/d20_1]

var cur_bullet

var dice_og_pos = []
var pools = null
var total_pools = null
var cur_pool = null

var ray_origin = Vector3()
var ray_end = Vector3()

var cur_cam = null
var space_state = null

var mouse_pos = null

onready var all_dice = $DicePool



func _ready():
	cur_cam = get_viewport().get_camera()
	for die in dice:
		dice_og_pos.append(die.global_transform.origin)

	rando.randomize()

	pools = [
	[dice[0], dice[3], dice[1]] , 
	[dice[0], dice[3], dice[4]]
	]

	total_pools = pools.size()
	var my_pool = rando.randi_range(0, total_pools - 1)

	cur_pool = pools[my_pool]
	cur_pool[0].global_transform.origin = $DiePos1.global_transform.origin
	cur_pool[1].global_transform.origin = $DiePos2.global_transform.origin
	cur_pool[2].global_transform.origin = $DiePos3.global_transform.origin

func _input(event):
	if Input.is_action_just_pressed("LeftClick"):
		mouse_pos = get_viewport().get_mouse_position()
		space_state = get_world().direct_space_state
		ray_origin = cur_cam.project_ray_origin(mouse_pos)
		ray_end = ray_origin + cur_cam.project_ray_normal(mouse_pos)*2000
		var intersection = space_state.intersect_ray(ray_origin, ray_end)
		print(intersection)
		if intersection.size() > 0:
			var die_away = dice.find(intersection.collider)
			if die_away != null:
				if die_away != -1:
					put_away(die_away)

func put_away(my_die):
	dice[my_die].global_transform.origin = dice_og_pos[my_die]
	
	Globals.my_enum = "whatever"
	
	var pool_index = "f"#just get the cur_pool, the objects 0 1 2 are the dice. then we can check 
	#where those are in the dice array, and that gives us an int, which we can match up to the index of the dice_og_pos, then put it back there.

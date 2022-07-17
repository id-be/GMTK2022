extends Spatial

var rando = RandomNumberGenerator.new()

onready var dice = [
$DicePool/D4Pool/d4_1,$DicePool/D4Pool/d4_2,$DicePool/D4Pool/d4_3,
$DicePool/D6Pool/d6_1, $DicePool/D6Pool/d6_2, $DicePool/D6Pool/d6_3,
$DicePool/D8Pool/d8_1, $DicePool/D8Pool/d8_2, $DicePool/D8Pool/d8_3,
$DicePool/D10Pool/d10_1, $DicePool/D10Pool/d10_2,
$DicePool/D12Pool/d12_1, $DicePool/D12Pool/d12_2,
$DicePool/D20Pool/d20_1]

var pools = null#[[0,1,0],[0,1,1]]
var total_pools = null
var cur_pool = null

onready var all_dice = $DicePool

# Called when the node enters the scene tree for the first time.
func _ready():
	rando.randomize()
	
	pools = [
	[dice[0], dice[3], dice[1]] , 
	[dice[0], dice[3], dice[4]]
	]

	total_pools = pools.size()

	var my_pool = rando.randi_range(0, total_pools-1)
	cur_pool = pools[my_pool]
	cur_pool[0].global_transform.origin = $DiePos1.global_transform.origin
	cur_pool[1].global_transform.origin = $DiePos2.global_transform.origin
	cur_pool[2].global_transform.origin = $DiePos3.global_transform.origin

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

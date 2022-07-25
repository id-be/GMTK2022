extends Spatial

export var i_health = 100
export var i_damage = 100

onready var hlth = $UI/Health
onready var dam = $UI/Damage
onready var guy = $"3DGuy"
onready var pick = $BulletPicker
onready var town_cam = $Camera

var rollscn
var bulletpicker

signal done_picking

func _ready():
	self.connect("done_picking", $BulletPicker, "bullets_picked")
	pick.set_process(false)
	$Timer.start()
	hlth.text = hlth.text + " " + str(i_health)
	dam.text = dam.text + " " + str(i_damage)

#var dialogue = load("res://dialogue/dialogue_player/DialoguePlayer.tscn").instance()

func _unhandled_input(event):
	if Input.is_action_pressed("QUIT"):
		get_tree().change_scene("res://Scenes/Title.tscn")

func health_update(dmg):
	pass

func damage_update(dmg):
	pass

func bullets_picked():
	pick.set_process(false)
	town_cam.current = true
	guy.is_aiming = true

func swap_to_bullet_loader():
	pick.cam.current = true
	pick.set_process(true)

func _on_Timer_timeout():
	swap_to_bullet_loader()

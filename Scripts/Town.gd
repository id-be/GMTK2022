extends Spatial

export var i_health = 100
export var i_damage = 100

onready var hlth = $UI/Health
onready var dam = $UI/Damage
onready var guy = $"3DGuy"
onready var pick = $BulletPicker

var rollscn
var bulletpicker

func _ready():
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


func _on_Timer_timeout():
	pick.cam.current = true
	pick.set_process(true)

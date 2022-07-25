extends Node

var my_enum

var my_bullets

var cur_sfx

var fx = "res://Assets/Sound/SFX/"

var click = [fx+"AdamSandlersClick.ogg"]

var draws = [fx+"Draw1.ogg", fx+"Draw2.ogg",
fx+"Draw3.ogg", fx+"Draw4.ogg", fx+"Draw5.ogg"]

var cocks = [fx+"Cock1.ogg", fx+"Cock2.ogg",
fx+"Cock3.ogg", fx+"Cock4.ogg", fx+"Cock5.ogg",
fx+"Cock6.ogg", fx+"Cock7.ogg", fx+"Cock8.ogg",
fx+"Cock9.ogg", fx+"Cock10.ogg", fx+"Cock11.ogg",
fx+"Cock12.ogg"]

var blasts = [fx+"Gunshot1.ogg", fx+"Gunshot2.ogg",
fx+"Gunshot3.ogg", fx+"Gunshot4.ogg", fx+"Gunshot5.ogg",
fx+"Gunshot6.ogg", fx+"Gunshot7.ogg", fx+"Gunshot8.ogg", 
fx+"Gunshot9.ogg", fx+"Gunshot10.ogg"]

var shoots = [fx+"ShootNoReverb.ogg",fx+"ShootLiteReverb.ogg",
fx+"ShootHeavyReverb.ogg"]

export var max_sfx: int = 10
var sfx_count: int = 0

func _ready():
	$Music.play()
	$Music.seek(6)

#	var cur_file = load(draws[0])
#	stream = cur_file
#	play()
#	cur_file = load(shoots[0])
#	stream = cur_file


func play_sfx(sfx: String):
	var new_player = AudioStreamPlayer.new()
	new_player.stream = load(sfx)
	new_player.connect("finished", new_player, "queue_free")
	new_player.connect("finished", self, "on_sfx_freed")
	get_tree().get_root().add_child(new_player)
	cur_sfx = new_player
	new_player.play()

func on_sfx_freed():
	print(cur_sfx)

func _input(_event):
	if OS.is_debug_build():
		if Input.is_action_just_pressed("DEBUG_QUIT"):
			get_tree().quit()
	if Input.is_action_just_pressed("ui_select"):
		play_sfx(cocks[0])
#	if Input.is_action_just_pressed("LeftClick"):
#		for child in get_tree().get_root().get_children():
#			print(child.name)

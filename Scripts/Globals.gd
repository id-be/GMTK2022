extends Node

var my_enum

var my_bullets

func _ready():
	$Music.play()
	$Music.seek(6)

func _input(_event):
	if OS.is_debug_build():
		if Input.is_action_just_pressed("DEBUG_QUIT"):
			get_tree().quit()

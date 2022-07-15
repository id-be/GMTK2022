extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(_event):
	if OS.is_debug_build():
		if Input.is_action_just_pressed("DEBUG_QUIT"):
			get_tree().quit()

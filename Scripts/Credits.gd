extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("QUIT"):
		get_tree().change_scene("res://Scenes/Title.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Title.tscn")

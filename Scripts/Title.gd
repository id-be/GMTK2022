extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("QUIT"):
		get_tree().quit()

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Town.tscn")

func _on_Credits_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")

func _on_Quit_pressed():
	get_tree().quit()

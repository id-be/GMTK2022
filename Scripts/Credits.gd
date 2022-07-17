extends Control



func _ready():
	pass

func _input(event):
	if Input.is_action_just_pressed("QUIT"):
		get_tree().change_scene("res://Scenes/Title.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Title.tscn")

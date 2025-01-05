extends Area2D

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("Player_Action"):
		print("You clicked me!")

extends TextureButton

func _process(_delta):		
	if abs($"../../../Menu_Character".position - $".".position - $".".size / 2).length() <= 200:
		SceneTransition.transition()
		await SceneTransition.on_transition_finished
		#get_tree().change_scene_to_packed(load("res://Scenes/introAnimation.tscn"))

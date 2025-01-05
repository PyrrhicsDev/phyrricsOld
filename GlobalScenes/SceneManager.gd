extends Node

const SettingsScene = preload("res://Scenes/settings.tscn")
const IntroScene = preload("res://Scenes/introAnimation.tscn")

signal on_trigger_player_spawn

var spawn_door_tag

func go_to_level(level_tag, destination_tag):
	var scene_to_load
	
	match level_tag:
		"settings":
			scene_to_load = SettingsScene
		"level":
			scene_to_load = IntroScene
			
	if scene_to_load != null:
		SceneTransition.transition()
		await SceneTransition.on_transition_finished
		spawn_door_tag = destination_tag
		get_tree().change_scene_to_packed(scene_to_load)
		
func trigger_player_spawn(position: Vector2, direction: String):
	on_trigger_player_spawn.emit(position, direction)

extends Control

const SettingsScene = preload("res://Scenes/settings.tscn")
const IntroScene = preload("res://Scenes/introAnimation.tscn")

func _ready():
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	$".".size = Global.viewSize()
	DisplayServer.window_set_min_size(Vector2(1440, 900))
	GlobalMusic.play_menu_music()

func _process(_delta):		
	$".".size = Global.viewSize()
	$CenterContainer.size = Global.viewSize()
	$MarginContainer.size = Global.viewSize()
	
	if abs($Menu_Character.position - $MarginContainer/PlayButton.position - $MarginContainer/PlayButton.size / 2).length() <= 200:
		SceneTransition.transition()
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_packed(IntroScene)
	
	elif abs($Menu_Character.position - $MarginContainer/SettingsButton.position - $MarginContainer/SettingsButton.size / 2).length() <= 200:
		SceneTransition.transition()
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_packed(SettingsScene)

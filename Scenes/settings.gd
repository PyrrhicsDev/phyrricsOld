extends Control

const MenuScene = preload("res://Scenes/menu.tscn")

func _ready():
	$".".size = Global.viewSize()
	$Menu_Character.position = Global.viewSize() / 2 + Vector2(0, 0.2) * Global.viewSize()

func _process(_delta):		
	$".".size = Global.viewSize()
	
	if abs($Menu_Character.position - $".".position - $".".size / 2).length() <= 100:
		SceneTransition.transition()
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_packed(MenuScene)

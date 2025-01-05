extends Node2D

var cutsceneCount = 0
var counter = 1
var images = []
var text = []
var alpha = 1.0
var textTimer = 2

@export var level_scene: PackedScene = load("res://Scenes/level.tscn")

func _ready():
	$Timer.start(textTimer)
	images = [$Control/CenterContainer/TextureRect, $Control/CenterContainer/TextureRect2, $Control/CenterContainer/TextureRect3, $Control/CenterContainer/TextureRect4] 
	images[0].z_index = counter
	$Control/MarginContainer/ColorRect.z_index = 4095
	text = [$Control/MarginContainer/Label, $Control/MarginContainer/Label2, $Control/MarginContainer/Label3, $Control/MarginContainer/Label4]
	for n in text.size():
		text[n].z_index = 4096
		text[n].add_theme_color_override("font_color", Color(0, 0, 0, 0))
	
func _process(_delta):
	if cutsceneCount > 1:
		$Control/MarginContainer/ColorRect.set_color(Color(255, 255, 255))
		text[cutsceneCount].add_theme_color_override("font_color", Color(0, 0, 0, 1 - $Timer.time_left / textTimer))
	else:
		$Control/MarginContainer/ColorRect.set_color(Color(0, 0, 0))
		text[cutsceneCount].add_theme_color_override("font_color", Color(255, 255, 255, 1 - $Timer.time_left / textTimer))

func _input(_event):
	if Input.is_action_pressed("Cutscene_Right"):
		cutsceneCount += 1
		counter += 1
		for n in text.size():
			text[n].add_theme_color_override("font_color", Color(0, 0, 0, 0))
		$Timer.start(textTimer)
	elif Input.is_action_pressed("Cutscene_Left"):
		if cutsceneCount != 0:
			cutsceneCount -= 1
			counter += 1
			for n in text.size():
				text[n].add_theme_color_override("font_color", Color(0, 0, 0, 0))
			$Timer.start(textTimer)
	
	if cutsceneCount < 4:
		images[cutsceneCount].z_index = counter
	else:
		get_tree().change_scene_to_packed(level_scene)

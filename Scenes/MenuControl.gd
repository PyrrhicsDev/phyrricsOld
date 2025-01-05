extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	$".".size = get_viewport_rect().size
	DisplayServer.window_set_min_size(Vector2(1440, 900))
	GlobalMusic.play_menu_music()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$".".size = get_viewport_rect().size
	$CenterContainer.size = get_viewport_rect().size
	$MarginContainer.size = get_viewport_rect().size

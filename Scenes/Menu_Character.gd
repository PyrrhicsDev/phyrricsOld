extends CharacterBody2D

@export var speed := 800
var direction2
var clickPosition = Vector2()
var normalizedDirection = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Global.viewSize() / 2 + Vector2(0, 0.2) * Global.viewSize()
	$Player_Sprite/AnimationPlayer.play('Idle_Right')
	clickPosition = position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta): #underscore before delta to not use if it's useless
	print(get_viewport_rect().size)
	if Input.is_action_just_pressed("Player_Action"):
		clickPosition = get_global_mouse_position()
		
	if position.distance_to(clickPosition) > 20:
		normalizedDirection = (clickPosition - position).normalized()
		velocity = normalizedDirection * speed
		move_and_slide()
	else:
		velocity = Vector2(0, 0)
		
	if velocity[0] > 0 and abs(velocity[0]) > abs(velocity[1]):
		$Player_Sprite/AnimationPlayer.play('Walk_Right')
		direction2 = Vector2.RIGHT
	elif velocity[0] < 0 and abs(velocity[0]) > abs(velocity[1]):
		$Player_Sprite/AnimationPlayer.play('Walk_Left')
		direction2 = Vector2.LEFT
	elif velocity[1] > 0 and abs(velocity[0]) < abs(velocity[1]):
		$Player_Sprite/AnimationPlayer.play('Walk_Down')
		direction2 = Vector2.DOWN
	elif velocity[1] < 0 and abs(velocity[0]) < abs(velocity[1]):
		$Player_Sprite/AnimationPlayer.play('Walk_Up')
		direction2 = Vector2.UP
		
	if velocity[0] == 0 and velocity[1] != 0:
		if direction2 == Vector2.RIGHT:
			$Player_Sprite/AnimationPlayer.play('Idle_Right')
		elif direction2 == Vector2.LEFT:
			$Player_Sprite/AnimationPlayer.play('Idle_Left')
	elif velocity[0] != 0 and velocity[1] == 0:
		if direction2 == Vector2.DOWN:
			$Player_Sprite/AnimationPlayer.play('Idle_Down')
		elif direction2 == Vector2.UP:
			$Player_Sprite/AnimationPlayer.play('Idle_Up')
#func playCollisionSound():
#	$collisionSound.play()

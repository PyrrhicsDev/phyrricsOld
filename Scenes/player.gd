extends CharacterBody2D

@export var speed := 175
var canAttack: bool = true
var direction2
#Exports the attribute to inspector
#:= sets var speed to dtype of 500

signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100, 500)
	$Player_Sprite/AnimationPlayer.play('Idle_Right')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta): #underscore before delta to not use it if it's useless
	var direction = Input.get_vector("Player_Left", "Player_Right", "Player_Up", "Player_Down")
	
	#print(direction)
	#if Input.is_action_pressed("ui_down"):
	#position += direction * speed * delta #2 Dimensions X and Y
		#get_node("PlayerImage").rotation += 0.1 * delta
		#Better implementation:
		#$PlayerImage.rotation += 0.1 * delta

	velocity = direction * speed

	if velocity[0] > 0:
		$Player_Sprite/AnimationPlayer.play('Walk_Right')
		direction2 = Vector2.RIGHT
	elif velocity[0] < 0:
		$Player_Sprite/AnimationPlayer.play('Walk_Left')
		direction2 = Vector2.LEFT
	elif velocity[1] > 0:
		$Player_Sprite/AnimationPlayer.play('Walk_Down')
		direction2 = Vector2.DOWN
	elif velocity[1] < 0:
		$Player_Sprite/AnimationPlayer.play('Walk_Up')
		direction2 = Vector2.UP

	if velocity[0] == 0:
		if direction2 == Vector2.RIGHT:
			$Player_Sprite/AnimationPlayer.play('Idle_Right')
		elif direction2 == Vector2.LEFT:
			$Player_Sprite/AnimationPlayer.play('Idle_Left')
	elif velocity[1] == 0:
		if direction2 == Vector2.DOWN:
			$Player_Sprite/AnimationPlayer.play('Idle_Down')
		elif direction2 == Vector2.UP:
			$Player_Sprite/AnimationPlayer.play('Idle_Up')
	move_and_slide()

	#Shoot Input
	#if Input.is_action_just_pressed("Player_Action") and canAttack:
		#Get global position instead of relative position to parent node
	#	laser.emit($laserStart.global_position)
	#	canAttack = false
	#	$laserTime.start()
	#	$laserSound.play()

#func playCollisionSound():
	#$collisionSound.play()

func _on_laser_time_timeout():
	canAttack = true

func _on_detection_collision_area_entered(area):
	print(area)

func _on_body_collision_area_entered(area):
	print(area)

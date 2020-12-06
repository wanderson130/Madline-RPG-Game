extends KinematicBody2D

const ACCELERATION = 550
const MAX_SPEED = 175
const FRICTION = 400
var score = 0
var Position = 0
var velocity = Vector2.ZERO	

func _process(_delta):
	var LabelNode = get_parent().get_node("Score Counter/UI/Base/RichTextLabel")
	LabelNode.text = str(score)
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("runleft")
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("runleft")
	elif Input.is_action_pressed("ui_up"):
		pass #$AnimatedSprite.play("AtackLeftAnime")
	elif Input.is_action_pressed("ui_down"):
		pass #$AnimatedSprite.play("lever")
	elif Input.is_action_pressed("ui_press_x"):
		$AnimatedSprite.play("atackleft")
	else:
		$AnimatedSprite.play("iddleleft")
	

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
			
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)

func _on_Lever_body_entered(body):
	if Input.is_action_just_pressed("ui_press_z"):
		$AnimatedSprite2.play("lever")
		yield(get_tree().create_timer(1.0),"timeout")
		$AnimatedSprite2.stop()

func _on_Skull_body_entered(body):
	score += 1
	print(score)

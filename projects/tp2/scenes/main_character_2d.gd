extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -450.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var audiosteamplayer = $AudioStreamPlayer

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	if (velocity.x > 1 || velocity.x < -1): 
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		audiosteamplayer.play()
		

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
	var isleft = velocity.x < 0
	sprite_2d.flip_h = isleft

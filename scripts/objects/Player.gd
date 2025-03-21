extends CharacterBody2D

@export var speed: int = 400
@export var gravity: int = 1200
@export var jump_speed: int = -400
@export var in_control: bool = true

@onready var sfx = {
	"Jump": $SFX/Jump,
	"Die": $SFX/Die,
}


func get_input():
	velocity.x = 0
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
		sfx.Jump.play()
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed


func enable_controls():
	in_control = true


func disable_controls():
	in_control = false
	velocity = Vector2(0, 0)


func kill():
	$CollisionShape2D.set_deferred("disabled", true)
	self.set_physics_process(false)
	disable_controls()

	$Sprite2D.set_visible(false)
	sfx.Die.play()


func _physics_process(delta):
	velocity.y += delta * gravity
	if in_control:
		get_input()
	move_and_slide()


func _process(_delta):
	if not is_on_floor():
		$Animator.play("Jump")
	elif velocity.x != 0:
		$Animator.play("Walk")
	else:
		$Animator.play("Idle")

	if velocity.x != 0:
		if velocity.x > 0:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true

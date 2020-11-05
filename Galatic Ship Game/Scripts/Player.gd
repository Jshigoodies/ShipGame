extends KinematicBody2D

const SPEED = 150
const FRICTION = 900
const ACCEL = 900

var velocity = Vector2.ZERO #moves character
var input = Vector2.ZERO #which direction the character move

onready var FireRate = $Timer

var bullet = preload("res://Main Game Scene/Bullet.tscn")


func _ready():
	$AnimationPlayer.play("LoopedBoosters")
	add_to_group("Player")


func _physics_process(delta):
	#gets direction
	input.y = (Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
	input.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	input = input.normalized()
	#print(str(input.x) + " " + str(input.y))
	
	#I want to add acceleration and friction
	if(input != Vector2.ZERO):
		velocity = velocity.move_toward(SPEED*input, ACCEL*delta)
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION*delta)
		
	
	
		
	velocity = move_and_slide(velocity)
	
	
func _on_Timer_timeout(): #It shoots out after the timer node reaches 0
	FireRate.set_timer_process_mode(0.15)
	if(Input.get_action_strength("ui_accept")):
		var Bullet1 = bullet.instance() #gun 1
		var Bullet2 = bullet.instance() #gun 2
		get_tree().get_root().add_child(Bullet1)
		get_tree().get_root().add_child(Bullet2)
		Bullet1.position = $Position.global_position #spawns in the bullet
		Bullet2.position = $Position2.global_position #spawns in the bullet







func _on_Area2D_area_entered(area):
	queue_free()
	#the enimies don't have collision with the rest of the world, so it can only detect Area2D nodes

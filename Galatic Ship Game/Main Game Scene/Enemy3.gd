extends KinematicBody2D

var HEALTH = 13

var velocity = Vector2.ZERO
var rng = RandomNumberGenerator.new()#a number of time to know when it stop moving
var StopTime

func _ready():
	add_to_group("Enemy")
	rng.randomize()
	StopTime = rng.randf_range(3, 7)

func _physics_process(delta):
	if(StopTime > 0):
		StopTime = StopTime - delta
		velocity = Vector2(0,0.4)
	else: 
		velocity = Vector2.ZERO
	
	
	velocity = move_and_collide(velocity)


func _on_Area2D_area_entered(area):
	if HEALTH != 0:
		HEALTH = HEALTH - 1
	else:
		queue_free()



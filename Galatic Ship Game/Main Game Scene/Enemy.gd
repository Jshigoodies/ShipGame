extends KinematicBody2D

var HEALTH = 3

var rng = RandomNumberGenerator.new()
var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Enemy")

func _process(delta):
	$AnimationPlayer.play("Boomer")
	rng.randomize()
	#var my_random_number = rng.randf_range(-7.0, 7.0)
	velocity = Vector2(0,3) #Goes straight down
	
	velocity = move_and_collide(velocity)


func _on_Area2D_area_entered(area): 	
	#if bullet enters enimes or enimies enter enimies (yes there is friendly fire for the bad guys)
	if HEALTH != 0:
		HEALTH = HEALTH - 1
	else:
		queue_free() 
	
	#pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #so it doesn't lag out the game





#func _on_Area2D_body_entered(Bullet):
#	queue_free()


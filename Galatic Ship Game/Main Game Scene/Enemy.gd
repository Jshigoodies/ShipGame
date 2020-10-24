extends KinematicBody2D


var rng = RandomNumberGenerator.new()
var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$AnimationPlayer.play("Boomer")
	rng.randomize()
	#var my_random_number = rng.randf_range(-7.0, 7.0)
	velocity = Vector2(0,3) #Goes straight down
	
	velocity = move_and_collide(velocity)


func _on_Area2D_area_entered(area):
	queue_free() #if bullet enters enimes or enimies enter enimies (yes there is friendly fire for the bad guys)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #so it doesn't lag out the game




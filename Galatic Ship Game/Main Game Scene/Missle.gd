extends KinematicBody2D

var velocity = Vector2.ZERO

func _ready():
	$AnimationPlayer.play("MissileBoosters")

func _physics_process(delta):
	
	#Insert Direction Of Bullet code to point at player and go in at the players direction here for Future me to Implement
	
	
	
	
	velocity = Vector2(0,5)
	velocity = move_and_collide(velocity)


func _collision_active():
	$AnimationPlayer.play("Activate")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_area_entered(area):
	queue_free()

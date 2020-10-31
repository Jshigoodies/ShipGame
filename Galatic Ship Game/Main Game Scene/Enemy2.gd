extends KinematicBody2D

var Gun = preload("res://Main Game Scene/Missle.tscn")
var TimeToFire = 5
var rng = RandomNumberGenerator.new()
var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Enemy")

func _process(delta):
	rng.randomize()
	TimeToFire = TimeToFire - delta #this enemy can shoot
	
	if(TimeToFire < 0):
		TimeToFire = rng.randf_range(4,6)
		
		var fire = Gun.instance()
		get_tree().get_root().add_child(fire)
		fire.position = $Position.global_position
		
		var fire2 = Gun.instance()
		get_tree().get_root().add_child(fire2)
		fire2.position = $Position2.global_position

		
	velocity = Vector2(0,0.2)
	
	velocity = move_and_collide(velocity)







func _on_Area2D_area_entered(area):
	queue_free()
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

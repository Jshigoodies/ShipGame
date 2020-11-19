extends KinematicBody2D


var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.


func setVeleocity(x, y):
	velocity = Vector2(x,y)

func _physics_process(delta):
	
	velocity = move_and_slide(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	velocity = Vector2(0,-10)
	
	velocity = move_and_collide(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_area_entered(area):
	
	queue_free()

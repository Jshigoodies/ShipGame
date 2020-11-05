extends KinematicBody2D

const SPEED = -8
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var explode = preload("res://Main Game Scene/Explode.tscn")
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	velocity = Vector2(0,SPEED)
	
	velocity = move_and_collide(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	var Explode = explode.instance()
	get_tree().get_root().add_child(Explode)
	Explode.position = global_position
	queue_free()


func _on_Area2D_area_entered(area):
	queue_free()


extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	$AttackMoves.play("Expand Attack")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	var vector = 2
	velocity = Vector2(vector,0)
	vector = vector * -1
	
	velocity = move_and_slide(velocity)
	

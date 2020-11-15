extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO

var HEALTH = 5

var timeUntilAttack = 10

var condition = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	
	#move to the right
	if(condition == true):
		if(position.x > 416):
			condition = false
		position.x = position.x + 1
	#move to the left
	if(condition == false):
		if(position.x < 96):
			condition = true
		position.x = position.x - 1
#velocity = move_and_slide(velocity)
	if(timeUntilAttack<0):
		timeUntilAttack = 10
		#ATTACK HERE <----------------------------Work on
	else:
		timeUntilAttack = timeUntilAttack - delta








func get_Health():
	return HEALTH

func _on_Area2D_area_entered(area):
	HEALTH = HEALTH - 1
	if(HEALTH == 0):
		queue_free()

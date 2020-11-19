extends KinematicBody2D

var rng = RandomNumberGenerator.new()

var boneAttack = preload("res://Main Game Scene/BONE.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO

var HEALTH = 1000 + 100 #100 to make up for the enimies that damage it

var timeUntilAttack = 5

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
		rng.randomize()
		timeUntilAttack = rng.randf_range(0,2)
		#ATTACK HERE <----------------------------Work on
		var bone = boneAttack.instance()
		bone.setVeleocity(0,10)
		get_tree().get_root().add_child(bone)
		bone.position = $AttackPlace.global_position
	else:
		timeUntilAttack = timeUntilAttack - delta








func get_Health():
	return HEALTH

func _on_Area2D_area_entered(area):
	HEALTH = HEALTH - 1
	if(HEALTH == 0):
		queue_free()

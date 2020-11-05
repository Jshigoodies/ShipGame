extends KinematicBody2D

var velocity = Vector2.ZERO

var random = RandomNumberGenerator.new()

var direction = 0

func _ready():
	random.randomize()
	direction = random.randf_range(-10,10)

func _physics_process(delta):
	
	
	velocity = Vector2(direction,10)

	velocity = move_and_slide(velocity)

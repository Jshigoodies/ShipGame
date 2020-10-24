extends Node2D



var rng = RandomNumberGenerator.new()

var difficulty1 = 10 #after 10 units of time 
var changeDiff1 = 9 #changes the unit of time

var difficulty2 = 5 #after 5 units of time
var changeDiff2 = 4 #changes the time


var Enemy = preload("res://Main Game Scene/Enemy.tscn")
var Enemy2 = preload("res://Main Game Scene/Enemy2.tscn")
# Called when the node enters the scene tree for the first time.
var condition = false

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#For Enemy2 Spawner
	difficulty2 = difficulty2 - delta
	
	if(difficulty2<0): #after the time reaches zero
		difficulty2 = changeDiff2 #increase the difficulty
		var BadGuy = Enemy.instance()
		get_tree().get_root().add_child(BadGuy)
		var my_random_number = rng.randf_range(128, 384) #the spawner would randomly spawn enimies in random locations between the domain (128,928)
		$Spawner.global_position.x = my_random_number
		$Spawner.global_position.y = -64
		BadGuy.position = $Spawner.global_position #spawn in
		
		changeDiff2 = changeDiff2 - 1 #increase the difficulty for future use
		if(changeDiff2<= 0.0): #if it reached max difficulty, then randomly spawn the faster or slower depending on rng
			var randomDiff2 = rng.randf_range(0,3)
			changeDiff2 = randomDiff2
			
	#For Enemy1 Spawner
	difficulty1 = difficulty1 - delta
	
	if(difficulty1 < 0):
		difficulty1 = changeDiff1
		var BadGuy2 = Enemy2.instance()
		get_tree().get_root().add_child(BadGuy2)
		var my_random_number2 = rng.randf_range(128,384)
		$Spawner2.global_position.x = my_random_number2
		$Spawner2.global_position.y = -64
		BadGuy2.position = $Spawner2.global_position
		
		changeDiff1 = changeDiff1 - 1
		if(changeDiff1 <= 0.0):
			var randomDiff1 = rng.randf_range(0,3)
			changeDiff1 = randomDiff1
	
	
	
	



func _on_Timer_timeout():
	#$RateSpawn/SpawnRate.get_timer_process_mode()
	
		
	condition = true #was used prevously for the rate of spawn, but it became hard to implement 'increase the difficulty'
	
	

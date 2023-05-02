extends Node2D

@export var SPEED = 1  # The movement speed of the object
@export var FIXED_TIME_STEP_FRAMES = 100  # The fixed time step in frames
@export var target_node: Node2D
@onready var Beep = get_node("EnemyBeepAudio")
var target_position = position  # The target position that the object should move to
var accumulated_frames = 0  # The accumulated frames since the last movement step
		
func _process(_delta):
	# Add the number of frames since the last _process call to the accumulated frames
	if (target_node.global_position - global_position).length() <= 1:
		get_tree().reload_current_scene()
	accumulated_frames += 1
	target_position = target_node.global_position
	# Move the object in fixed time steps
	while accumulated_frames >= FIXED_TIME_STEP_FRAMES:
		# Calculate the direction and distance to the target position
		var direction = (target_position - position).normalized()
		var distance = position.distance_to(target_position)
		
		# Move the object towards the target position if it is not already there
		if distance > 1:
			position += direction * SPEED
			Beep.play()
		
		# Subtract the fixed time step in frames from the accumulated frames
		accumulated_frames -= FIXED_TIME_STEP_FRAMES

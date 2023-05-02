extends Node2D

@export var SPEED = 1  # The movement speed of the object
@export var FIXED_TIME_STEP_FRAMES = 100  # The fixed time step in frames

var target_position = position  # The target position that the object should move to
var accumulated_frames = 0  # The accumulated frames since the last movement step
@onready var Beep = get_node("BeepAudio")
@onready var LowBeep = get_node("LowBeepAudio")

func _input(event):
	# Check if the player clicked the left mouse button
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		# Set the target position to the clicked position
		target_position = get_global_mouse_position()
		LowBeep.play()
		
func _process(_delta):
	# Add the number of frames since the last _process call to the accumulated frames
	accumulated_frames += 1
	
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

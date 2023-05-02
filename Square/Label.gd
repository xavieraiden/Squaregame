extends Label

func _ready():
	# Set the initial text of the Label node
	text = "Click to move"
	await get_tree().create_timer(5).timeout
	text = "Good"
	await get_tree().create_timer(2).timeout
	text = "Now Listen"
	await get_tree().create_timer(5).timeout
	text = "Run"
	await get_tree().create_timer(5).timeout
	text = ""

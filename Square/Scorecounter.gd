extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var score = 1 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	await get_tree().create_timer(15).timeout
	score += 1
	text = str(score)

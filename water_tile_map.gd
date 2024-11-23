extends TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	# set_cell(Vector2i(0, 3), 0, Vector2i(0, 1))

var raised = 0
var prevraised = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.x += 1
	if position.x > 47:
		position.x = 0
	position.y = raised + sin(Time.get_ticks_msec() / 1000.0) * 5.0
	raised -= 0.05
	#print(-(int(raised) / 16) + 7)
	if int(raised) % 16 == 0 && int(raised) != prevraised:
		prevraised = int(raised)
		#print("yurp")
		# -96 to 101
		for i in range(-96,101):
			set_cell(Vector2i(i, -(int(raised) / 16) + 8), 0, Vector2i(2, 3))
			#print(Vector2i(i, -(int(raised) / 16) + 8))
			pass

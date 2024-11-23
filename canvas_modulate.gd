extends CanvasModulate


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_color(Color(1,1,1))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("checking")
	if Input.is_action_just_pressed("ui_accept"):
		var rng = RandomNumberGenerator.new()
		var ranNum = rng.randf_range(0.0,1.0)
		#print("Test")
		if ranNum > 0.7:
			toggleDark()
	pass
	
func toggleDark() -> void:
	print("It works")
	set_color(Color(0,0,0))
	await get_tree().create_timer(1.0).timeout
	set_color(Color(1,1,1))
	#timer.connect("timeout", self, "_on_timer_timeout")
	pass

#func _on_timer_timeout() -> void:
	#set_color(Color(1,1,1))

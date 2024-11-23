extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var _animated_sprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction == 1:
			_animated_sprite.play("right")
		else:
			_animated_sprite.play("left")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		_animated_sprite.stop()

	move_and_slide()
	
	for i in range(get_slide_collision_count()):
		var collision = get_last_slide_collision()
		#print(collision.get_collider())
		if collision.get_collider().navigation_enabled == false:
			print("water")
			#var current_scene = get_tree().current_scene.filename
			# Reload the scene
			if get_tree() is SceneTree:
				get_tree().change_scene_to_file("res://node_2d.tscn")

extends CharacterBody3D

const SPEED := 4.0
const ACCELERATION := 25.0
const DECELERATION := 30.0
const ROTATION_SPEED := 10.0

@export var animation = Node

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := Vector3(input_dir.x, 0.0, input_dir.y).normalized()
	var sprint := 3.0 if Input.is_action_pressed("sprint") else 1.0
	var target_speed := SPEED * sprint

	if direction:
		var target_velocity := direction * target_speed
		velocity = velocity.move_toward(Vector3(target_velocity.x, velocity.y, target_velocity.z), ACCELERATION * delta)
		var target_rotation := atan2(direction.x, direction.z)
		rotation.y = lerp_angle(rotation.y, target_rotation, ROTATION_SPEED * delta)
		$TestDummyWalk/AnimationPlayer.play("mixamo_com")
	else:
		$TestDummyWalk/AnimationPlayer.stop()
		velocity.x = move_toward(velocity.x, 0.0, DECELERATION * delta)
		velocity.z = move_toward(velocity.z, 0.0, DECELERATION * delta)

	move_and_slide()

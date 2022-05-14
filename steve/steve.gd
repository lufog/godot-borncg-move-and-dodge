extends CharacterBody3D


const SPEED = 12.0
const ROTSPEED = 9.0

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var tree := get_tree()
@onready var mesh := get_node("Mesh") as MeshInstance3D


func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction := Vector3(input_dir.x, 0, input_dir.y).normalized()

	if direction != Vector3.ZERO:
		velocity = direction * SPEED
		
		# Rotate mesh
		var rotation_axis = Vector3(direction.z, 0.0, -direction.x)
		mesh.rotate(rotation_axis, deg2rad(ROTSPEED))
	else:
		velocity = velocity.lerp(Vector3.ZERO, 0.1)
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	move_and_slide()


func _on_enemy_body_entered(body: Node3D) -> void:
	if body.name == "Steve":
		tree.change_scene("res://ui/game_over.tscn")

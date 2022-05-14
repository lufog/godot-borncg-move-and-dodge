extends Area3D


signal coin_collected;

@onready var timer := get_node("Timer") as Timer
@onready var animation_player := get_node("AnimationPlayer") as AnimationPlayer


func _process(delta: float) -> void:
	rotate_y(deg2rad(-180 * delta))


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Steve":
		animation_player.play("bounce")
		timer.start()


func _on_timer_timeout() -> void:
	coin_collected.emit()
	queue_free()

extends Button


@onready var tree := get_tree()


func _ready() -> void:
	pass


func _on_pressed() -> void:
	tree.change_scene("res://level.tscn")

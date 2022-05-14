extends Label


var coins := 0

@onready var tree := get_tree()

func _ready() -> void:
	text = str(coins)


func _on_coin_collected() -> void:
	coins += 1
	text = str(coins)
	
	if coins == 2:
		tree.change_scene("res://ui/you_win.tscn")

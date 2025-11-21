extends Node

@onready var game_manager2 = %GameManager2


func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		queue_free()
		game_manager2.add_point()

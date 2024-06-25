extends Node2D


@export var is_empty: bool = true


func _on_area_2d_body_entered(_body):
	is_empty = false


func _on_area_2d_body_exited(_body):
	is_empty = true

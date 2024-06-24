extends Node2D


@onready var exit_point: Marker2D = $ExitPoint
var seats_list: Array[Node] = []


func get_seats_paths():
	for seat in seats_list:
		seat.init_path_to_seat(exit_point.global_position)


func _ready() -> void:
	seats_list = get_node("Seats").get_children()
	get_seats_paths()


extends Node2D


@onready var exit_point: Marker2D = $ExitPoint
var seats_list: Array[Node] = []


func _ready() -> void:
	seats_list = get_node("Seats").get_children()


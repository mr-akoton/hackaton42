extends Node2D


@onready var exit_point: Marker2D = $ExitPoint
var paths_list: Array[Node]


func search_seat(guy: Node2D):
	var chosen_seat = paths_list.pick_random()
	var chosen_path: Node = get_node(String(chosen_seat.get_path()) + "/PathFollow2D")
	guy.path_follow = chosen_path
	update_paths()


func is_free(path: Path2D) -> bool:
	var pathfollow: PathFollow2D = get_node(String(path.get_path()) + "/PathFollow2D")
	return  not pathfollow.progress


func update_paths() -> void:
	paths_list = get_node("Paths").get_children().filter(is_free)


func _ready() -> void:
	update_paths()

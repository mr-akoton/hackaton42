extends Node2D


@onready var path: Path2D = $Path2D
@onready var seat_center: Marker2D = $Marker2D
var is_empty: bool = true


func init_path_to_seat(destination: Vector2) -> void:
	path.curve.add_point(seat_center.position)
	path.curve.add_point(Vector2(destination.x, seat_center.position.y))
	path.curve.add_point(destination)


func _on_area_2d_body_entered(_body):
	is_empty = false


func _on_area_2d_body_exited(_body):
	is_empty = true

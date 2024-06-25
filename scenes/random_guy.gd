extends Node2D

signal show_money(money: Array[int])

@onready var sprite: Sprite2D = $Sprite
@onready var is_waiting_changes: bool = true
@onready var is_clickable: bool = false
var money: Array[int] = [0, 0]
var money_changes: int



func get_random_index() -> int:
	var index = randf_range(0.0, 1.0)
	
	if index <= 0.4:
		return 0
	elif index <= 0.7:
		return randi_range(1, 2)
	elif index <= 0.9:
		return randi_range(3, 4)
	else:
		return 5


func get_money() -> void:
	money[0] = Global.BIG_MONEY[get_random_index()]
	if money[0] == 500 or randi() % 2 == 0:
		money[1] = Global.LIL_MONEY.pick_random()
	money_changes = money[0] + money[1] - 600
	if money_changes == 0:
		is_waiting_changes = false


func _ready():
	sprite.frame = randi_range(0, 12)
	get_money()


func _process(_delta):
	if is_clickable and Input.is_action_just_pressed("left_click"):
		show_money.emit(money)


func _on_area_2d_mouse_entered():
	is_clickable = true


func _on_area_2d_mouse_exited():
	is_clickable = false

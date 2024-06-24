extends Node2D


static var LITTLE_MONEY: Array[int] = [100, 100, 100, 200]
static var BIG_MONEY: Array[int] = [500, 500, 500, 500, 500, 1000, 1000, 1000, 2000, 2000, 5000, 10000, 20000]
@onready var money: int = 0
@onready var expected_money_back: int = 0
@onready var bus_stop: int = randi_range(1, 3)
@onready var emotion: float = 3
@onready var emotion_decrease_speed: float = 0.0
@onready var area_2d: Area2D = $Area2D

var can_click: bool = false
var money_back: bool = false


func get_money() -> void:
	money = BIG_MONEY.pick_random()
	if money == 500:
		money += LITTLE_MONEY.pick_random()
	else:
		if (randi() % 2 == 0):
			money += LITTLE_MONEY.pick_random()


func _ready() -> void:
	get_money()
	if bus_stop == 1:
		emotion_decrease_speed = 0.01
	elif bus_stop == 2:
		emotion_decrease_speed = 0.02
	elif bus_stop == 3:
		emotion_decrease_speed = 0.03
	expected_money_back = money - 600
	if (expected_money_back == 0):
		money_back = true


func update_emotion() -> void:
	emotion -= emotion_decrease_speed
	if emotion <= 0:
		emotion = 0
	#if ceil(emotion) == 3:
		#print("I'm fine :D !")
	#elif ceil(emotion) == 2:
		#print("I'm pissed :( !")
	#elif ceil(emotion) == 1:
		#print("I'm angry >:( !")
	#else:
		#print("I'm out !!!")


func _process(_delta) -> void:
	if not money_back:
		update_emotion()


func _on_area_2d_mouse_entered():
	can_click = true


func _on_area_2d_mouse_exited():
	can_click = false

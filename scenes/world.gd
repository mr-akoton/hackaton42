extends Node2D

@onready var travel_time: Timer = $Timers/TravelTime
@onready var bus_stop = randi_range(5, 10)
@onready var current_bus_stop = 0
@onready var random_guys = $RandomGuys
var is_bus_stopped: bool = true
var random_guys_list: Array[Node]

func start_run() -> void:
	print("Is running...")
	random_guys_list = random_guys.get_children()
	is_bus_stopped = false
	show_money()
	travel_time.start()


func show_money() -> void:
	for guy in random_guys_list:
		print(guy.money)


func _process(delta):
	if is_bus_stopped:
		start_run()


func _on_travel_time_timeout():
	print("Bus stopped !")
	is_bus_stopped = true

extends Node2D

@onready var random_guy = preload("res://scenes/random_guy.tscn")
@onready var money_deck: Node = $UI/MoneyDeck
@onready var guys_list: Array[Node]
@onready var big_money: Node2D = $UI/GuyMoney/BigMoney
@onready var lil_money: Node2D = $UI/GuyMoney/LilMoney
@onready var bus: Node2D = $Bus
@onready var travel_duration: Array[int] = [0, 0, 0]
@onready var running = true

@onready var spawn_timer: Timer = $Timer/SpawnTimer
@onready var travel_timer = $Timer/TravelTimer
@onready var travel_segment_timer = $Timer/TravelSegmentTimer

var targeted_guy: Node2D = null
var segment_number = 3
var current_segment = 0


func generate_random_guy() -> void:
	var number: int = randi_range(3, 7)
	
	for i in number:
		spawn_timer.wait_time = randf_range(0.5, 1.0)
		spawn_timer.start()
		await spawn_timer.timeout
		var guy = random_guy.instantiate()
		bus.search_seat(guy)
		guy.enter_path()
		guy.connect("be_targeted", get_target)
		guys_list.append(guy)
	
	travel_timer.start()
	print(current_segment)
	travel_segment_timer.wait_time = travel_duration[current_segment]
	current_segment += 1
	travel_segment_timer.start()


func get_target(target: Node2D) -> void:
	targeted_guy = target
	lil_money.visible = true
	big_money.visible = true
	big_money.value = target.money[0]
	lil_money.value = target.money[1]
	big_money.update_sprite()
	lil_money.update_sprite()


func give_money() -> void:
	if targeted_guy:
		if targeted_guy.receive_money(Global.money_change):
			Global.money_from_guy += 600 + (targeted_guy.expected_money - Global.money_change)
			targeted_guy = null
			lil_money.visible = false
			big_money.visible = false
			money_deck.clear_money_deck()
			print(Global.money_from_guy)


func update_money_deck(action: String, value: int) -> void:
	if action == "add" && targeted_guy:
		money_deck.add_money_to_deck(value)


func _ready() -> void:
	lil_money.visible = false
	big_money.visible = false
	for i in range(3):
		travel_duration[i] = randi_range(5, 5)
		travel_timer.wait_time += travel_duration[i] - 0.05
	generate_random_guy()
	
	var player_moneys = get_node("UI/PlayerMoney").get_children()
	for money in player_moneys:
		money.connect("clicked_money", update_money_deck)
	
	money_deck.connect("send_money", give_money)
	print(travel_duration)
	print(travel_timer.wait_time)

func _process(_delta):
	if running:
		if Input.is_action_just_pressed("right_click"):
			money_deck.clear_money_deck()


func _on_travel_segment_timer_timeout():
	if current_segment < 3:
		travel_timer.stop()
		generate_random_guy()


func _on_travel_timer_timeout():
	running = false
	

extends Node

signal send_money()

@onready var container = preload("res://scenes/money_container.tscn")
@onready var money_count : int = 0
@onready var minute = $CanvasLayer/Timer/Minute
@onready var second = $CanvasLayer/Timer/Second


func clear_money_deck() -> void:
	Global.money_change = 0
	money_count = 0
	var moneys = get_node("CanvasLayer/HBoxContainer").get_children()
	for money in moneys:
		money.queue_free()


func add_money_to_deck(value: int) -> void:
	var last_money_change = Global.money_change
	
	if money_count < 6:
		Global.money_change += value
		if Global.money_change == last_money_change:
			return
		money_count += 1
		var money = container.instantiate()
		get_node("CanvasLayer/HBoxContainer").add_child(money)
		money.update_sprite(value)
	print(Global.money_change)


func update_timer_text(time: int):
	var minu = ceil(time) / 60
	var sec = time % 60
	minute.text = "%02d" % minu
	second.text = "%02d" % sec


func _on_send_pressed():
	send_money.emit()


func _on_clear_pressed():
	clear_money_deck()

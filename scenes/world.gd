extends Node2D

@onready var guys_list: Array[Node]


func print_money(money: Array[int]):
	print(money)


func _ready() -> void:
	guys_list = get_node("Guys").get_children()
	for guy in guys_list:
		guy.connect("show_money", print_money)

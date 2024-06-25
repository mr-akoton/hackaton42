extends Node2D

@onready var guys_list: Array[Node]
@onready var big_money: Node2D = $UI/GuyMoney/BigMoney
@onready var lil_money: Node2D = $UI/GuyMoney/LilMoney
@onready var money_deck: Node = $UI/MoneyDeck


func get_target(target: Node2D):
	lil_money.visible = true
	big_money.visible = true
	big_money.value = target.money[0]
	lil_money.value = target.money[1]
	big_money.update_sprite()
	lil_money.update_sprite()


func update_money_deck(action: String, value: int) -> void:
	if action == "add":
		money_deck.add_money_to_deck(value)


func _ready() -> void:
	lil_money.visible = false
	big_money.visible = false
	guys_list = get_node("Guys").get_children()
	for guy in guys_list:
		guy.connect("be_targeted", get_target)
	
	var player_moneys = get_node("UI/PlayerMoney").get_children()
	for money in player_moneys:
		money.connect("clicked_money", update_money_deck)

func _process(_delta):
	if Input.is_action_just_pressed("right_click"):
		money_deck.clear_money_deck()
	

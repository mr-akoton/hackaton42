extends Node2D

@onready var guys_list: Array[Node]
@onready var big_money: Node2D = $UI/GuyMoney/BigMoney
@onready var lil_money: Node2D = $UI/GuyMoney/LilMoney
@onready var money_deck: Node = $UI/MoneyDeck
var targeted_guy: Node2D = null


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
	guys_list = get_node("Guys").get_children()
	for guy in guys_list:
		guy.connect("be_targeted", get_target)
	
	var player_moneys = get_node("UI/PlayerMoney").get_children()
	for money in player_moneys:
		money.connect("clicked_money", update_money_deck)
	
	money_deck.connect("send_money", give_money)

func _process(_delta):
	if Input.is_action_just_pressed("right_click"):
		money_deck.clear_money_deck()

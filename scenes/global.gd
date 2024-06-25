extends Node

const LIL_MONEY = [100, 200]
const BIG_MONEY = [500, 1000, 2000, 5000, 10000, 20000]

var money_from_guy: int = 0
var money_change: int = 0:
	set(value):
		if value >= 20000:
			money_change = money_change
		else:
			money_change = clamp(value, 0, 20000)

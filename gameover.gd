extends Node2D

@onready var label = $CanvasLayer/VBoxContainer/Label
@onready var label_2 = $CanvasLayer/VBoxContainer/Label2


func _ready():
	label.text = "GAMEOVER"
	label_2.text = "Score : %05d" % Global.money_from_guy

func _process(_delta):
	label.text = "GAMEOVER"
	label_2.text = "Score : %05d" % Global.money_from_guy

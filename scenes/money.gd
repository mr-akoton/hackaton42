extends Node2D

signal clicked_money(action: String, value: int)

@onready var sprite = $Object/Sprite
@onready var animation_player = $AnimationPlayer
@onready var is_clickable: bool = false
@export var value: int = 100


func update_sprite() -> void:
	if value == 0:
		sprite.visible = false
	else:
		sprite.visible = true
	if value <= 100:
		sprite.frame = 0
	elif value <= 200:
		sprite.frame = 1
	elif value <= 500:
		sprite.frame = 2
	elif value <= 1000:
		sprite.frame = 3
	elif value <= 2000:
		sprite.frame = 4
	elif value <= 5000:
		sprite.frame = 5
	elif value <= 10000:
		sprite.frame = 6
	else:
		sprite.frame = 7


func add_money_to_change() -> void:
	clicked_money.emit("add", value)


func _ready():
	update_sprite()


func _process(_delta):
	if Input.is_action_just_pressed("left_click") and is_clickable:
		add_money_to_change()


func _on_area_2d_mouse_entered():
	if self.is_in_group("player"):
		animation_player.play("take")
	is_clickable = true


func _on_area_2d_mouse_exited():
	if self.is_in_group("player"):
		animation_player.play_backwards("take")
	is_clickable = false

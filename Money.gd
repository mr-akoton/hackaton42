extends Node2D

@onready var sprite = $Object/Sprite
@onready var animation_player = $AnimationPlayer
@export var value: int = 100

func update_sprite() -> void:
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

func _ready():
	update_sprite()


func _on_area_2d_mouse_entered():
	animation_player.play("take")


func _on_area_2d_mouse_exited():
	animation_player.play_backwards("take")

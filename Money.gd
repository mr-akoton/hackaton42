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

func _ready():
	update_sprite()


func _on_area_2d_mouse_entered():
	animation_player.play("take")


func _on_area_2d_mouse_exited():
	animation_player.play_backwards("take")

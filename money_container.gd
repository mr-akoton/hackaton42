extends Container


@onready var sprite: Sprite2D = $Sprite


func update_sprite(value: int) -> void:
	if sprite:
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

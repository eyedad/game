extends Node2D

# Экспортируемые переменные
@export var circle_spawn_diameter: float = 150.0
@export var rectangle_spawn_dimensions: Vector2 = Vector2(150, 150)

func _draw():
	# Устанавливаем цвет линий
	draw_circle(Vector2(), circle_spawn_diameter / 2, Color(1, 0, 0))
	draw_rect(Rect2(Vector2(-rectangle_spawn_dimensions.x / 2, -rectangle_spawn_dimensions.y / 2), rectangle_spawn_dimensions), Color(0, 0, 1))

func _parse_begin(object):
	_draw()

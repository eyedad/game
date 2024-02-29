@tool
extends Node2D
class_name spawner

enum Shape{
	Circle, 
	Rectangle,
}
# Экспортируем ресурс для объектов, которые будем спаунить
@export var objectToSpawn: PackedScene

# Параметры спавна
@export var spawnInterval: float = 2.0
@export var maxSpawnCount: int = 10
@export var team: Relationship.Team=GS.Team.TRAMP
#@export_category("Statistics")
@export var shape: Shape=Shape.Circle
@export var circle_spawn_diameter: float = 150.0
@export var rectangle_spawn_dimensions:Vector2=Vector2(150, 150)
@export var borders_visible: bool = true
#@export_flags("Fire", "Water", "Earth", "Wind") var spell_elements = 0


# Таймер для управления спавном
var spawnTimer: float = 0.0
var spawnedCount: int = 0

	
var delete_draw = false
func _process(delta):
	if Engine.is_editor_hint():
		if borders_visible:
			queue_redraw()
			delete_draw = true
			
		if not borders_visible:
			if delete_draw:
				queue_redraw()
		
	if not Engine.is_editor_hint():
		spawnTimer += delta
		if spawnTimer >= spawnInterval and spawnedCount < maxSpawnCount:
			# Спауним новый объект
			spawnObject(self)
			# Сбрасываем таймер
			spawnTimer = 0.0
		if spawnedCount >= maxSpawnCount:
			self.queue_free()

func spawnObject(spawner) -> void:
	# Проверяем, что у нас есть объект для спавна
	if objectToSpawn != null:
		# Создаем экземпляр объекта
		var newObject = objectToSpawn.instantiate()
		var parent=spawner.get_parent()
		var random_point = get_random_point()
		newObject.position=spawner.position+random_point
		newObject.team=team
		parent.add_child(newObject)
		# Увеличиваем счетчик спауненных объектов
		spawnedCount += 1
		#print(spawnedCount)
	else:
		# Выводим предупреждение, если объект для спавна не указан
		print("Warning: Object to spawn is not set!")
		
# Получаем случайную точку внутри CollisionShape2D
func get_random_point() -> Vector2:
	match shape:
		Shape.Rectangle:
			var size = rectangle_spawn_dimensions/2
			return Vector2(
				randf_range(-size.x, size.x),
				randf_range(-size.y, size.y)
			)
		Shape.Circle:
			var radius = circle_spawn_diameter/2
			var random_radis=randf_range(0, radius)
			#print(radius)

			var angle = randf_range(0, 6.283)
			return Vector2(random_radis * cos(angle), random_radis * sin(angle))
	return Vector2.ZERO

func _draw():
	if borders_visible:
		if shape == Shape.Circle:
			# Центр круга(красный)	
			draw_line(Vector2(circle_spawn_diameter / 2, 0), Vector2(circle_spawn_diameter / 2 * 0.923879, circle_spawn_diameter / 2 * 0.382683), Color(1, 0, 0))
			draw_line(Vector2(circle_spawn_diameter / 2 * 0.923879, circle_spawn_diameter / 2 * 0.382683), Vector2(circle_spawn_diameter / 2 * 0.707107, circle_spawn_diameter / 2 * 0.707107), Color(1, 0, 0))
			draw_line(Vector2(circle_spawn_diameter / 2 * 0.707107, circle_spawn_diameter / 2 * 0.707107), Vector2(circle_spawn_diameter / 2 * 0.382683, circle_spawn_diameter / 2 * 0.923879), Color(1, 0, 0))
			draw_line(Vector2(circle_spawn_diameter / 2 * 0.382683, circle_spawn_diameter / 2 * 0.923879), Vector2(0, circle_spawn_diameter / 2), Color(1, 0, 0))
			draw_line(Vector2(0, circle_spawn_diameter / 2), Vector2(-circle_spawn_diameter / 2 * 0.382683, circle_spawn_diameter / 2 * 0.923879), Color(1, 0, 0))
			draw_line(Vector2(-circle_spawn_diameter / 2 * 0.382683, circle_spawn_diameter / 2 * 0.923879), Vector2(-circle_spawn_diameter / 2 * 0.707107, circle_spawn_diameter / 2 * 0.707107), Color(1, 0, 0))
			draw_line(Vector2(-circle_spawn_diameter / 2 * 0.707107, circle_spawn_diameter / 2 * 0.707107), Vector2(-circle_spawn_diameter / 2 * 0.923879, circle_spawn_diameter / 2 * 0.382683), Color(1, 0, 0))
			draw_line(Vector2(-circle_spawn_diameter / 2 * 0.923879, circle_spawn_diameter / 2 * 0.382683), Vector2(-circle_spawn_diameter / 2, 0), Color(1, 0, 0))
			draw_line(Vector2(-circle_spawn_diameter / 2, 0), Vector2(-circle_spawn_diameter / 2 * 0.923879, -circle_spawn_diameter / 2 * 0.382683), Color(1, 0, 0))
			draw_line(Vector2(-circle_spawn_diameter / 2 * 0.923879, -circle_spawn_diameter / 2 * 0.382683), Vector2(-circle_spawn_diameter / 2 * 0.707107, -circle_spawn_diameter / 2 * 0.707107), Color(1, 0, 0))
			draw_line(Vector2(-circle_spawn_diameter / 2 * 0.707107, -circle_spawn_diameter / 2 * 0.707107), Vector2(-circle_spawn_diameter / 2 * 0.382683, -circle_spawn_diameter / 2 * 0.923879), Color(1, 0, 0))
			draw_line(Vector2(-circle_spawn_diameter / 2 * 0.382683, -circle_spawn_diameter / 2 * 0.923879), Vector2(0, -circle_spawn_diameter / 2), Color(1, 0, 0))
			draw_line(Vector2(0, -circle_spawn_diameter / 2), Vector2(circle_spawn_diameter / 2 * 0.382683, -circle_spawn_diameter / 2 * 0.923879), Color(1, 0, 0))
			draw_line(Vector2(circle_spawn_diameter / 2 * 0.382683, -circle_spawn_diameter / 2 * 0.923879), Vector2(circle_spawn_diameter / 2 * 0.707107, -circle_spawn_diameter / 2 * 0.707107), Color(1, 0, 0))
			draw_line(Vector2(circle_spawn_diameter / 2 * 0.707107, -circle_spawn_diameter / 2 * 0.707107), Vector2(circle_spawn_diameter / 2 * 0.923879, -circle_spawn_diameter / 2 * 0.382683), Color(1, 0, 0))
			draw_line(Vector2(circle_spawn_diameter / 2 * 0.923879, -circle_spawn_diameter / 2 * 0.382683), Vector2(circle_spawn_diameter / 2, 0), Color(1, 0, 0))
					
			draw_line(Vector2(-circle_spawn_diameter / 2, 0), Vector2(circle_spawn_diameter / 2, 0), Color(1, 0, 0))
			draw_line(Vector2(0, -circle_spawn_diameter / 2), Vector2(0, circle_spawn_diameter / 2), Color(1, 0, 0))
		if shape == Shape.Rectangle:
			# Рисуем прямоугольник(синий)
			var half_size = rectangle_spawn_dimensions / 2
			draw_line(Vector2(-half_size.x, -half_size.y), Vector2(half_size.x, -half_size.y), Color(0, 0, 1))
			draw_line(Vector2(half_size.x, -half_size.y), Vector2(half_size.x, half_size.y), Color(0, 0, 1))
			draw_line(Vector2(half_size.x, half_size.y), Vector2(-half_size.x, half_size.y), Color(0, 0, 1))
			draw_line(Vector2(-half_size.x, half_size.y), Vector2(-half_size.x, -half_size.y), Color(0, 0, 1))
			
			draw_line(Vector2(-rectangle_spawn_dimensions.x / 2, 0), Vector2(rectangle_spawn_dimensions.x / 2, 0), Color(0, 0, 1))
			draw_line(Vector2(0, -rectangle_spawn_dimensions.y / 2), Vector2(0, rectangle_spawn_dimensions.y / 2), Color(0, 0, 1))

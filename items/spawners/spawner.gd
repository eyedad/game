extends Node

# Экспортируем ресурс для объектов, которые будем спаунить
@export var objectToSpawn: PackedScene

# Параметры спавна
@export var spawnInterval: float = 1.0
@export var maxSpawnCount: int = 10
@export var team: Relationship.Team=GS.Team.TRAMP

# Таймер для управления спавном
var spawnTimer: float = 0.0
var spawnedCount: int = 0

func _process(delta: float) -> void:
	# Обновляем таймер
	spawnTimer += delta
	
	# Проверяем, прошло ли достаточно времени для спавна нового объекта
	if spawnTimer >= spawnInterval and spawnedCount < maxSpawnCount:
		# Спауним новый объект
		spawnObject(self)
		# Сбрасываем таймер
		spawnTimer = 0.0

func spawnObject(spawner) -> void:
	# Проверяем, что у нас есть объект для спавна
	if objectToSpawn != null:
		# Создаем экземпляр объекта
		var newObject = objectToSpawn.instantiate()
		var parent=spawner.get_parent()
		newObject.position=spawner.position
		newObject.team=team
		parent.add_child(newObject)
		# Увеличиваем счетчик спауненных объектов
		spawnedCount += 1
	else:
		# Выводим предупреждение, если объект для спавна не указан
		print("Warning: Object to spawn is not set!")

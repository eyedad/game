extends CharacterBody2D
class_name creature
var speed = 500
var attack_timer: float = 0
var attack_cooldown: float = 1.0  # Время перезарядки атаки в секундах
var attack_sprite = preload("res://bullet.png")
func _ready():
	pass
func _physics_process(delta):
	update_input_keyboard()
	update_input_mouse()
	move_and_slide()
	attack_timer -= delta
	
func update_input_mouse():
	# Получение позиции мыши в мировых координатах
	var mouse_position: Vector2 = get_global_mouse_position()
	# Вычисление вектора направления от персонажа к мыши
	var direction: Vector2 = (mouse_position - global_position).normalized()
	rotation = direction.angle()
	attack()

func update_input_keyboard():
	velocity=Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	# Нормализация вектора скорости, чтобы движение по диагонали не было быстрее
	velocity = velocity.normalized() * speed
func attack():
	if Input.is_action_pressed("attack") and attack_timer <= 0:
		print("attack!")
		var attack_instance = Sprite2D.new()
		attack_instance.texture = attack_sprite  # Устанавливаем текстуру атаки
		attack_instance.global_position = global_position  # Устанавливаем начальную позицию атаки
		attack_instance.rotation = rotation  # Устанавливаем поворот атаки
		add_child(attack_instance)  # Добавляем спрайт атаки к персонажу

		# Запускаем таймер перезарядки атаки
		attack_timer = attack_cooldown
		await get_tree().create_timer(1).timeout
		attack_instance.queue_free()
		# Уничтожаем спрайт атаки через 1 секунду
		print("пуля удалена")
		
		
	

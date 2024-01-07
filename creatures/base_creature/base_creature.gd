extends CharacterBody2D
var speed = 200
func _ready():
	pass
func _physics_process(delta):
	update_input_keyboard()
	update_input_mouse()
	move_and_slide()
	
func update_input_mouse():
	# Получение позиции мыши в мировых координатах
	var mouse_position: Vector2 = get_global_mouse_position()
	# Вычисление вектора направления от персонажа к мыши
	var direction: Vector2 = (mouse_position - global_position).normalized()
	rotation = direction.angle()

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
	

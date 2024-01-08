extends Creature
func _ready():
	pass
func _physics_process(delta):
	update_input_keyboard()
	move_and_slide()
	weapon.attack(self, delta, $shoot_point.position)
	
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

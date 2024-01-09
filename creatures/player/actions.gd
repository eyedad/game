extends Node2D
func manual_control_move(delta, obj:Creature, shoot_point_position:Vector2):
	obj.velocity=Vector2()
	if Input.is_action_pressed("right"):
		obj.velocity.x += 1
	if Input.is_action_pressed("left"):
		obj.velocity.x -= 1
	if Input.is_action_pressed("down"):
		obj.velocity.y += 1
	if Input.is_action_pressed("up"):
		obj.velocity.y -= 1
	# Нормализация вектора скорости, чтобы движение по диагонали не было быстрее
	obj.velocity = obj.velocity.normalized() * obj.speed
	obj.weapon.attack(obj, delta, shoot_point_position)

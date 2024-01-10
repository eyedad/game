extends Node2D
func manual_control_move(delta, obj:State_machine, shoot_point_position:Vector2, global_mouse_position:Vector2):
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

	if not obj.weapon == null and Input.is_action_pressed("attack"):
		var direction: Vector2
		var creature_position: Vector2
		creature_position=obj.position
		#global_mouse_position = to_global(DisplayServer.mouse_get_position())
		#global_mouse_position = get_global_mouse_position()
		var global_shoot_point_position=shoot_point_position*obj.scale+creature_position
		direction = (global_mouse_position - global_shoot_point_position).normalized()
		obj.weapon.attack(obj, global_shoot_point_position, direction.angle())
	
		
func auto_control_move(delta, obj:State_machine, shoot_point_position:Vector2):
	obj.velocity=Vector2()
	var player_in_sight
	for element in obj.enemy_in_detector_area:
		if element.name == "Player":
			player_in_sight=element
			continue
		else:
			player_in_sight=null
	#print(player_in_sight)
	if player_in_sight:
		if not obj.weapon == null:
			var vector_to_player : Vector2 = player_in_sight.position - obj.position
			var preem_vector_to_player = vector_to_player+(vector_to_player.length() * player_in_sight.velocity)/800
			var global_shoot_point_position = shoot_point_position*obj.scale+obj.position
			
			obj.weapon.attack(obj, global_shoot_point_position, preem_vector_to_player.angle())
			
			if vector_to_player.length()>=400:
				obj.velocity = vector_to_player
				obj.velocity = obj.velocity.normalized() * obj.speed



func damages_state(delta, obj:State_machine):
	obj.velocity=Vector2()
	

extends Node2D
func manual_control_move(delta, obj:Creature, shoot_point_position:Vector2, global_mouse_position:Vector2):
	obj.velocity=Vector2()
	#obj.camera = camera
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
		#print(self)
		var direction: Vector2
		var creature_position: Vector2
		creature_position=obj.position
		#global_mouse_position = to_global(DisplayServer.mouse_get_position())
		#global_mouse_position = get_global_mouse_position()
		var global_shoot_point_position=shoot_point_position*obj.scale+creature_position
		direction = (global_mouse_position - global_shoot_point_position).normalized()
		obj.weapon.attack(obj, global_shoot_point_position, direction.angle())
	
	 
func camera_control(camera: Camera2D):
	if Input.is_action_pressed("mouse_weel_up"):
		#print(camera.zoom)
		camera.zoom += Vector2(0.01, 0.01)
	if Input.is_action_pressed("mouse_weel_down"):
		#print(camera.zoom)
		camera.zoom -= Vector2(0.01, 0.01)


var player_last_position: Vector2

func auto_control_move(delta, obj:Creature, shoot_point_position:Vector2):
	obj.velocity=Vector2()
	var player_in_sight
	for element in obj.enemy_in_detector_area:
		if element.name == "player":
			player_in_sight=element
			continue
		else:
			player_in_sight=null
	#print(player_last_position)
	if player_in_sight:
		if not obj.weapon == null:
			var vector_to_player = player_in_sight.position - obj.position
			var preem_vector_to_player = vector_to_player+(vector_to_player.length() * player_in_sight.velocity)/800
			var global_shoot_point_position = shoot_point_position*obj.scale+obj.position
			player_last_position = player_in_sight.position
			obj.weapon.attack(obj, global_shoot_point_position, preem_vector_to_player.angle())
			
			if vector_to_player.length() >= obj.combat_distance:
				obj.velocity = vector_to_player
				obj.velocity = obj.velocity.normalized() * obj.speed
		
	elif player_in_sight == null and player_last_position != Vector2():
		var vector_to_player_last_position = player_last_position - obj.position
		obj.velocity = vector_to_player_last_position.normalized() * obj.speed
		if vector_to_player_last_position.length() < 10:
			player_last_position = Vector2()
		
func damages_state(delta, obj:Creature):
	#print("damaged")
	obj.velocity=Vector2()
	

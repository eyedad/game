extends Node2D
func manual_control_move(delta, obj:Creature, global_mouse_position:Vector2):
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
		obj.weapon.attack(global_mouse_position)
	
	 
func camera_control(camera: Camera2D, is_player:bool):
	if is_player:
		camera.visible=true
		camera.enabled=true
	else:
		camera.visible=false
		camera.enabled=false
	if Input.is_action_just_pressed("mouse_weel_up"):
		camera.zoom += Vector2(0.05, 0.05)
	if Input.is_action_pressed("mouse_weel_up"):
		camera.zoom += Vector2(0.01, 0.01)
		
	if Input.is_action_just_pressed("mouse_weel_down"):
		camera.zoom -= Vector2(0.05, 0.05)
	if Input.is_action_pressed("mouse_weel_down"):
		camera.zoom -= Vector2(0.01, 0.01)


var enemy_last_position: Vector2
func delay(ms):
	OS.delay_msec(ms)
	return 1

func auto_control_move(delta, obj:Creature):
	await delay(1000)
	print(obj.position)
	obj.velocity=Vector2()
	var enemy
	for element in obj.enemy_in_detector_area:
		if GS.relationship_test(obj, element):
			enemy=element
			continue
	#print(player_last_position)
	if enemy:
		if not obj.weapon == null:
			var vector_to_enemy = enemy.position - obj.position
			var preem_vector_to_enemy = vector_to_enemy+(vector_to_enemy.length() * enemy.velocity)/800
			var global_preem_vector_to_enemy = obj.position + preem_vector_to_enemy
			enemy_last_position = obj.nav_agent.target_position
			if obj.i_see_enemy == true:
				pass
				#obj.weapon.attack(global_preem_vector_to_enemy)
			
#-------------------------------- MOVEMENT ----------------------------------------
			if vector_to_enemy.length() >= obj.combat_distance:
				obj.velocity = (-obj.global_position + obj.nav_agent.get_next_path_position()).normalized() * obj.speed

				#print(obj.nav_agent.)
		
	elif enemy == null and enemy_last_position != Vector2():
		var vector_to_enemy_last_position = enemy_last_position - obj.position
		obj.velocity = (-obj.global_position + obj.nav_agent.get_next_path_position()).normalized() * obj.speed
		if vector_to_enemy_last_position.length() < 10:
			obj.velocity = Vector2()

func make_path(obj: Creature):
	if obj.i_see_enemy == true:
		var enemy
		for element in obj.enemy_in_detector_area:
			if GS.relationship_test(obj, element):
				enemy=element
				continue
		if enemy != null:
			obj.nav_agent.target_position = enemy.position
	
func damages_state(delta, obj:Creature):
	#print("damaged")
	obj.velocity=Vector2()
	

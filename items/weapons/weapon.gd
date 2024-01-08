extends Node2D
class_name weapon
@export var damae:int = 10
@export var attack_speed:float = 2
@export var clip_size:int = 4
@export var reload_time:int = 1
@export var arrow:PackedScene
var attack_timer=0
var global_mouse_position
var direction: Vector2
var creature_position: Vector2
func attack(creature, delta, shoot_point_position):
	attack_timer-=delta
	if Input.is_action_pressed("attack") and attack_timer <= 0:
		creature_position=creature.position
		print("attack!")
		attack_timer = reload_time
		global_mouse_position = get_global_mouse_position()
		var global_shoot_point_position=shoot_point_position*creature.scale+creature_position
		direction = (global_mouse_position - global_shoot_point_position).normalized()
		print(direction)
		var instate=arrow.instantiate()
		instate.global_position=global_shoot_point_position
		instate.rotation=direction.angle()
		print(direction.angle())
		add_child(instate)
		#var attack_instance = Sprite2D.new()
		#attack_instance.texture = "res://bullet.png"
		#attack_instance.global_position = global_position  # Устанавливаем начальную позицию атаки
		#attack_instance.rotation = rotation  # Устанавливаем поворот атаки
		#add_child(attack_instance)  # Добавляем спрайт атаки к персонажу
#
		## Запускаем таймер перезарядки атаки
		#attack_timer = attack_cooldown
		#await get_tree().create_timer(1).timeout
		#attack_instance.queue_free()
		## Уничтожаем спрайт атаки через 1 секунду
		#print("пуля удалена")
	

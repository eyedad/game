extends Node2D

# Ссылки на камеру и интерфейс
@onready var camera = $Camera2D
@onready var ui = $show_inventory


func _process(delta: float) -> void:
	camera_control(camera)

func camera_control(camera: Camera2D) -> void:
	# Обработка увеличения зума
	if Input.is_action_just_pressed("mouse_weel_up"):
		camera.zoom += Vector2(0.05, 0.05)
	if Input.is_action_pressed("mouse_weel_up"):
		camera.zoom += Vector2(0.01, 0.01)
	
	# Обработка уменьшения зума
	if Input.is_action_just_pressed("mouse_weel_down"):
		camera.zoom -= Vector2(0.05, 0.05)
	if Input.is_action_pressed("mouse_weel_down"):
		camera.zoom -= Vector2(0.01, 0.01)

	# Применение масштаба к интерфейсу
	var root_node_size = get_tree().get_root().size
	ui.scale = Vector2(1/camera.zoom.x, 1/camera.zoom.y)
	ui.position = Vector2(-root_node_size.x*ui.scale.x/2, -root_node_size.y*ui.scale.y/2)


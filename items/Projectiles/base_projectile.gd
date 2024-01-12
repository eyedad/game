extends CharacterBody2D
class_name Projectile

var damage

@export var status_effect: Dictionary= {"poison":[2, 4]}
@export var speed=500
var direction
func _ready():
	direction=Vector2.from_angle(rotation)
func _physics_process(delta):
	velocity=speed*direction
	move_and_slide()
	await get_tree().create_timer(2).timeout
	$".".queue_free()


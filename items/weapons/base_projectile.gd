extends CharacterBody2D
class_name Projectile

var damage
var gunslinger:Creature

@export var status_effect: Dictionary= {"poison":[2, 4], "slow":[0.5, 4]}
@export var speed=500
var direction
func _ready():
	#var status_effect_2:Dictionary = {"vampyre":[3, 4, gunslinger]}
	##print(gunslinger)
	#status_effect.merge(status_effect_2)
	#print(status_effect)
	direction=Vector2.from_angle(rotation)
func _physics_process(delta):
	#print(status_effect)
	velocity=speed*direction
	move_and_slide()
	await get_tree().create_timer(0.8).timeout
	$".".queue_free()


func _on_area_2d_body_entered(body):
	if body.name == "TileMap":
		queue_free()

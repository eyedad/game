extends Node2D
class_name Melee_attack

var damage
var gunslinger:Creature
var direction

@export var status_effect: Dictionary= {"poison":[2, 4], "slow":[0.5, 4]}


func _ready():
	direction=Vector2.from_angle(rotation)
func _physics_process(delta):
	await get_tree().create_timer(0.01).timeout
	$".".queue_free()


func _on_area_2d_body_entered(body):
	if body.name == "TileMap":
		queue_free()

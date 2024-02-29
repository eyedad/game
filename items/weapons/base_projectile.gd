extends CharacterBody2D
class_name Projectile

var damage
var gunslinger:Creature
var direction

@export var status_effect: Dictionary= {"poison":[2, 4], "slow":[0.5, 4]}
@export var speed=900


func _ready():
	direction=Vector2.from_angle(rotation)

func _physics_process(delta):
	#print(status_effect)
	velocity=speed * direction
	move_and_slide()
	await get_tree().create_timer(0.8).timeout
	$".".queue_free()


func _on_area_2d_body_entered(body):
	if body.name == "TileMap":
		queue_free()
		
func preem(enemy: Creature, creature: Creature, global_shoot_point_position: Vector2):
	var vector_to_enemy = enemy.position - creature.position
	var preem_vector_to_enemy = vector_to_enemy+(vector_to_enemy.length() * enemy.velocity)/self.speed
	var global_preem_vector_to_enemy = creature.position + preem_vector_to_enemy
	var direction = (global_preem_vector_to_enemy - global_shoot_point_position).normalized()
	return direction

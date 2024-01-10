extends Creature
class_name State_machine
var anim=preload("res://creatures/base_creature/animation.gd").new()
var phys=preload("res://creatures/base_creature/actions.gd").new()
enum states{
	MOVE,
	DAMAGED,
	DEATH
}
var shoot_point_position
var state
var animation
@export var is_player =  false
func _ready():
	state = states.MOVE
	shoot_point_position= $shoot_point.position
	animation = $AnimatedSprite2D
	#print(shoot_point_position)
func _physics_process(delta):
	#if is_player:
		#if enemy_in_detector_area:
			##print(enemy_in_detector_area[0].name)
	var global_mouse_position = get_global_mouse_position()
	match state:
		states.MOVE:
			if is_player==true:
				phys.manual_control_move(delta, self, shoot_point_position, global_mouse_position)
			else:
				phys.auto_control_move(delta, self, shoot_point_position)
			anim.move_state(delta, animation, self)
			
		states.DAMAGED:
			phys.damages_state(delta, self)
			anim.damages_state(delta, self, animation)
			await get_tree().create_timer(0.3).timeout
			state=states.MOVE
		
		states.DEATH:
			pass
	move_and_slide()
#fet


func _on_detector_area_body_entered(body):
	enemy_in_detector_area.append(body)


func _on_detector_area_body_exited(body):
	enemy_in_detector_area.erase(body)


func _on_hit_box_body_entered(body):
	if body.projectile == true:
		health = health - body.damage
		state = states.DAMAGED
		print(health, self)
		
		


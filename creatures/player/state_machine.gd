extends Creature
class_name state_machine
var anim=preload("res://creatures/player/animation.gd").new()
var phys=preload("res://creatures/player/actions.gd").new()
enum{
	MOVE,
	DAMAGED,
	DEATH
}
var shoot_point_position
var state
var animation
func _ready():
	state = MOVE
	shoot_point_position= $shoot_point.position
	animation = $AnimatedSprite2D
	#print(shoot_point_position)
func _physics_process(delta):
	match state:
		MOVE:
			phys.manual_control_move(delta, self, shoot_point_position)
			anim.move_state(delta, animation, self)
		DAMAGED:
			pass
		DEATH:
			pass
	move_and_slide()

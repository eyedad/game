extends CharacterBody2D
class_name Creature
@export var is_player =  false
var attack_cooldown=false
@export var health:int = 100
@export var speed:float = 300.0
@export var mana:float = 300.0
@export var armor:int = 0
@export var weapon : Weapon
@export var clothes:Array[Clothes]

var enemy_in_attack_area: Array[Creature] = []
var enemy_in_detector_area: Array[Creature] = []
var camera: Camera2D

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
func _ready():
	state = states.MOVE
	shoot_point_position= $shoot_point.position
	animation = $AnimatedSprite2D
	if weapon:
		weapon.bullets_left=weapon.clip_size
	#print(shoot_point_position)
func _physics_process(delta):
	#print(delta)
	var global_mouse_position = get_global_mouse_position()
	if  health <= 0:
		#print("govno")
		state = states.DEATH
	match state:
		states.MOVE:
			if is_player==true:
				phys.manual_control_move(delta, self, shoot_point_position, global_mouse_position)
				phys.camera_control($Camera2D)
			else:
				phys.auto_control_move(delta, self, shoot_point_position)
			anim.move_state(delta, animation, self)
			
		states.DAMAGED:
			phys.damages_state(delta, self)
			anim.damages_state(delta, self, animation)
			speed = speed/2
			await get_tree().create_timer(0.15).timeout
			speed = speed*2
			state=states.MOVE
		
		states.DEATH:
			velocity = Vector2()
			$Label.visible = false
			anim.death_state(delta, self, animation)
			
	move_and_slide()
	#print(state)

func _on_detector_area_body_entered(body):
	enemy_in_detector_area.append(body)


func _on_detector_area_body_exited(body):
	enemy_in_detector_area.erase(body)


func _on_hit_box_body_entered(body):
	pass
	#print(body)
	if body.projectile == true:
		health = health - body.damage
		state = states.DAMAGED
		#print(health, self)


extends CharacterBody2D
class_name Creature

@export var creature_name:String
@export var is_player:bool =  false
@export var team: Relationship.Team = GS.Team.TRAMP
@export var combat_distance : float = 100
@export var health:float = 100
@export var speed:float = 300.0
@export var mana:float = 300.0
@export var armor:int = 0
@export var weapon : Weapon
#@export var clothes : Armor
@export var trinket:Array[Clothes]


@onready var nav_agent :=$NavigationAgent2D as NavigationAgent2D

var i_see_enemy: bool = false
var attack_cooldown=false
var status: Dictionary= {"poison":[2, 4], "slow":[0.5, 4]}
var enemy_in_attack_area: Array[Creature] = []
var enemy_in_detector_area: Array[Creature] = []
var camera: Camera2D

var anim=preload("res://creatures/base_creature/animation.gd").new()
var phys=preload("res://creatures/base_creature/actions.gd").new()
var eff=preload("res://creatures/base_creature/status_effects.gd").new()
var fog=preload("res://creatures/base_creature/fog_of_war.gd").new()
#var attitude = preload("res://creatures/base_creature/attitude.gd").new()
var self_creature = self
#var delta
var last_time=0

enum states{
	MOVE,
	DAMAGED,
	DEATH
}
var shoot_point_position
var state
var animation
var num_threads = OS.get_processor_count() # Получаем количество доступных ядер
var random_thread_index = randi() % num_threads

func _ready():
	state = states.MOVE
	animation = $AnimatedSprite2D
	if weapon:
		weapon.bullets_left=weapon.clip_size
	#print(random_thread_index)
	for i in range(num_threads):
		var thread = Thread.new()
		var pass_func = Callable(self, "pass_func")
		var bound_func = Callable(self, "_physics_thread")
		if i == random_thread_index:
			thread.start(bound_func)
		else:
			thread.start(pass_func)
var spawnTimer: float = 0.0
var spawnInterval: float = 3.0
var sss=0
func _physics_process(delta):
	if is_player:
		move_and_slide()

	#spawnTimer += delta
	#if spawnTimer >= spawnInterval:
		#spawnTimer=0
		#var inventory=$inventory.get_children()
		#weapon=inventory[sss]
		#print(sss, weapon)
		#sss+=1
		#if sss>=inventory.size():
			#sss=0
	
	
	
func _physics_thread():
	while true:
		var delta = get_process_delta_time() 
		await get_tree().create_timer(delta).timeout
		if not is_player:
			move_and_slide()

		#eff.main_cycle(self, delta)
		#for i in range(clothes.size()):
			#clothes[i].trinket_func(self)
	
		var global_mouse_position = get_global_mouse_position()
		if  health <= 0:
			state = states.DEATH
		match state:
			states.MOVE:
				if is_player==true:
					
					phys.manual_control_move(delta, self, global_mouse_position)
				else:
					pass
					phys.auto_control_move(delta, self)
				anim.move_state(delta, animation, self)
				
			states.DAMAGED:
				phys.damages_state(delta, self)
				anim.damages_state(delta, self, animation)
				speed = speed/2
				await get_tree().create_timer(0.15).timeout
				speed = speed*2
				state=states.MOVE
			#
			states.DEATH:
				velocity = Vector2()
				$Label.visible = false
				anim.death_state(delta, self, animation)

func _on_detector_area_body_entered(body):
	if body != self:
		if GS.relationship_test(self, body):
			enemy_in_detector_area.append(body)

func _on_detector_area_body_exited(body):
	if body != self:
		if GS.relationship_test(self, body):
			enemy_in_detector_area.erase(body)

func _on_hit_box_body_entered(body):
	var self_team=self.team
	var body_team=body.gunslinger.team
	var type_relationship=GS.get_group_relationship(self_team, body_team)
	
	if body.gunslinger != self and type_relationship!=GS.Type.FRIENDLY:
		health = health - body.damage
		state = states.DAMAGED
		for status_effect in body.status_effect:
			if status.get(status_effect):
				if status.get(status_effect)[0] < body.status_effect[status_effect][0]:
					status[status_effect] = body.status_effect[status_effect]
			else: 
				status[status_effect] = body.status_effect[status_effect]
		#print(body)
		body.queue_free()

#func _on_timer_timeout():
	#####i_see_player = fog.fog_of_war(self)
	#i_see_enemy = true
	#phys.make_path(self)
	
	


extends CharacterBody2D
class_name Creature
enum{
	MOVE,
	ATTACK,
	DAMAGED,
	DEATH
}
var attack_cooldown=false
var state = MOVE
@export var health:int = 100
@export var speed:float = 300.0
@export var mana:float = 300.0
@export var armor:int = 0
@export var weapon:weapon
@export var clothes:Array[clothes]

var enemy_in_attack_area: Array[Creature] = []
var enemy_in_detector_area: Array[Creature] = []

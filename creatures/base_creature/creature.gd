extends CharacterBody2D
class_name Creature
var attack_cooldown=false
#var state_machine = preload("res://creatures/base_creature/state_machine.gd")
@export var health:int = 100
@export var speed:float = 300.0
@export var mana:float = 300.0
@export var armor:int = 0
@export var weapon:weapon
@export var clothes:Array[clothes]

var enemy_in_attack_area: Array[Creature] = []
var enemy_in_detector_area: Array[Creature] = []

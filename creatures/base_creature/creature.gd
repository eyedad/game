extends CharacterBody2D
class_name Creature
var attack_cooldown=false
@export var health:int = 100
@export var speed:float = 300.0
@export var mana:float = 300.0
@export var armor:int = 0
@export var weapon : Weapon
@export var clothes:Array[Clothes]

var enemy_in_attack_area: Array[Creature] = []
var enemy_in_detector_area: Array[Creature] = []

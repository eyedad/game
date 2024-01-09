extends Creature
class_name state_machine
enum{
	MOVE,
	DAMAGED,
	DEATH
}
var state
func _ready():
	state = MOVE
func _physics_process(delta):
	match state:
		MOVE:
			pass
		DAMAGED:
			pass
		DEATH:
			pass

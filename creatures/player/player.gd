extends Creature
func _ready():
	pass
func _physics_process(delta):
	update_input_keyboard()
	move_and_slide()
	weapon.attack(self, delta, $shoot_point.position)
	


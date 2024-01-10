extends Node2D
func move_state(delta, animation, creature):
	var angle= creature.velocity.angle()
	var direction = creature.velocity.normalized()
	if direction==Vector2():
		animation.play("idle")
	elif angle>=-2.35 and angle<-0.79:
		animation.play("walk_up")
	elif angle>=-0.79 and angle<0.79:
		animation.play("walk_right")
	elif angle>=0.79 and angle<2.35:
		animation.play("walk_down")
	elif angle>=2.35 and angle<3.15 or angle>=-3.15 and angle<-2.35:
		animation.play("walk_left")
	
func damages_state(delta, obj:State_machine, animation: AnimatedSprite2D):
	pass

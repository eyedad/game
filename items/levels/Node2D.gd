extends Node2D

var item
func _on_area_2d_body_entered(body:Creature):
	if body.is_player:
		item = get_child(2)
		if item != null:
			var inventory = body.get_node('inventory')
			self.remove_child(item)
			inventory.add_child(item)
			queue_free()
		else:
			print("WARNINGGGGGGGGGGG!!!!")

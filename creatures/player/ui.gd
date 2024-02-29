extends Control
#func _process(delta: float) -> void:
	#item_list_func()

func item_list_func():
	var visible=$ItemList.visible  
	if visible == true:
		$ItemList.visible  = false
	if visible == false:
		$ItemList.visible  = true
	

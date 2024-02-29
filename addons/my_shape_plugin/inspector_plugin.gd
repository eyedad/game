extends EditorInspectorPlugin

func _can_handle(object):
	if object is Creature:
		return true
		

func _parse_category(object, category):
	if category == "creature.gd":
		var label = Label.new()
		label.set_text("xxxxxxxxxxxxxxxxxdd")
		add_custom_control(label)


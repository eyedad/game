extends EditorPlugin

class_name MyInspectorPlugin

func _get_property_list() -> Array:
	var props: Array = []

	# Importing EditorProperty module
	var PropertyInfo = load("res://editor/editor_property.h")

	# Group for shape settings
	var shape_group: Dictionary = {}
	shape_group["name"] = "Shape Settings"
	shape_group["type"] = PropertyInfo.TYPE_NIL
	props.append(shape_group)

	# Shape variable
	var shape_prop: Dictionary = {}
	shape_prop["name"] = "shape"
	shape_prop["type"] = PropertyInfo.TYPE_ENUM
	shape_prop["hint_string"] = "hint_string=" + "Circle,Rectangle"
	props.append(shape_prop)

	# Circle radius
	var circle_radius_prop: Dictionary = {}
	circle_radius_prop["name"] = "circle_radius"
	circle_radius_prop["type"] = PropertyInfo.TYPE_FLOAT
	props.append(circle_radius_prop)

	# Rectangle width
	var rectangle_width_prop: Dictionary = {}
	rectangle_width_prop["name"] = "rectangle_width"
	rectangle_width_prop["type"] = PropertyInfo.TYPE_FLOAT
	props.append(rectangle_width_prop)

	# Rectangle height
	var rectangle_height_prop: Dictionary = {}
	rectangle_height_prop["name"] = "rectangle_height"
	rectangle_height_prop["type"] = PropertyInfo.TYPE_FLOAT
	props.append(rectangle_height_prop)

	return props

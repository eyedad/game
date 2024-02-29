extends Control
var creature: Creature
var items_path
var items
var all_items = [
"Sword", "HUI", "HUI", #Мечи
"Bow", "pistol", "HUI",#Луки
"HzWeapon2", "HUI", "HUI",#Книги
"HUI", "HUI", "HUI",
"HUI", "HUI", "HUI",
"HUI", "HUI", "HUI"
]

func _ready():
	creature = $"../../"
	items_path= $"../../inventory"
	items = items_path.get_children()
	print(items)
	#items = creature.get_node("inventory")
	#var childButtons = findChildButtons(self)
	#for button in childButtons:
		#print(button.get_name())

func show_inventory():
	items = items_path.get_children()
	var my_items_names=[]
	for item in items:
		my_items_names.append(item.name)
	if  self.visible == true:
		self.visible = false
	else:
		self.visible = true
	var buttons = findChildButtons(self)
	print(my_items_names)

	for index in range(buttons.size()):
		var button = buttons[index]
		if all_items[index] in my_items_names:
			button.visible = true
		else:
			button.visible = false
	for index in range(all_items.size()):
		var item = all_items[index]

	$Sprite2D_weaon.texture = creature.weapon.get_node("Sprite2D").texture
	#if creature.weapon
	#$Sprite2D_armor.texture = armor_texture
	#$Sprite2D_tinket_1.texture = tinket_texture
		
	
func update():
	pass


func findChildButtons(node: Node) -> Array:
	var buttons = []
	for child in node.get_children():
		if child is Button:
			buttons.append(child)
	return buttons



func _on_button_pressed():
	for item in items:
		if item.get_name() == all_items[0]:
			creature.weapon = item
	$Sprite2D_weaon.texture = creature.weapon.get_node("Sprite2D").texture


func _on_button_2_pressed():
	for item in items:
		if item.get_name() == all_items[1]:
			creature.weapon = item
	$Sprite2D_weaon.texture = creature.weapon.get_node("Sprite2D").texture

func _on_button_3_pressed():
	for item in items:
		if item.get_name() == all_items[2]:
			creature.weapon = item
	$Sprite2D_weaon.texture = creature.weapon.get_node("Sprite2D").texture

func _on_button_4_pressed():
	items = items_path.get_children()
	print(items)
	for item in items:
		if item.get_name() == all_items[3]:
			creature.weapon = item
	$Sprite2D_weaon.texture = creature.weapon.get_node("Sprite2D").texture

func _on_button_5_pressed():
	for item in items:
		if item.get_name() == all_items[4]:
			creature.weapon = item
	$Sprite2D_weaon.texture = creature.weapon.get_node("Sprite2D").texture

func _on_button_6_pressed():
	for item in items:
		if item.get_name() == all_items[5]:
			creature.weapon = item
	$Sprite2D_weaon.texture = creature.weapon.get_node("Sprite2D").texture

func _on_button_7_pressed():
	for item in items:
		if item.get_name() == all_items[6]:
			creature.weapon = item
	$Sprite2D_weaon.texture = creature.weapon.get_node("Sprite2D").texture

func _on_button_8_pressed():
	for item in items:
		if item.get_name() == all_items[7]:
			creature.weapon = item
	$Sprite2D_weaon.texture = creature.weapon.get_node("Sprite2D").texture

func _on_button_9_pressed():
	for item in items:
		if item.get_name() == all_items[8]:
			creature.weapon = item
	$Sprite2D_weaon.texture = creature.weapon.get_node("Sprite2D").texture

func _on_button_10_pressed():
	for item in items:
		if item.get_name() == all_items[9]:
			creature.weapon = item


func _on_button_11_pressed():
	for item in items:
		if item.get_name() == all_items[10]:
			creature.weapon = item


func _on_button_12_pressed():
	for item in items:
		if item.get_name() == all_items[11]:
			creature.weapon = item


func _on_button_13_pressed():
	for item in items:
		if item.get_name() == all_items[12]:
			creature.weapon = item


func _on_button_14_pressed():
	for item in items:
		if item.get_name() == all_items[13]:
			creature.weapon = item


func _on_button_15_pressed():
	for item in items:
		if item.get_name() == all_items[14]:
			creature.weapon = item


func _on_button_16_pressed():
	for item in items:
		if item.get_name() == all_items[15]:
			creature.weapon = item


func _on_button_17_pressed():
	for item in items:
		if item.get_name() == all_items[16]:
			creature.weapon = item


func _on_button_18_pressed():
	for item in items:
		if item.get_name() == all_items[17]:
			creature.weapon = item

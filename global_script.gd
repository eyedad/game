extends Node
class_name Relationship 

# Определяем enum для групп и типа отношений
enum Team{
	MADMAN,
	TRAMP,
	TEAM1,
	TEAM2,
	TEAM3,
}

enum Type{
	HOSTILE,
	NORMAL,
	FRIENDLY,
	UNKNOWN,
}

var GroupRelationship={
	[Team.MADMAN, Team.MADMAN]:Type.HOSTILE,
	[Team.MADMAN, Team.TRAMP]:Type.HOSTILE,
	[Team.MADMAN, Team.TEAM1]:Type.HOSTILE,
	[Team.MADMAN, Team.TEAM2]:Type.HOSTILE,
	
	[Team.TRAMP, Team.MADMAN]:Type.HOSTILE,
	[Team.TRAMP, Team.TRAMP]:Type.NORMAL,
	[Team.TRAMP, Team.TEAM1]:Type.HOSTILE,
	[Team.TRAMP, Team.TEAM2]:Type.HOSTILE,
	
	[Team.TEAM1, Team.MADMAN]:Type.HOSTILE,
	[Team.TEAM1, Team.TRAMP]:Type.HOSTILE,
	[Team.TEAM1, Team.TEAM1]:Type.FRIENDLY,
	[Team.TEAM1, Team.TEAM2]:Type.HOSTILE,
	
	[Team.TEAM2, Team.MADMAN]:Type.HOSTILE,
	[Team.TEAM2, Team.TRAMP]:Type.HOSTILE,
	[Team.TEAM2, Team.TEAM1]:Type.HOSTILE,
	[Team.TEAM2, Team.TEAM2]:Type.FRIENDLY,
}
func get_group_relationship(Team1: Team, Team2: Team):
	if [Team1, Team2] in GroupRelationship:
		return GroupRelationship[[Team1, Team2]]
	else:
		return Type.UNKNOWN
		
func relationship_test(obj1: Creature, obj2: Creature, type:Type=Type.HOSTILE):
	var type_relationship=GS.get_group_relationship(obj1.team, obj2.team)
	if type_relationship==type:
		return true
	else:
		return false
	
func get_text_group_relationship(Team1: Team, Team2: Team, language="RU"):
	var group=get_group_relationship(Team1, Team2)
	if language == "RU":
		if group==Type.HOSTILE:
			return "ВРАЖДЕБНЫЙ"
		if group==Type.NORMAL:
			return "НЕЙТРАЛЬНЫЙ"
		if group==Type.FRIENDLY:
			return "ДРУЖЕЛЮБНЫЙ"
		if group==Type.UNKNOWN:
			return "НЕИЗВЕСТНЫЙ"
	if language == "EN":
		if group==Type.HOSTILE:
			return "HOSTILE"
		if group==Type.NORMAL:
			return "NORMAL"
		if group==Type.UNKNOWN:
			return "UNKNOWN"
			
var line	
func draw_line1(to, parent=self, from=Vector2(),  width=10, color=Color(1, 0, 0)):

	# Если линия еще не создана, то создаем ее
	if not line:
		line = Line2D.new()
		parent.add_child(line)
	
	# Очищаем текущие точки
	line.clear_points()
	
	# Добавляем новые точки
	line.add_point(from)
	line.add_point(to)
	
	# Устанавливаем цвет и толщину линии
	line.set_default_color(color)
	line.set_width(width)
	
var line2	
func draw_line2(to, parent=self, from=Vector2(),  width=10, color=Color(0, 1, 0)):

	# Если линия еще не создана, то создаем ее
	if not line2:
		line2 = Line2D.new()
		parent.add_child(line2)
	
	# Очищаем текущие точки
	line2.clear_points()
	
	# Добавляем новые точки
	line2.add_point(from)
	line2.add_point(to)
	
	# Устанавливаем цвет и толщину линии
	line2.set_default_color(color)
	line2.set_width(width)

var line3	
func draw_line3(to, parent=self, from=Vector2(),  width=10, color=Color(0, 0, 1)):

	# Если линия еще не создана, то создаем ее
	if not line3:
		line3 = Line2D.new()
		parent.add_child(line3)
	
	# Очищаем текущие точки
	line3.clear_points()
	
	# Добавляем новые точки
	line3.add_point(from)
	line3.add_point(to)
	
	# Устанавливаем цвет и толщину линии
	line3.set_default_color(color)
	line3.set_width(width)


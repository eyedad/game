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
	var obj1_team=obj1.team
	var obj2_team=obj2.team
	var type_relationship=GS.get_group_relationship(obj1_team, obj2_team)
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




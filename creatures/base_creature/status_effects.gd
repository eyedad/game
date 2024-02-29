extends Node
var last_status : Dictionary = {}
var new_status : Dictionary={}
var ended_status : Dictionary={}

func main_cycle(obj:Creature, delta):	
	ended_status = {}
	new_status = {}
	##получение new_status
	var statuses = obj.status.keys()
	for status in statuses:
		if obj.is_player:
			print("-----", obj.status)			
		if last_status.get(status) == null:	
			new_status[status] = obj.status[status]
			if obj.is_player:
				print("Статус обновился! -new=", new_status[status],"last=",  last_status.get(status), "current=", obj.status[status])
				
	##Вычет времени статуса	и удаление			
	statuses = obj.status.keys()
	for status in statuses:
		if obj.is_player:
			print("status ", status, " from statses:", obj.status)
		obj.status[status][0]-=10.0
		if obj.status[status][0] <= 0:
			if obj.is_player:
				print("timeout1, ", obj.status, last_status)
			ended_status[status]=obj.status[status]##Если время кончилось, то добавляем ended_status
			obj.status.erase(status)
			if obj.is_player:
				print("timeout2, ", obj.status, last_status)
	#if obj.is_player:
		#print("\n\n")		


	pass
#--------------------START----------------------------------------		
	for status in new_status:
			
		if status == "slow":
			#print("-----", obj.status[status])
			obj.speed = obj.speed/obj.status[status][1]
			
		if status == "stun":
			pass
		if status == "poison":
			pass
		if status == "vampyre":
			pass
#--------------------MIDDLE----------------------------------------		
	for status in obj.status:
			
		if status == "slow":
			pass	
		if status == "stun":
			pass
		if status == "poison":
			obj.health -= delta*obj.status[status][1]
		if status == "vampyre":
			obj.health -= delta*obj.status[status][1]
			obj.status[status][2].health += delta*obj.status[status][1]
			pass
#--------------------END----------------------------------------			
	for status in ended_status:
			
		if status == "slow":
			obj.speed = obj.speed*ended_status[status][1]

		if status == "stun":
			pass
		if status == "poison":
			pass
#------------------------------------------------------------				

	last_status={}
	for status in obj.status:
		last_status[status]=obj.status[status]
	#if obj.is_player:
		#print("last_status=", last_status)

extends Node
var last_status : Dictionary 
var new_status : Dictionary
var ended_status : Dictionary

func main_cycle(obj:Creature, delta):
	
	for status in obj.status:
		
		if last_status.get(status) == null:
		
			new_status[status] = obj.status[status]
			
	
	for status in obj.status:
		obj.status[status][0]-=delta
		#print(obj.status[status], status)a
		
		if obj.status[status][0] <= 0:
			ended_status.merge(obj.status)
			obj.status.erase(status)
			last_status.erase(status)
			print(ended_status)
	
#--------------------START----------------------------------------		
	for status in new_status:
			
		if status == "slow":
			obj.speed = obj.speed/obj.status[status][1]
			
		if status == "stun":
			pass
		if status == "poison":
			pass
#--------------------MIDDLE----------------------------------------		
	for status in obj.status:
			
		if status == "slow":
			pass	
		if status == "stun":
			pass
		if status == "poison":
			obj.health -= delta*obj.status[status][1]
#--------------------END----------------------------------------			
	for status in ended_status:
			
		if status == "slow":
			obj.speed = obj.speed*ended_status[status][1]

		if status == "stun":
			pass
		if status == "poison":
			pass
#------------------------------------------------------------				
	last_status.merge(obj.status)
	ended_status = {}
	new_status = {}

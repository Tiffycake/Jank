extends Area2D
class_name HitboxComponent

@onready var healthComponent : HealthComponent 

@onready var player :  = $".." #Player

func _ready() -> void:
	self.area_entered.connect(onAreaEntered)
	#self.body_entered.connect(onBodyEntered)
	
	healthComponent = $"../HealthComponent"


func onAreaEntered(area) -> void:
	# this will become a switch statement i think
	if area is AttackComponent:
		area.get_parent().queue_free()
		if healthComponent != null:
			healthComponent.damage(area)


func eat_thingies() -> void:
	if has_overlapping_areas():
		var a1 = get_overlapping_areas().get(0)
		if a1 is Pickup:
			a1.call_deferred("collect",player)
			#a.collect(player)
#func _init() -> void:
	#collision_layer = 2
	#collision_mask = 0
 


#func onBodyEntered(body):
	#if body is Player and $".." is Player:
		#pass
		#print("pretend its being pushed :3")


	
	
	 
	
	

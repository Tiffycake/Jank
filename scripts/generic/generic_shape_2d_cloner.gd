extends StaticBody2D

#@onready var hitboxComponent := $".." 

@onready var hitboxComponent := $"HitboxComponent"
@onready var collisionShape  := $"CollisionShape2D"


func _ready() -> void:
	var collisionShape2 := collisionShape.duplicate()
	collisionShape2.add_child(hitboxComponent) 

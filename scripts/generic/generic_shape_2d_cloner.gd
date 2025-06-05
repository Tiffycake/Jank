extends Node2D

#@onready var hitboxComponent := $".." 

@onready var hitboxComponent := $"../HitboxComponent"
@onready var collisionShape  := $"../CollisionShape2D"


func _ready() -> void:
	var collisionShape2 := collisionShape.duplicate() 
	hitboxComponent.add_child(collisionShape2)

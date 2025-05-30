extends CharacterBody2D
var pos:Vector2
var rota:float
var dir:float
var speed := 2000

var attackDamage := 1




func _on_hitbox_area_entered(area):
	if area is HitboxComponent:
		var hitbox : HitboxComponent = area
		var attack = Attack.new()
		attack.attackDamage = attackDamage
		attack.attackPosition = global_position
		hitbox.damage(attack)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position=pos
	global_rotation=rota



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	velocity=Vector2(speed,0).rotated(dir)
	move_and_slide()

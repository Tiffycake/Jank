extends TextureProgressBar

@onready var healthComponent1: HealthComponent = $"../../../HealthComponent"
@onready var healthNum = $"../healthNum"

# Called when the node enters the scene tree for the first time.
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	max_value = healthComponent1.maxHealth
	value = healthComponent1.health
	healthNum.text = str(healthComponent1.health)+" / "+str(healthComponent1.maxHealth)

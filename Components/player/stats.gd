extends Resource
class_name stat_sheet

@export var bulletLifetime		: float  # = 60
@export var bulletMaxCount		: int  # = 12
@export var bulletSpeed			: int  # = 2000 # projectile speed
@export var atackDamage			: int  # = 10 # weaponAtackDamage
@export var reloadTime			: float  = 2  # reload seconds
@export var atackSpeed			: float# = 5  # attacks per second
@export var bulletType			: String = "small"
@export var weaponSprite		: Texture2D
@export var offset				: Vector2

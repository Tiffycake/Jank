extends Resource
class_name stat_sheet


@export var bulletLifetime		: float  # = 60
@export var bulletMaxCount		: int  # = 12
@export var bulletSpeed			: int  # = 2000 # projectile speed
@export var bulletSpread		: float
@export var atackDamage			: int  # = 10 # weaponAtackDamage
@export var atackSpeed			: float# = 5  # attacks per second
@export var reloadTime			: float  = 2  # reload seconds
@export_enum("small", "medium", "heavy", "shell") var bulletType : String # what are we doing

@export var offset				: Vector2
@export var weaponSprite		: Texture2D

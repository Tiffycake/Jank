extends Resource
## item component
class_name InvItem

## the icon for the item
@export var icon   : Texture2D # icon
## very real name 
@export var nameId : String
## scene of the item 
@export var scene  : PackedScene
#var stack : int 
## temp stuff
@export var initialized : bool = false

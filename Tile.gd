extends Area2D

# is this the starting tile?
# a Base building will be placed here at the start of the game
export var startTile = false

# do we have a building on this tile?
var hasBuilding : bool = false

# can we place a building on this tile?
var canPlaceBuilding : bool = false

# components
onready var highlight : Sprite = get_node("Highlight")
onready var buildingIcon : Sprite = get_node("BuildingIcon")

# Called when the node enters the scene tree for the first time.
func _ready():
	# add the tile to the "Tiles" group when the node is initialized
	add_to_group("Tiles")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func toggle_highlight(toggle):
	highlight.visible = toggle
	canPlaceBuilding = toggle

# called when a building is placed on the tile
# sets the tile's building texture to display it
func place_building(buildingTexture):
	hasBuilding = true
	buildingIcon.texture = buildingTexture


func _on_Tile_input_event(viewport, event, shape_idx):
	pass # Replace with function body.

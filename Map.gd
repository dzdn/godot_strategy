extends Node

# all the tiles in the game
var allTiles : Array

# all the tiles which have buildings on them
var tilesWithBuildings : Array

# size of a tile
var tileSize : float = 64.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# returns a tile at the given position - returns null if no tile is found
func get_tile_at_position(position):
	# loop through all of the tiles
	for x in range(allTiles.size()):
		# if the tile matches our given position, return it
		if allTiles[x].position == position and allTiles[x].hasBuilding == false:
			return allTiles[x]
	
	return null

# disables all of the tile highlights
func disable_tile_highlights():
	for x in range(allTiles.size()):
		allTiles[x].toggle_highlight(false)

# highlights the tiles we can place buildings on
func highlight_available_tiles():
	# loop through all of the tiles with buildings
	for x in range(tilesWithBuildings.size()):
		# get the tile north, south, east and west of this one
		var northTile = get_tile_at_position(tilesWithBuildings[x].position + Vector2(0, tileSize))
		var southTile = get_tile_at_position(tilesWithBuildings[x].position + Vector2(0, -tileSize))
		var eastTile = get_tile_at_position(tilesWithBuildings[x].position + Vector2(tileSize, 0))
		var westTile = get_tile_at_position(tilesWithBuildings[x].position + Vector2(-tileSize, 0))
		
		# if the directional tiles aren't null, toggle their highlight - allowing us to build
		if northTile != null:
			northTile.toggle_highlight(true)
		if southTile != null:
			southTile.toggle_highlight(true)
		if eastTile != null:
			eastTile.toggle_highlight(true)	
		if westTile != null:
			westTile.toggle_highlight(true)	

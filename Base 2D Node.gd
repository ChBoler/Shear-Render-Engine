extends Node2D
#import CanvasItem

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

# TODO - Stress test grabbing width from settings
var screenWidth = ProjectSettings.get_setting("display/window/size/width")
var vanishingPoint = Vector2(screenWidth / 2, 100)

# Ugly 2D Array Declaration
### THIS IS NOT A GRID, BECAUSE GRIDS ARE INFLEXIBLE ###
### THESE ARE INSTRUCTIONS PASSED TO SHEAR ON WHAT TO DRAW ###
### CIRCLES TOWERS BOXROOMS WHATEVER ###
var levelLayout = []
# X Axis
var levelWidth = 2
# Y Axis
var levelHeight = 10

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	# Put makeup on the ugly 2D array
	var x = 0
	var y = 0
	
	while(y < levelHeight):
		x = 0
		levelLayout.append([])
		while(x < levelWidth):
			levelLayout[y].append("SQUARE" + str(x))
			x += 1
		y += 1
	
	# Tell the ugly 2D array how it is
	print(levelLayout)
	
	pass

func _draw():
	# Line args:
	#	draw_line ( Vector2 from, Vector2 to, Color color, float width=1.0, bool antialiased=false 
	
	# dumbtest
	draw_line(Vector2(0, 0), vanishingPoint, Color(255, 0, 0), 1)
	
	var _array = [Vector2(0, 0), Vector2 (100, 0), Vector2 (100, 100), Vector2(0, 100)]
	var _colorarray = [Color("FFFFFF"), Color("FFFFFF"), Color("FFFFFF"), Color("FFF11F")]
	var _uvs = [Vector2(0, 0), Vector2(637, 0), Vector2(637, 637), Vector2(0, 637)]  #no idea
	var _texture = load("res://Textures/TestImage.PNG")
	
	draw_polygon(_array, _colorarray, _uvs, _texture)
	
	#doesnt look warpable
	#draw_texture_rect(_texture, Rect2 rect, bool tile, Color modulate=Color( 1, 1, 1, 1 ))
	
	# Ok now a quiz: draw a 1x1 square in the center of the screen towards the vanishing point.
	var midPoint = (screenWidth / 2)
	var botWidth = 600
	var sideWidth = 150
	var sideVolume = 20
	var green = Color(0, 255, 0)
	#var topWidth = 400
	
	# =============== Bottom Wall ===============
	# 	Bottom of wall
	draw_line(Vector2(midPoint - (botWidth / 2), 500), 
	Vector2(midPoint + (botWidth / 2), 500), green, 1)
	
	# 	Top of wall
	draw_line(Vector2(midPoint - (botWidth / 2), 475), 
	Vector2(midPoint + (botWidth / 2), 475), green, 1)
	
	#	Inner wall ridge
	draw_line(Vector2(midPoint - (botWidth / 2), 465), 
	Vector2(midPoint + (botWidth / 2), 465), green, 1)
	
	#	Right of wall
	draw_line(Vector2(midPoint + (botWidth / 2), 475),
	Vector2(midPoint + (botWidth / 2), 500), green, 1)
	
	#	Left of wall
	draw_line(Vector2(midPoint - (botWidth / 2), 475),
	Vector2(midPoint - (botWidth / 2), 500), green, 1)
	
	# =============== Left Wall ===============
	#	Outer ridge
	draw_line(Vector2(midPoint - (botWidth / 2), 475), 
	Vector2(midPoint - (botWidth / 2), 475 - sideWidth), green, 1)
	
	#	Inner ridge
	draw_line(Vector2(midPoint - (botWidth / 2) + sideVolume, 475), 
	Vector2(midPoint - (botWidth / 2) + sideVolume, 475 - sideWidth), green, 1)
	
	# =============== Right Wall ===============
	#	Outer ridge
	draw_line(Vector2(midPoint + (botWidth / 2), 475), 
	Vector2(midPoint + (botWidth / 2), 475 - sideWidth), green, 1)
	
	#	Inner ridge
	draw_line(Vector2(midPoint + (botWidth / 2) - sideVolume, 475), 
	Vector2(midPoint + (botWidth / 2) - sideVolume, 475 - sideWidth), green, 1)
	
	# =============== Top Wall ===============

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

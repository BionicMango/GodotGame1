extends Node2D

# Sprites
@export var Client: Sprite2D;
@export var Stick: Sprite2D;
@export var Puff: Sprite2D;

# Other Nodes
@onready var Main: Node2D = $"..";
@onready var Setups: Array[Node2D] = [$"../Setup1", $"../Setup2"];

# Variables
var bodies;
var color_puff: int; # color (0 = pink, 1 = blue, 2 = green, 3 = white)
var style_puff: int; # style (0: S, 1: XL, 2: M, 3: L)
var score: int = 0;
var colors: Array[Color];

# When node is created, choose random puff combination (16 combos total).
func _ready() -> void:
	colors = Setups[0].colors;
	# Color
	color_puff = randi() % 4;
	Puff.modulate = colors[color_puff];
	# Style
	style_puff = randi() % 4;
	Puff.frame = style_puff;

func _on_area_2d_area_entered(area: Area2D) -> void:
	var MachinePuff: StaticBody2D;
	
	if area == Setups[0].Stick.StickArea:
		MachinePuff = Setups[0].Puff;
	elif area == Setups[1].Stick.StickArea:
		MachinePuff = Setups[1].Puff;
	else:
		return;
		
	if MachinePuff.PuffSprite.frame == Puff.frame and MachinePuff.PuffSprite.modulate == modulate:
		MachinePuff.good = 0;
		MachinePuff.bad = 0;
		
		# Randomize Color
		color_puff = randi() % 4;
		Puff.modulate = colors[color_puff];
		# Randomize Style
		style_puff = randi() % 4;
		Puff.frame = style_puff;
		
		Main.score += 1;

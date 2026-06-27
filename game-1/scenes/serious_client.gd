extends Node2D

# Sprites
@export var Client: Sprite2D;
@export var Stick: Sprite2D;
@export var Puff: Sprite2D;

# Variables
var bodies;
var color_puff: int; # color (0 = pink, 1 = blue, 2 = green, 3 = white)
var style_puff: int; # style (0: S, 1: XL, 2: M, 3: L)
var score: int = 0;
var colors: Array[Color] = [
	Color(1, 1, 1), # color = pink
	Color(0.803, 1.37, 1.27), # color = light blue
	Color(0.873, 1.47, 0.756), # color = mint green
	Color(1.00, 1.47, 1.27)
];

# When node is created, choose random puff combination (16 combos total).
func _ready() -> void:
	# Color
	color_puff = randi() % 4;
	Puff.modulate = colors[color_puff];
	# Style
	style_puff = randi() % 4;
	Puff.frame = style_puff;

func _on_area_2d_area_entered(area: Area2D) -> void:
	var MachinePuff: StaticBody2D;
	var MachinePuffSprite: Sprite2D;
	if area == $"../Setup1/stick/StickArea":
		MachinePuff = $"../Setup1/Puff";
		MachinePuffSprite = $"../Setup1/Puff/Sprite2D";
	elif area == $"../Setup2/stick/StickArea":
		MachinePuff = $"../Setup2/Puff";
		MachinePuffSprite = $"../Setup2/Puff/Sprite2D";
	else:
		return;
	if MachinePuffSprite.frame == Puff.frame and MachinePuffSprite.modulate == modulate:
		MachinePuff.good = 0;
		MachinePuff.bad = 0;

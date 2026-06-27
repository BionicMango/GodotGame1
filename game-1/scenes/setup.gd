extends Node2D

@export var Machine: StaticBody2D;
@export var Stick: StaticBody2D;
@export var Puff: StaticBody2D;
@export var ButtonColor: Node2D;
@export var ButtonBin: Node2D;

var colors: Array[Color];

func _ready():
	colors = ButtonColor.colors;

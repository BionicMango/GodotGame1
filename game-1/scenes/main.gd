extends Node2D

# Variables
var score: int;

# Retrieving Other Nodes
@export var ScoreLabel: RichTextLabel;
@export var Setups: Array[Node2D];

var mouse_on_bin_buttons: bool;
var mouse_pressed_bin_buttons: bool;

func _ready() -> void:
	score = 0;
	mouse_on_bin_buttons = false;
	mouse_pressed_bin_buttons = false;

func _process(_delta: float) -> void:
	ScoreLabel.text = str(score);
	# If mouse is on either bin button.
	mouse_on_bin_buttons = Setups[0].ButtonBin.mouse_on_button or Setups[1].ButtonBin.mouse_on_button;

# SCORE -1 FOR EVERY COTTON CANDY BINNED
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and mouse_on_bin_buttons:
		if event.pressed:
			mouse_pressed_bin_buttons = true;
		else:
			mouse_pressed_bin_buttons = false;
			score -= 1;

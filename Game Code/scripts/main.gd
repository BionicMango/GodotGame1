extends Node2D

# Retrieving Other Nodes
@export var ScoreLabel: RichTextLabel;
@export var Setups: Array[Node2D];
@export var timer: Timer;
@export var TimerLabel: Label;

var mouse_on_bin_buttons: bool;
var mouse_pressed_bin_buttons: bool;

func _ready() -> void:
	Global.total_score = 0;
	mouse_on_bin_buttons = false;
	mouse_pressed_bin_buttons = false;
	timer.start();

func _process(_delta: float) -> void:
	ScoreLabel.text = str(Global.total_score);
	# If mouse is on either bin button.
	mouse_on_bin_buttons = Setups[0].ButtonBin.mouse_on_button or Setups[1].ButtonBin.mouse_on_button;
	TimerLabel.text = str(int(timer.time_left))

# SCORE -1 FOR EVERY COTTON CANDY BINNED
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and mouse_on_bin_buttons:
		if event.pressed:
			mouse_pressed_bin_buttons = true;
		else:
			mouse_pressed_bin_buttons = false;
			Global.total_score -= 1;


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file('res://scenes/GameOver.tscn');

extends Control

@export var GameOverLabel: Label;
@export var ScoreLabel: Label;
@export var PlayAgainButton: Button;

func _on_replay_button_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/Main.tscn')
	
func _ready():
	ScoreLabel.text = 'Score: ' + str(Global.total_score);

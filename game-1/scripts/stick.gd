extends StaticBody2D

@onready var Machine = $"../RecordPlayer";

var stickOn: bool = false;

func stick_input() -> void:
	'''If the stick is 'on', i.e. one end in the machine, then toggle'''
	if Input.is_action_just_pressed('ui_space') and Machine.selected:
		stickOn = !stickOn;
		match stickOn:
			false:
				rotation = 0; # outside the machine
			true:
				rotation = -PI/4; # inside the machine

func _process(_delta: float) -> void:
	stick_input();

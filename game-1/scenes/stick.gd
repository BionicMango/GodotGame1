extends StaticBody2D

var stickOn: bool = false;

func stick_input() -> void:
	'''If the stick is 'on', i.e. collecting cotton candy, then toggle'''
	if Input.is_action_just_pressed('ui_space'):
		stickOn = !stickOn;
		match stickOn:
			false:
				rotation = 0;
			true:
				rotation = -PI/4;

func _process(delta: float) -> void:
	stick_input();

func _on_machine_mouse_entered() -> void:
	scale = Vector2(1.1, 1.1);

func _on_machine_mouse_exited() -> void:
	scale = Vector2(1, 1);

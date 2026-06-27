extends StaticBody2D

@onready var Machine = $"../RecordPlayer";

var stickOn: bool = false;
var dragging: bool = false;
var mouse_touching = false;
var angle: float = 0; # radians
var drag_offset: Vector2 = Vector2.ZERO;
var locked_global_position: Vector2;

func _ready():
	# Store current position as the 'locked' position
	locked_global_position = global_position;

func stick_input() -> void:
	'''If the stick is 'on', one end in the machine, otherwise outside machine.
	Toggle between the states.'''
	if Input.is_action_just_pressed('ui_space') and Machine.selected:
		stickOn = !stickOn;
		match stickOn:
			false:
				angle = 0; # outside the machine
				Machine.angular_velocity = 0; # stop machine
			true:
				angle = -PI/4; # inside the machine

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Store the difference between mouse pos and object pos when clicked
				drag_offset = global_position - get_global_mouse_position();
				dragging = true;
			else:
				dragging = false;

func _process(_delta: float) -> void:
	stick_input();
	if dragging and mouse_touching:
		global_position = get_global_mouse_position() + drag_offset;
	else:
		global_position = locked_global_position;
	rotation = angle;

func _on_area_2d_mouse_entered() -> void:
	mouse_touching = true;

func _on_area_2d_mouse_exited() -> void:
	mouse_touching = false;

extends RigidBody2D

@export var angular_accel: float = 0.01; # how 'sensitive' buttons are
@export var desired_rpm: float = 48;
var score: float = 0;
var rpm: float;

func score_update(delta: float) -> void:
	if abs(desired_rpm - rpm) <= 0.5:
		score += 3*delta
	elif abs(desired_rpm - rpm) <= 1:
		score += 2*delta
	elif abs(desired_rpm - rpm) <= 2:
		score += 1*delta

func _process(delta: float) -> void:
	rpm = 60 * angular_velocity / (2 * PI);
	
	if Input.is_action_pressed('ui_down') or Input.is_action_pressed('ui_left'):
		angular_velocity -= angular_accel;
	if Input.is_action_pressed('ui_up') or Input.is_action_pressed('ui_right'):
		angular_velocity += angular_accel;
	
	if angular_velocity <= 0:
		angular_velocity = 0;
	if angular_velocity >= 125:
		angular_velocity = 125;
	
	score_update(delta);

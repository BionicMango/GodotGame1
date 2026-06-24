extends RigidBody2D

@export var angular_accel: float = 0.5; # how 'sensitive' buttons are
@export var desired_rpm: float = 3000;
var score: float = 0;
var rpm: float = 0;
var selected: float = false;

func score_update(delta: float) -> void:
	'''Updates score based on 'how close' the rpm is to the desired rpm.'''
	if abs(desired_rpm - rpm) <= 100:
		score += 3 * delta; # i.e. 3 points/sec
	elif abs(desired_rpm - rpm) <= 200:
		score += 2 * delta; # 2 points/sec
	elif abs(desired_rpm - rpm) <= 300:
		score += 1 * delta; # 1 point/sec

func update_rpm() -> void:
	'''Updates rpm based on if the arrow keys are pressed.
	If the angular velocity is zero, then it won't become negative.
	If the angular velocity is at a maximum, then it won't increase.'''
	if Input.is_action_pressed('ui_down') or Input.is_action_pressed('ui_left'):
		angular_velocity -= angular_accel;
	if Input.is_action_pressed('ui_up') or Input.is_action_pressed('ui_right'):
		angular_velocity += angular_accel;
	if angular_velocity < 0:
		angular_velocity = 0;
	if angular_velocity > 500:
		angular_velocity = 500;

func _process(delta: float) -> void:
	# rpm from angular velocity w/ x2 multiplier
	rpm = 8 * 60 * angular_velocity / (2 * PI);
	if selected:
		update_rpm();
		scale = Vector2(1.1, 1.1);
	else:
		scale = Vector2(1, 1);
	score_update(delta);

# Only consider regions when selected here.
func _on_machine_mouse_entered() -> void:
	selected = true;

func _on_machine_mouse_exited() -> void:
	selected = false;

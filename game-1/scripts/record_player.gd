extends StaticBody2D

@export var angular_accel: float = 0.5; # how 'sensitive' buttons are
@export var desired_rpm: float = 3000;
var angular_velocity: float = 0;
var rpm: float = 0;
var selected: float = false;

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
	rpm = 8 * 60 * self.angular_velocity / (2 * PI);
	rotation += angular_velocity * delta
	if selected:
		update_rpm();
		scale = Vector2(0.9, 0.9);
	else:
		scale = Vector2(1, 1);

# Only consider regions when selected here.
func _on_machine_mouse_entered() -> void:
	selected = true;

func _on_machine_mouse_exited() -> void:
	selected = false;

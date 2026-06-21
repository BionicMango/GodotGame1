extends StaticBody2D

var angular_velocity = 3

func _process(delta: float):
	rotation += angular_velocity * delta
	
	if Input.is_action_pressed('ui_down'):
		angular_velocity -= 0.1
	
	if Input.is_action_pressed('ui_up'):
		angular_velocity += 0.1
	
	if angular_velocity <= 0:
		angular_velocity = 0
	elif angular_velocity >= 125:
		angular_velocity = 125

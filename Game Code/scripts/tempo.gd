extends Label
@export var Machine: StaticBody2D;

var v_rpm: float;

func update_color():
	if Machine.desired_rpm < Machine.rpm - 150:
		add_theme_color_override("font_color", Color.ORANGE);
	elif Machine.desired_rpm > Machine.rpm + 150:
		add_theme_color_override("font_color", Color.RED);
	else:
		add_theme_color_override("font_color", Color.GREEN);

func _process(_delta: float) -> void:
	text = 'RPM: ' + str(int(round(Machine.rpm)));
	update_color();

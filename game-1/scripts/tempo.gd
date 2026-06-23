extends Label
@onready var machine = $"../RecordPlayer";

var v_rpm: float

func _process(_delta: float) -> void:
	v_rpm = 60 * machine.angular_velocity / (2 * PI)
	text = 'RPM: ' + str(v_rpm);

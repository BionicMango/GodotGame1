extends Label
@onready var record_player = $"../RecordPlayer";

var v_rpm: float

func _process(_delta: float) -> void:
	v_rpm = 60 * record_player.angular_velocity / (2 * PI)
	text = 'RPM: ' + str(v_rpm);

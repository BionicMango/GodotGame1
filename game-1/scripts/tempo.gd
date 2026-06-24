extends Label
@onready var machine = $"../RecordPlayer";

var v_rpm: float;

func _process(_delta: float) -> void:
	text = 'RPM: ' + str(machine.rpm);

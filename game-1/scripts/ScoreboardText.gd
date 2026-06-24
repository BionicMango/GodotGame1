extends Label
@onready var machine = $"../RecordPlayer";
@onready var stick = $"../stick";

func _process(_delta: float) -> void:
	text = 'Score: ' + str(machine.score) + '\nStick: ' + str(stick.stickOn);

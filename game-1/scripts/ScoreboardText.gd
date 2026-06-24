extends Label
@onready var Machine = $"../RecordPlayer";

func _process(_delta: float) -> void:
	text = 'Score: ' + str(Machine.score);

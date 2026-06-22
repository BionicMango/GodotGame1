extends Label
@onready var record_player = $"../RecordPlayer";

func _process(_delta: float) -> void:
	text = 'Score: ' + str(record_player.score);

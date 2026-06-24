extends Label
@onready var Puff = $"../Puff";

func _process(_delta: float) -> void:
	text = 'Good: ' + str(round(Puff.good)) + '\nBad: ' + str(round(Puff.bad));

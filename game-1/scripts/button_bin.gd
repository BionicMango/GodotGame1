extends Node2D

@onready var ButtonBinSprite = $Sprite2D;
@onready var Puff = $"../Puff";

var mouse_on_button: bool = false;
var mouse_pressed: bool = false;

func _input(event:InputEvent) -> void:
	if event is InputEventMouseButton and mouse_on_button:
		if event.pressed:
			mouse_pressed = true;
		else:
			Puff.good = 0;
			Puff.bad = 0;
			mouse_pressed = false;

func _on_button_bin_mouse_entered() -> void:
	mouse_on_button = true;
	ButtonBinSprite.frame = 3;

func _on_button_bin_mouse_exited() -> void:
	mouse_on_button = false;
	ButtonBinSprite.frame = 2;

func _process(_delta: float) -> void:
	# enlarge when mouse is touching button, smaller if being pressed
	if mouse_pressed:
		scale = Vector2(0.45, 0.45);
	elif mouse_on_button:
		scale = Vector2(0.55, 0.55);
	else:
		scale = Vector2(0.5, 0.5);

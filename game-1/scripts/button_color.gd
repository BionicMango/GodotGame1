extends Node2D

@export var ButtonColorSprite: Sprite2D;
@export var Puff: StaticBody2D;

var mouse_on_button: bool = false;
var mouse_pressed: bool = false;
var color_puff: int = 0;
@export var colors: Array[Color] = [
	Color(1, 1, 1), # color = pink
	Color(0.803, 1.37, 1.27), # color = light blue
	Color(0.873, 1.47, 0.756), # color = mint green
	Color(1.00, 1.47, 1.27)
];

func _ready():
	color_puff = 0;

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and mouse_on_button:
		if not event.pressed:
			# only on releasing a mouse click
			if Puff.good == 0 and Puff.bad == 0:
				# color change only if cotton candy is unactivated
				modulate = color_change();
			mouse_pressed = false;
		elif event.pressed:
			mouse_pressed = true;

func color_change() -> Color:
	color_puff += 1;
	if color_puff >= len(colors):
		color_puff = 0;
	return colors[color_puff]

func _process(_delta: float) -> void:
	# enlarge when mouse is touching button, smaller if being pressed
	if mouse_pressed:
		scale = Vector2(0.45, 0.45);
	elif mouse_on_button:
		scale = Vector2(0.55, 0.55);
	else:
		scale = Vector2(0.5, 0.5);

func _on_button_color_mouse_entered() -> void:
	mouse_on_button = true;

func _on_button_color_mouse_exited() -> void:
	mouse_on_button = false;

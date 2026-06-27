extends StaticBody2D
@export var Stick: StaticBody2D;
@export var Machine: StaticBody2D;
@export var PuffSprite: Sprite2D;
@export var ButtonColor: Node2D;

var good: float = 0; # how much time at the 'correct' machine speed
var bad: float = 0; # how much time at the 'wrong' machine speed

func check_rpm(delta: float) -> void:
	'''Updates 'good' and 'bad' scores when RPM is within threshold.
	Only run when cotton candy stick is 'on'.'''
	if abs(Machine.desired_rpm - Machine.rpm) <= 150: # GOOD
		good += delta;
		bad -= delta;
	else: # BAD
		bad += delta;
		good -= delta;

func cotton_candy_frame():
	'''Switches frames based on how closed to finished the cotton candy is.
	If too fast, then it becomes sharp and brittle.
	If too slow, then it becomes dense and clumped.
	When maintained at a good speed, the'fluff' will start to develop.'''
	PuffSprite.show();
	# too long at wrong speed =[
	if bad >= 3:
		if Machine.rpm > Machine.desired_rpm: # too fast! sharp & brittle
			PuffSprite.frame = 5;
		else: # too slow! dense and clumped
			PuffSprite.frame = 4;
	# progression to different cotton candy levels (at right speed)
	elif good < 3:
		PuffSprite.hide() # not long enough yet
	elif good < 7:
		PuffSprite.frame = 0; # small
	elif good < 11:
		PuffSprite.frame = 2; # medium
	elif good < 15:
		PuffSprite.frame = 3; # large
	else:
		PuffSprite.frame = 1; # extra large

func _process(delta: float) -> void:
	# syncing rotation & position with the stick
	rotation = Stick.rotation;
	position = Stick.position + Vector2(100 * sin(rotation), -100 * cos(rotation));
	
	# Update good & bad times IF ACTIVATED AND IF NOT IRREVERSABLY BAD (bad < 5)
	if Stick.stickOn and bad < 5:
		check_rpm(delta);
	
	# Update puff color based on ButtonColor
	modulate = ButtonColor.modulate
	
	# Update frames
	cotton_candy_frame();
	pass;

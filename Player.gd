extends KinematicBody2D

export var WALK_SPEED = 400;
var GRAVITY = 200;
var JUMP_SPEED = -2500;
#var screensize;

# Called when the node enters the scene tree for the first time.
#func _ready():
	#screensize = get_viewport_rect().size;

func _physics_process(delta):
	move_and_collide(Vector2(0, GRAVITY * delta));
	var velocity = Vector2();

	if Input.is_action_pressed("right"):
		velocity.x += WALK_SPEED;
	
	if Input.is_action_pressed("left"):
		velocity.x -= WALK_SPEED;
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_SPEED;
	
	move_and_slide(velocity, Vector2(0, -1));

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	

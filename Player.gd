extends KinematicBody2D

export var WALK_SPEED = 400;
export var GRAVITY = 10;
export var JUMP_SPEED = -10;
var jumpcounter = 0;
var gravcounter = 0;
#var screensize;

# Called when the node enters the scene tree for the first time.
#func _ready():
	#screensize = get_viewport_rect().size;

func _physics_process(delta):
	#move_and_collide(Vector2(0, GRAVITY * delta));
	var velocity = Vector2();
	
	velocity.y += GRAVITY * delta * gravcounter;

	if Input.is_action_pressed("right"):
		velocity.x += WALK_SPEED;
	
	if Input.is_action_pressed("left"):
		velocity.x -= WALK_SPEED;
	
	if Input.is_action_pressed("jump"):
		jumpcounter += 1;
		velocity.y = JUMP_SPEED * jumpcounter * delta;
		
	if is_on_floor():
		gravcounter = 0;
		jumpcounter = 0;
	
	move_and_collide(Vector2(0, velocity.y));
	move_and_slide(Vector2(velocity.x, 0), Vector2(0, -1));
	gravcounter += 1;

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	

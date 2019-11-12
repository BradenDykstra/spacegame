extends RigidBody2D

export var WALK_SPEED = 400;
export var GRAVITY = 100000;
export var JUMP_SPEED = -1000;
var SPEED_Y = 0;
#var screensize;

# Called when the node enters the scene tree for the first time.
#func _ready():
	#screensize = get_viewport_rect().size;
	


func _physics_process(delta):
	#move_and_collide(Vector2(0, GRAVITY * delta));
	var velocity = Vector2();

	if Input.is_action_pressed("right"):
		velocity.x += WALK_SPEED;
	
	if Input.is_action_pressed("left"):
		velocity.x -= WALK_SPEED;
	
	if Input.is_action_pressed("jump"):
		velocity.y = JUMP_SPEED * delta;
		move_local_y(velocity.y);
		SPEED_Y = JUMP_SPEED * delta;
		
	#if is_on_floor():
		
	
	
	SPEED_Y += GRAVITY * delta;
	velocity.y = SPEED_Y * delta
	move_local_x(velocity.x)
	move_local_y(velocity.y)
	#move_and_slide(velocity);

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	

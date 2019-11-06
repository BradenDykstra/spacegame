extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 400;
var screensize;

# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport_rect().size;

func _physics_process(delta):
	move_and_collide(Vector2(0, 1));

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2();
	if Input.is_action_pressed("right"):
		velocity.x += 1;
	if Input.is_action_pressed("left"):
		velocity.x -= 1;
	velocity *= speed;
	position += velocity * delta;

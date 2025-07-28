extends CharacterBody2D


var screen_size: Vector2


const INITIAL_SPEED: int = 1000
var speed: int = INITIAL_SPEED


var direction: Vector2 = Vector2.ZERO


const USE_MARGIN: bool = true  
const MARGIN: int = 20         

func _ready():
	randomize()
	screen_size = get_viewport_rect().size
	position = screen_size / 2
	direction = get_random_direction()

func _physics_process(delta):
	position += direction * speed * delta

	
	var min_x: float
	var max_x: float
	var min_y: float
	var max_y: float

	if USE_MARGIN:
		min_x = MARGIN
		max_x = screen_size.x - MARGIN
		min_y = MARGIN
		max_y = screen_size.y - MARGIN
	else:
		min_x = 0
		max_x = screen_size.x
		min_y = 0
		max_y = screen_size.y

	
	if position.x <= min_x:
		position.x = min_x
		direction.x *= -1
	elif position.x >= max_x:
		position.x = max_x
		direction.x *= -1

	
	if position.y <= min_y:
		position.y = min_y
		direction.y *= -1
	elif position.y >= max_y:
		position.y = max_y
		direction.y *= -1

func get_random_direction() -> Vector2:
	var x = [-1, 1].pick_random()
	var y = randf_range(-1.0, 1.0)

	while abs(y) < 0.2:
		y = randf_range(-1.0, 1.0)

	return Vector2(x, y).normalized()

extends CharacterBody2D

@export var max_speed: float = 100

var direction := Vector2.ZERO
var last_direction := Vector2(1, 0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	move()


func move():
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * max_speed
	move_and_slide()
	set_player_direction()


func set_player_direction():
	if last_direction.x != direction.x && direction.x != 0:
		last_direction.x = direction.x
	
	if direction.x > 0:
		$SpritePivot.scale.x = 1
	elif direction.x < 0:
		$SpritePivot.scale.x = -1

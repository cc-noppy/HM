extends CharacterBody2D


signal player_fired_bullet(bullet, positon, direction)

@export var bullet: PackedScene
@export var speed: int = 200

@onready var end_of_gun = $EndOfGun
@onready var gun_direction = $GunDirection

func _ready():
	pass # Replace with function body.
	


	
func _process(_delta:float):
	var movement_direction = Input.get_vector("left", "right", "up", "down")
	velocity = movement_direction * speed
	
	move_and_slide()
	Globals.player_pos = global_position
	
	look_at(get_global_mouse_position())
	
func _unhandled_input(event: InputEvent):
		if event.is_action_pressed("shoot"):
			shoot()
			
	
func shoot():
	var bullet_instantiate = bullet.instantiate()
	var direction = (gun_direction.global_position - end_of_gun.global_position).normalized()
	emit_signal("player_fired_bullet", bullet_instantiate, end_of_gun.global_position, direction)



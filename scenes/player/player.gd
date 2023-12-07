extends CharacterBody2D

signal player_fired_bullet(bullet, positon, direction)

@export var bullet: PackedScene
@export var speed: int = 250

@onready var end_of_gun = $EndOfGun
@onready var gun_direction = $GunDirection

#dashing variables
@onready var stamina

func _ready():
	Globals.stamina = 100
	Globals.ammo_light = 100
	Globals.ammo_shotgun = 10
	
	
func _process(delta:float):
	var movement_direction = Input.get_vector("left", "right", "up", "down")
	velocity = movement_direction * speed
	
	#dashing
	if Input.is_action_just_pressed("ctrl") and Globals.stamina >= 25:
		dash()
		Globals.stamina -= 25
	
	Globals.stamina += 0.1
	
	
	move_and_slide()
	Globals.player_pos = global_position
	Globals.player_velocity = velocity
	look_at(get_global_mouse_position())


func _unhandled_input(event: InputEvent):
		if event.is_action_pressed("shoot"):
			shoot()

func shoot():
	var bullet_instantiate = bullet.instantiate()
	var direction = (gun_direction.global_position - end_of_gun.global_position).normalized()
	emit_signal("player_fired_bullet", bullet_instantiate, end_of_gun.global_position, direction)
	Globals.ammo_light -= 1 

func dash():
	speed = speed * 2.75
	$DashTimer.start()

func _on_timer_timeout():
	speed = 250

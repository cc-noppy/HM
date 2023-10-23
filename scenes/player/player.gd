extends CharacterBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down") #Input
	velocity = direction * 500
	move_and_slide()
	
	look_at(get_global_mouse_position())

extends CharacterBody2D

var health = 20
var speed: int = 150

func hit():
	health -= 10
	$AnimatedSprite2D.material.set_shader_parameter("progress", 0.9)
	if health <= 0:
		await get_tree().create_timer(0.5).timeout
		queue_free()



func _process(_delta):
	var direction = (Globals.player_pos - position).normalized()
	velocity = direction * speed
	move_and_slide()
	look_at(Globals.player_pos)


func _on_area_2d_area_entered(area):
	print(area)
	health -= 10
	if health <= 0:
		queue_free() # Replace with function body.

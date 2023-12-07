extends Area2D

# Adjust the velocity threshold
const VELOCITY_THRESHOLD = 400
var is_open = false

# tween
var close_tween
var open_tween 

func _ready():
	pass

func _process(_delta):
	pass

#func _on_body_entered(body):
	#print(body)
	#if body. get_initial_velocity() > VELOCITY_THRESHOLD:
		#close_tween.tween_property($"..","rotation",-1.5,0.2)

func _input(event):
	if event.is_action_pressed("interact") and has_overlapping_bodies() and not is_open:
		var open_tween = get_tree().create_tween()
		open_tween.tween_property($"..","rotation",-1.5,0.5)
		print("pressed while closed")
		is_open = true
	elif event.is_action_pressed("interact") and has_overlapping_bodies() and is_open:
		var close_tween = get_tree().create_tween()
		close_tween.tween_property($"..","rotation",0,0.5)
		print("pressed while open")
		is_open = false

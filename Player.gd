extends KinematicBody2D


export var rot_speed = 4.6
export var thrust = 500
export var max_vel = 400
export var friction = 0.65

var look_direction = Vector2(1, 0)
var screen_size = Vector2()
var rot = 0
var pos = Vector2(200, 200)
var vel = Vector2()
var acc = Vector2()
var JUMPBOST = 0 #100 or 0

#func _ready():
#	pass # Replace with function body.

func _physics_process(delta):
	$Blast.visible = false
	if Input.is_action_pressed("ui_left"):
		rot -= rot_speed * delta
	elif Input.is_action_pressed("ui_right"):
		rot += rot_speed * delta
	if Input.is_action_pressed("ui_up"):
		acc = Vector2(thrust + JUMPBOST, 0).rotated(rot)
		$Blast.visible = true
	else:
		acc = Vector2(0, 0)
		
	acc += vel * -friction
	vel += acc * delta
	pos += vel * delta

	set_rotation(rot)
	
	# We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.
	# The second parameter of "move_and_slide" is the normal pointing up.
	# In the case of a 2D platformer, in Godot, upward is negative y, which translates to -1 as a normal.
	move_and_slide(vel, Vector2(0, -1))

#func _process(delta):
#	pass
#	$Blast.visible = false
#	if Input.is_action_pressed("ui_left"):
#		rot -= rot_speed * delta
#	elif Input.is_action_pressed("ui_right"):
#		rot += rot_speed * delta
#	if Input.is_action_pressed("ui_up"):
#		acc = Vector2(thrust + JUMPBOST, 0).rotated(rot)
#		$Blast.visible = true
#	else:
#		acc = Vector2(0, 0)
#
#	acc += vel * -friction
#	vel += acc * delta
#	pos += vel * delta
#	set_position(pos)
#	set_rotation(rot)	

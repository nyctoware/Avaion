extends KinematicBody2D

const UP = Vector2(0,-1)
var motion = Vector2()
var dash = Vector2()
var my_candashint = 0

var jump_count = 0
const MAX_JUMP_COUNT = 2

func _physics_process(delta):
    motion.y += 10

    if Input.is_action_pressed("ui_right"):
        if Input.is_action_pressed("ui_run"):
            motion.x = 200
        else:
            motion.x = 100

    elif Input.is_action_pressed("ui_left"):
        if Input.is_action_pressed("ui_run"):
            motion.x = -200
        else:
            motion.x = -100
    else:
        motion.x = 0

    if Input.is_action_just_pressed("ui_dash"):
        if (my_candashint == 0):
            my_candashint = 1
            dash = motion
            motion = motion*15
            motion = move_and_slide(motion, UP)
            motion = dash
            my_candashint = 0


    if is_on_floor():
        if Input.is_action_just_pressed("ui_up"):
            motion.y = -270
            jump_count = 0


    if jump_count < MAX_JUMP_COUNT and Input.is_action_just_pressed("ui_up"):
        motion.y = -270
        jump_count += 1

    motion = move_and_slide(motion, UP)
extends CharacterBody2D

@onready var animation_tree : AnimationTree = $AnimationTree

var speed = 400  # speed in pixels/sec

func _ready():
	animation_tree.active = true


#Movement
func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	
	move_and_slide()

func update_animation_parameters():
	if velocity == Vector2.ZERO :
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
		
	if Input.is_action_just_pressed('use_item') :
		animation_tree["parameters/conditions/using_item"] = true
	else :
		animation_tree["parameters/conditions/using_item"] = false

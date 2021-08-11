extends KinematicBody2D

var velocidade = Vector2(0 , 0)
var aceleracao = 1.5
const pre_tiro = preload("res://bala.tscn")
var Life = 100

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		translate(Vector2(-100,0) * delta * aceleracao)
	if Input.is_action_pressed("ui_right"):
		translate(Vector2(100,0) * delta * aceleracao)
	move_and_collide(velocidade)
	if Input.is_action_just_pressed("ui_up"):
		if get_tree().get_nodes_in_group("bala").size() <= 3:
			var bala = pre_tiro.instance()
			bala.global_position = $Position2D.global_position
			get_parent().add_child(bala)
			$AnimatedSprite.play("shot")
	else:
			$AnimatedSprite.play("voar")
		
		


func _on_Area2D_area_entered(area):
	Life -= 10 

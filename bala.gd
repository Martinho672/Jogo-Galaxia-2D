extends Area2D

var velocidade = Vector2()
const speed = -150

func _ready():
	set_process(true)
	add_to_group("bala")
	pass

func _physics_process(delta):
	velocidade.y = speed * delta
	translate(velocidade)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_bala_area_entered(area):
	queue_free()

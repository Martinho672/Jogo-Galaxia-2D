extends CanvasLayer


var vida 
const pre_enemy = preload("res://Enemy.tscn")
var pontos = 0

func _ready():
	$Timer.start()
	$score/scoreTime.start()
	pass

func _process(delta):
	
	$score.text = String(pontos)
	vida = $Player.Life
	$Life.value = vida
	if vida <= 0:
		$Player.visible = false
		$Life.visible = false
		$GO_menu.visible = true
		get_tree().paused = true
		
		var inimigos = get_tree().get_nodes_in_group("inimigos")
		for inimigo in inimigos:
			inimigo.queue_free()
				
	

func _on_Timer_timeout():
	print($Timer.wait_time)
	var enemyG = pre_enemy.instance()
	enemyG.set_position(Vector2(rand_range(400,0),-70))
	get_parent().add_child(enemyG)
	if $Timer.wait_time > .8:
		$Timer.wait_time -=.100
		$Timer.start()
	elif $Timer.wait_time < .8:
		$Timer.wait_time -=.0004


func _on_scoreTime_timeout():
	pontos += 12
	$score/scoreTime.start()
	

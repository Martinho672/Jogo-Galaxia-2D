extends ParallaxBackground

var offSet = 0

func _ready():
	pass

func _process(delta):
	offSet += 80 * delta
	set_scroll_offset(Vector2(0, offSet) )

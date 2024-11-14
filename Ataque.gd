extends Area2D

var direcao = null


func set_direcao(x):
	direcao = x
	
func _process(delta):
	if(direcao): translate(direcao * 300 * delta)


func _on_area_entered(area: Area2D) -> void:
	queue_free() # Replace with function body.

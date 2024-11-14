extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var fase_esta_vazia : bool = get_tree().get_nodes_in_group("Inimigos").is_empty()
	if body.is_in_group("player") and fase_esta_vazia:
		$AudioStreamPlayer2D.stop()
		
		Ostplayer.tocar("robo-wow-104442")
		
		# Crie um Timer no código
		var timer = Timer.new()
		timer.wait_time = 1.5  # Tempo de espera em segundos
		timer.one_shot = true  # Define para disparar apenas uma vez
		add_child(timer)  # Adiciona o Timer à cena
		timer.start()  # Inicia o Timer
		
		await timer.timeout
		
		get_tree().change_scene_to_file("res://dungeon1.tscn")
		Ostplayer.tocar("Tensão")

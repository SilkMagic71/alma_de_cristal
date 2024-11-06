extends AudioStreamPlayer

func tocar(nome_musica: String) -> void:
	var musica: AudioStream = load("res://assets/audio/ost/%s.mp3" % nome_musica) as AudioStream
	if musica:
		stream = musica
		play()
	else:
		print("música %s não existe ou não está no diretório 'res://assets/audio/ost/' no formato mp3")

func _on_tree_exited() -> void:
	stop()
	stream = null

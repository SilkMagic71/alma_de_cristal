extends CharacterBody2D

# Velocidade do inimigo
@export var velocidade: float = 50.00

# Referência ao jogador (assumindo que o nó do jogador se chama "Player" e está na cena principal)
var jogador: Node2D = null

func _ready():
	# Atribui o jogador na cena principal (ajuste o caminho conforme necessário)
	jogador = get_parent().get_node("player")


func _process(delta):
	if jogador:
		# Direção do inimigo em relação ao jogador
		var direcao = (jogador.global_position - global_position).normalized()
		# Movimento do inimigo
		velocity = direcao * velocidade
		# Move o inimigo
		move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()

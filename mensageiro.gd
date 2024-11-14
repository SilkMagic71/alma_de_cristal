extends Node2D

@onready var label: Label = $Label

var player_in_area: bool = false



func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area and  Input.is_action_just_pressed("interação"):
		label.text = "Olá amigo! Bom te ver por aqui, preciso da sua ajuda!!"


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = true
		label.visible = true
		label.text = "Pressione 'E' para interagir" # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_in_area = false
		label.visible = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()

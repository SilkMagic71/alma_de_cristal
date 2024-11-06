extends Resource

class_name Amigo

enum estado {RESGATADO, AMALDIÇOADO, DESTRUIDO}

const SANIDADE_MAXIMA : int = 100

var sanidade_atual : int = SANIDADE_MAXIMA
var estado_atual : estado = estado.AMALDIÇOADO

@export var nome : String
@export var vulnerabilidade : int
@export var textura : Texture2D
@export var avatar : Texture2D

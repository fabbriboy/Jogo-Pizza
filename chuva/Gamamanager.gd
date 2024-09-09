extends Node2D
@onready var inimigo = preload("res://inimigo.tscn")
@onready var inimigo_marker  = preload("res://jamv.tscn")
@export var pos_inicio : Vector2
@export var n_inimigos: int
@export var inimigo_max_vida : int
@onready var spawn_timer: Timer = $SpawnTimer



func _on_spawn_timer_timeout() -> void:
	var inimigoM = inimigo_marker.instantiate()
	inimigoM.position = pos_inicio
	add_child(inimigoM)
	

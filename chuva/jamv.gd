extends Sprite2D

var spaw = preload("res://inimigo.tscn")


func _on_timer_timeout() -> void:
	var inimigo = spaw.instantiate()
	inimigo.position = position
	get_parent().add_child(inimigo)
	queue_free()

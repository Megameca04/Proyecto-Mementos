extends Area2D

enum ListaMementos {
	Memento1,
	Memento2,
	Memento3,
	Memento4,
}

@export var tipo_memento : ListaMementos
@export var AnimPlayer : AnimationPlayer

func restart():
	show()
	$LuzAntorcha.energy = 1.0
	$CollisionShape2D.disabled = false
	


func _on_body_entered(body: Node2D) -> void:
	if body is Jugador:
		body.obtain_memento(tipo_memento)
	
	AnimPlayer.call_deferred("play","FadeOutd")

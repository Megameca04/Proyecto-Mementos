extends Area2D

enum ListaEsperanzas {
	Rana,
	Toche,
	Cigarra,
}

@export var tipo_memento : ListaEsperanzas
@export var AnimPlayer : AnimationPlayer



func restart():
	show()
	$LuzAntorcha.energy = 1.0
	$CollisionShape2D.disabled = false
	$AudioStreamPlayer2D.play()


func _on_body_entered(body: Node2D) -> void:
	if body is Jugador:
		body.obtain_memento(tipo_memento)
	
	AnimPlayer.call_deferred("play","FadeOut")
	$AudioStreamPlayer2D.stop()

func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer2D.pitch_scale = randf_range(0.8,1.5)
	await get_tree().create_timer(randf()).timeout
	$AudioStreamPlayer2D.play()

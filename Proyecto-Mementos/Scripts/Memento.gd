extends Area2D

enum ListaMementos {
	Memento1,
	Memento2,
	Memento3,
	Memento4,
}

@export var tipo_memento : ListaMementos
@export var AnimPlayer : AnimationPlayer

func _ready() -> void:
	$Sprite2D.frame = tipo_memento
	restart()

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

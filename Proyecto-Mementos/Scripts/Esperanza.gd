extends Area2D

enum ListaEsperanzas {
	Rana,
	Toche,
	Cigarra,
}

var AudioFiles : Dictionary[ListaEsperanzas,AudioStream] = {
	ListaEsperanzas.Rana : preload("res://SFX/AudioRana.ogg"),
	ListaEsperanzas.Toche : preload("res://SFX/AudioToche.ogg"),
}
@export var tipo_esperanza : ListaEsperanzas
@export var AnimPlayer : AnimationPlayer

func _ready() -> void:
	$AudioStreamPlayer2D.stream = AudioFiles[tipo_esperanza]
	$AudioStreamPlayer2D.play()

func restart():
	show()
	$LuzAntorcha.energy = 1.0
	$CollisionShape2D.disabled = false
	$AudioStreamPlayer2D.play()


func _on_body_entered(body: Node2D) -> void:
	if body is Jugador:
		body.heal_player(5)
	
	$RechargeTimer.start()
	AnimPlayer.call_deferred("play","Stop")
	$AudioStreamPlayer2D.stop()

func _on_recharge_timer_timeout() -> void:
	AnimPlayer.call_deferred("play","Restart")
	$AudioStreamPlayer2D.play()

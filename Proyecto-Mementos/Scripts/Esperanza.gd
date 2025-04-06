extends Area2D

@export var tipo_esperanza : Variables.ListaEsperanzas
@export var AnimPlayer : AnimationPlayer

func _ready() -> void:
	$AudioStreamPlayer2D.stream = Variables.AudioFiles[tipo_esperanza]
	
	var tipe := randf()
	
	match tipo_esperanza:
		Variables.ListaEsperanzas.Rana:
			$Sprite2D.frame = 18 if tipe <= 0.5 else 19
		Variables.ListaEsperanzas.Toche:
			$Sprite2D.frame = 36 if tipe <= 0.5 else 37
		Variables.ListaEsperanzas.Cigarra:
			$Sprite2D.frame = 16 if tipe <= 0.5 else 17
	
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

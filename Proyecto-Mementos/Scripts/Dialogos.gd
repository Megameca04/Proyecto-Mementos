extends Control

signal dialog_jumped()

func show_dialog(text : String):
	get_tree().paused = true
	show()
	$TextoPrincipal.text = text
	$AnimationPlayer.play("Mostrar")

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("ui_accept"):
			if $TextoPrincipal.visible_ratio == 1:
				hide()
				get_tree().paused = false
				dialog_jumped.emit()

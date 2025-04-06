extends Node2D

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("ui_accept"):
			if $TextoFin.visible_ratio == 1:
				ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_MENU)

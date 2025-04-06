extends Control

func _ready() -> void:
	$VBoxContainer/VolverButton.grab_focus()

func _on_volver_button_pressed() -> void:
	ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_MENU)

extends Control

func _ready() -> void:
	$VBoxContainer/JugarButton.grab_focus()

func _on_jugar_button_pressed() -> void:
	ScenesManager.change_scene_to(ScenesManager.Scenes.GAME)

func _on_salir_button_pressed() -> void:
	get_tree().quit()

func _on_creditos_pressed() -> void:
	ScenesManager.change_scene_to(ScenesManager.Scenes.CREDITS)

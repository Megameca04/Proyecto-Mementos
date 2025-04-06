extends Node

enum Scenes{
	MAIN_MENU,
	GAME,
	END_SCENE,
	CREDITS,
}

const LoadScene = preload("res://Escenas/PantallaCarga.tscn")

var scenes_routes : Dictionary[Scenes, String] = {
	Scenes.MAIN_MENU : "res://Escenas/MainMenu.tscn",
	Scenes.GAME : "res://Escenas/Mundo.tscn",
	Scenes.END_SCENE : "res://Escenas/Fin.tscn",
	Scenes.CREDITS : "res://Escenas/Creditos.tscn",
}

var current_loading_scene : int = -1

func _process(delta: float) -> void:
	if current_loading_scene != -1 and (ResourceLoader.load_threaded_get_status(scenes_routes[current_loading_scene])
			== ResourceLoader.THREAD_LOAD_LOADED):
			get_tree().call_deferred("change_scene_to_packed", ResourceLoader.load_threaded_get(scenes_routes[current_loading_scene]))

func change_scene_to(scene : Scenes):
	current_loading_scene = scene
	
	get_tree().call_deferred("change_scene_to_packed",LoadScene)
	
	ResourceLoader.load_threaded_request(scenes_routes[scene])

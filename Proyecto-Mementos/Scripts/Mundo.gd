extends Node2D

signal show_dialog(text : String)

enum ListaMementos {
	Memento1,
	Memento2,
	Memento3,
	Memento4,
}

@export var Player : Jugador

var obtained_mementos : Dictionary[ListaMementos, bool] = {
	ListaMementos.Memento1 : false,
	ListaMementos.Memento2 : false,
	ListaMementos.Memento3 : false,
	ListaMementos.Memento4 : false,
}

var dialogs_mementos : Dictionary[ListaMementos, String] = {
	ListaMementos.Memento1 : "Recuerdo esa vieja mecedora todavia.",
	ListaMementos.Memento2 : "Extraño ese café por la mañana.",
	ListaMementos.Memento3 : "Siempre recuerdo esas largas jornadas a machete y azadon.",
	ListaMementos.Memento4 : "Ese armario siempre estaba lleno de sorpresas.",
}

func _ready() -> void:
	Player.lifetime_ended_signal.connect(restart_game)
	Player.global_position = $InitialPos.global_position

func restart_game():
	Player.global_position = $InitialPos.global_position
	
	for i in obtained_mementos:
		obtained_mementos[i] = false
	
	for i in get_tree().get_nodes_in_group("Memento"):
		i.restart()

func player_obtain_memento(m : ListaMementos):
	obtained_mementos[m] = true

func _on_casa_body_entered(body: Node2D) -> void:
	if (
		obtained_mementos[ListaMementos.Memento1] and
		obtained_mementos[ListaMementos.Memento2] and
		obtained_mementos[ListaMementos.Memento3] and
		obtained_mementos[ListaMementos.Memento4]
	):
		print("Fin del juego")
	else:
		for i in obtained_mementos:
			if obtained_mementos[i] == false:
				show_dialog.emit(dialogs_mementos[i])
				break
		get_tree().paused = true
	

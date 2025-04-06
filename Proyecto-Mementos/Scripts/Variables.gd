extends Node

enum ListaMementos {
	Memento1,
	Memento2,
	Memento3,
	Memento4,
}

enum ListaEsperanzas {
	Rana,
	Toche,
	Cigarra,
}

static var AudioFiles : Dictionary[ListaEsperanzas,AudioStream] = {
	ListaEsperanzas.Rana : preload("res://SFX/AudioRana.ogg"),
	ListaEsperanzas.Toche : preload("res://SFX/AudioToche.ogg"),
	ListaEsperanzas.Cigarra : preload("res://SFX/AudioCigarra.ogg"),
}

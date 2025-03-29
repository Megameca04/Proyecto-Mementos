extends PointLight2D

signal lifetime_ended()

enum LightModes {
	STATIC,
	EPHIMERAL
}

@export var size : float = 600
@export var light_mode : LightModes
@export var life_time : int = 10

var alive_time: float = 0 :
	set(v):
		alive_time = clamp(v,0,life_time)
		if alive_time >= life_time:
			lifetime_ended.emit()
			set_physics_process(false)

@onready var initial_scale : float = size/64

func _ready() -> void:
	texture_scale = initial_scale
	

func _physics_process(delta: float) -> void:
	if light_mode == LightModes.EPHIMERAL:
		
		alive_time += delta
		texture_scale = initial_scale * (
			1-exp(
					(alive_time-life_time)/(0.8)
				)
			)
		
		if Input.is_action_just_pressed("ui_accept"):
			alive_time -= 2
		if Input.is_action_just_pressed("ui_cancel"):
			alive_time = 0

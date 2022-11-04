class_name Player
extends KinematicBody2D

var gravity = 6
var velocity = Vector2.ZERO

onready var animations = $Animations
onready var sprite = $Sprite
onready var camera = $Camera
onready var states = $state_manager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	states.init(self)

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)

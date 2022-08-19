class_name Player
extends KinematicBody2D

var gravity = 5;
var velocity = Vector2.ZERO;
var mouse = get_global_mouse_position();
var maxHealth = 100;
var minHealth = 0;
export var currentHealth = 100;


onready var flip = $Flip;
onready var animation = $AnimationPlayer;
onready var states = $StateManager;
onready var hat = $Flip/Rotate/Hat/AnimationHat;

func _ready() -> void:
	$Hud/HpFrame/TextureProgress.value = currentHealth;
	# Initialize the state machine, passing a reference of
	# the player to the states, that way they can move and
	# react accordingly
	states.init(self);
	$Hud.update(currentHealth, maxHealth);


func _unhandled_input(event: InputEvent) -> void:
	states.input(event);


func _physics_process(delta: float) -> void:
	flip();
	states.physics_process(delta);


func flip():
	mouse = get_global_mouse_position();
	if mouse < position:
		$Flip.scale.x = -1;
	else:
		$Flip.scale.x = 1;


func heal(health):
	currentHealth = currentHealth + health;
	$Hud.update(currentHealth, maxHealth);


func dor(damage):
	currentHealth = clamp(currentHealth - damage, minHealth, maxHealth);
	$Hud.update(currentHealth, maxHealth);
	print(currentHealth);


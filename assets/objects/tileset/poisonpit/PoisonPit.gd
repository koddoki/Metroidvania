extends Area2D

var group;
var i;
var j;
var test;

func _ready() -> void:
	$Timer.start()

func dot():
	group = get_overlapping_bodies();
	for i in group:
		i.dor(5);

func _on_Timer_timeout() -> void:
	dot();
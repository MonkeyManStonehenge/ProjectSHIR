extends Control

func _ready():
	visible = false

var scene:Node

func activeScene(s:Node):
	scene = s

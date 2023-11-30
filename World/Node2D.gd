# Angenommen, dies ist das Skript für deine Hauptspiel-Szene
extends Node

func _ready():
	var dialogue_instance = preload("res://World/plant.tscn").instance()
	var canvas_layer = CanvasLayer.new()
	add_child(canvas_layer)
	canvas_layer.add_child(dialogue_instance)
	

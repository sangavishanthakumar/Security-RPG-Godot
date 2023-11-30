extends Area2D

var dialogue_instance: Node2D = null

func _ready():
	dialogue_instance = $dialogue 
	dialogue_instance.visible = false 
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.name == "Player":
		dialogue_instance.visible = true

func _on_body_exited(body):
	if body.name == "Player": 
		dialogue_instance.visible = false


""" old way to make the textbox (png) visible
# call the dialogue window plant.tscn
var dialog_scene = preload("res://Dialogues/plant/plant.tscn")
var dialog_instance

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.is_in_group("player"):
		if not dialog_instance:
			dialog_instance = dialog_scene.instantiate()
			get_tree().root.add_child(dialog_instance) 
		dialog_instance.visible = true

func _on_body_exited(body):
	if body.is_in_group("player") and dialog_instance:
		dialog_instance.visible = false

"""


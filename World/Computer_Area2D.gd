# Computer_Area2D.gd
extends Area2D

# call the dialogue window plant.tscn
var dialog_scene = preload("res://Dialogues/computer/player_close_to_computer.tscn")
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
var text_box

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	text_box = get_node("/root/World/CanvasLayer/TextBox")

func _on_body_entered(body):
	if body.is_in_group("player"):
		text_box.show_text("Möchtest du dir den Computer näher ansehen?")

func _on_body_exited(body):
	if body.is_in_group("player"):
		text_box.hide_text()

"""

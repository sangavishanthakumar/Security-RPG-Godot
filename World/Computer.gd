# Plant.gd
extends StaticBody2D

@export var dialogue_json: JSON
@onready var state = {}

func _ready():
	($EzDialogue as EzDialogue).start_dialogue(dialogue_json, state)
	pass

func _on_ez_dialogue_dialogue_generated(response: DialogueResponse):
	$Area2D/dialogue.add_text(response.text)
	
	for choice in response.choices:
		$Area2D/dialogue.add_choice(choice)

"""
var text_box

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	text_box = get_node("/root/World/CanvasLayer/TextBox")

func _on_body_entered(body):
	if body.is_in_group("player"):
		text_box.show_text("Eine Pflanze!")

func _on_body_exited(body):
	if body.is_in_group("player"):
		text_box.hide_text()

"""



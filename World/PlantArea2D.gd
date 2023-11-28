# Computer_Area2D.gd
extends Area2D

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

# TextBoxComputer.gd
extends Control  

var label

func show_text(text: String):
	label = $Label
	label.text = text
	self.visible = true

func hide_text():
	self.visible = false


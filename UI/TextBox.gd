# TextBoxComputer.gd
extends Control  # Oder was auch immer dein Hauptknoten ist

# Das Label-Kindknoten, das den Text anzeigt, definieren
var label

func show_text(text: String):
	label = $Label
	label.text = text
	self.visible = true

func hide_text():
	self.visible = false

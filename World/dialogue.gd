extends Node2D
# create dialogue window
@onready var choice_button_scene = preload("res://Dialogues/computer/choice_buttons.tscn")

var choice_buttons: Array[Button] = []

func _ready():
	# add_choice("Ja")
	# add_choice("Nein")
	pass

func add_text(text: String):
	$VBoxContainer/Label.text = text

# add the button choices from the scene choice_buttons.tsc
func add_choice(choice_text: String):
	var button_obj: ChoiceButton = choice_button_scene.instantiate()
	button_obj.choice_index = choice_buttons.size()
	# add button_obj to the array 
	choice_buttons.push_back(button_obj)
	button_obj.text = choice_text
	button_obj.choice_selected.connect(_on_choice_selected)
	$VBoxContainer.add_child(button_obj)

func _on_choice_selected(choice_index: int):
	print(choice_index)
	pass
	
func hide_text():
	visible = false

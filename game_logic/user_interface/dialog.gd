extends Node

# Sistema de diálogo
var nodes: Dictionary = {}
var current_node: String = ""
var dialog_active: bool = false

var history: Array = []

# Nós
@export var choices: BoxContainer
@export var name_label: Label
@export var dialog_label: RichTextLabel

func _input(event):
	if dialog_active and event.is_action_pressed("ui_accept"):
		next_node()

# Sistema de diálogo
func _on_button_pressed() -> void:
	$Button.disabled = true # botao debug provisório
	run_dialog("res://json/debug.json")

func json_deserialize(path: String): # Lê o arquivo JSON, e armazena o texto na memória (return jsonOutput)
	var file = FileAccess.open(path, FileAccess.READ)
	if file:
		var json_text = file.get_as_text()
		file.close()
		
		var json_output = JSON.parse_string(json_text)
		if json_output != null:
			return json_output
		else:
			print("JSON parse error")
			return null
	else:
		print("File not found in path: " + path)

func run_dialog(json_path):
	var data = json_deserialize(json_path)
	print(data)
	
	if data.has("start"):
		nodes = data["nodes"]
		current_node = data["start"]
		dialog_active = true
		show_node()
	else:
		print("Error: JSON text file doesn't have the start key.")
		return

func show_node():
	if !nodes.has(current_node):
		print("Broken node: ", current_node)
		dialog_active = false
		return

	var node = nodes[current_node]

	if node["type"] == "text":
		$Interface.visible = true
		choices.visible = false
		name_label.text = node["actor"]
		dialog_label.text = node["dialog"]
		history.append({
			"actor": node["actor"],
			"dialog": node["dialog"]
		})
		print(history)
	
	elif node["type"] == "choice":
		$Interface.visible = true
		choices.visible = true
		for choice in node["choices"]:
			var button = Button.new()
			button.text = choice["text"]
			button.pressed.connect(_on_choice_pressed.bind(choice["next"]))
			choices.add_child(button)

	elif node["type"] == "end":
		print("Node reached the final step.")
		print(history)
		dialog_active = false
		$Interface.visible = false

func next_node():
	var node = nodes[current_node]
	if node.has("next"):
		current_node = node["next"]
		show_node()
	else:
		print("Node has no next: ", current_node)

func _on_choice_pressed(next_node_in_choice):
	for button in choices.get_children():
		button.queue_free()
	current_node = next_node_in_choice
	show_node()

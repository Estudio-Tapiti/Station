@tool
extends Node3D
class_name Level

@export var player = CharacterBody3D
@export var camera = Camera3D

func _process(float) -> void:
	camera.global_position = player.global_position + Vector3(0, 6, 6)

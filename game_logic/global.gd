@tool
extends Node

func _ready() -> void:
	apply_display_settings(false, false)

func _process(delta: float) -> void:
	pass

func apply_display_settings(fullscreen_enabled, borderless_enabled):
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN if fullscreen_enabled else DisplayServer.WINDOW_MODE_WINDOWED)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, borderless_enabled)

@tool
extends EditorPlugin

var inspector_plugin

func _enter_tree():
	add_custom_type(
		"AggroZoneVisualizer",  # Display name in Node creation menu
		"Node2D",               # Parent type
		preload("res://addons/aggro_zone_visualiser/AggroZoneVisualiser.gd"),  # Your core script
		null                    # Optional custom icon
	)

func _exit_tree():
	remove_custom_type("AggroZoneVisualizer")

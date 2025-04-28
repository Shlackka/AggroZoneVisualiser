@tool
class_name AggroZoneVisualiser
extends Node2D

@export var aggro_radius: float = 150.0:
	set(value):
		aggro_radius = value
		queue_redraw()
		
@export var fov_angle: float = 90.0:
	set(value):
		fov_angle = value
		queue_redraw()
		
@export var vision_distance: float = 200.0:
	set(value):
		vision_distance = value
		queue_redraw()
		
@export var show_aggro_radius: bool = true:
	set(value):
		show_aggro_radius = value
		queue_redraw()

@export var show_vision_cone: bool = true:
	set(value):
		show_vision_cone = value
		queue_redraw()


func _ready():
	queue_redraw()

func _process(_delta):
	queue_redraw()

func _draw():
	if show_aggro_radius:
		draw_circle(Vector2.ZERO, aggro_radius, Color(1, 0, 0, 0.4))  # red

	if show_vision_cone:
		var angle_rad = deg_to_rad(fov_angle / 2.0)
		var forward = Vector2.RIGHT * vision_distance

		var left_dir = forward.rotated(-angle_rad)
		var right_dir = forward.rotated(angle_rad)

		var cone_points = [
			Vector2.ZERO,
			left_dir,
			right_dir,
		]

		draw_colored_polygon(cone_points, Color(1, 1, 0, 0.3))  # yellow

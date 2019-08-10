extends Spatial

onready var dg = $DebugGeometry


func _ready():
	draw_stuff()


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			draw_random_stuff()


func draw_stuff():
	dg.draw_debug_cube(10, Vector3(-1, 1, -1), 0.9 * Vector3(1, 1, 1), Color(10, 10, 0))
	
	var grid_pos = Vector3(5, 0, -5)
	var grid_normal = Vector3(-0.2, 1.0, 0.9).normalized()
	var grid_tangent = Vector3(-2.0, 0.8, 1.0).normalized()
	dg.draw_debug_line(10, grid_pos, grid_pos + grid_normal, 0, Color(0, 10, 0))
	dg.draw_debug_line(10, grid_pos, grid_pos + grid_tangent, 0, Color(0, 0, 10))
	dg.draw_debug_grid(10, grid_pos, 10, 5, 20, 10, grid_normal, grid_tangent, Color(5, 5, 5))

	dg.draw_debug_grid(10, Vector3(), 10, 10, 10, 10, Vector3.RIGHT, Vector3.BACK, Color(10, 0, 0))
	dg.draw_debug_grid(10, Vector3(), 10, 10, 10, 10, Vector3.UP, Vector3.RIGHT, Color(0, 10, 0))
	dg.draw_debug_grid(10, Vector3(), 10, 10, 10, 10, Vector3.BACK, Vector3.RIGHT, Color(0, 0, 10))

	dg.draw_debug_cylinder(10, Vector3(2, -2, 1), Vector3(3, -1, 2), 1.0, 32, true, Color(5, 0, 5))
	dg.draw_debug_cone(10, Vector3(-4, 1, 0), Vector3(-4, 2, -1), 0.2, 0.5, 16, true, Color(0, 2, 0), false)

	dg.draw_debug_sphere(10, Vector3(-2, -2, 2), 36, 18, 1.5, Color(0, 2, 2))

	dg.draw_debug_line(10, Vector3(2, 1, 0), Vector3(-2, 0, 3), 0.1, Color(0.7, 0.2, 0.1))
	dg.draw_debug_coordinate_system(10, Vector3.ZERO, Vector3(1, 0, 0), Vector3(0, 1, 0), 1, 10)
	dg.draw_debug_cylinder(10, Vector3(4, 0, -3), Vector3(2, 1, -4), 0.5, 16, true, Color(1, 1, 1), true)
	dg.draw_debug_cone(10, Vector3(-3, 1, 0), Vector3(-3, 2, -1), 0.5, 0.2, 16, true, Color(0, 2, 0), true)
	dg.draw_debug_arrow(10, Vector3(4, 2, 1), Vector3(1, -3, 2), 2, Color(3, 2, 1))
	dg.draw_debug_point(10, Vector3(2, 3, 1), 0.1, Color(0, 0, 0))
	dg.draw_debug_coordinate_system(10, Vector3(-4, 0, -3), Vector3(3, 2, 1), Vector3(1, 1, 1), 0.5, 10)


func draw_random_stuff():
	var random = round(rand_range(0, dg.DebugShape.size())) as int
	match random:
		dg.DebugShape.CUBE:
			dg.draw_debug_cube(rand_range(0, 10), Vector3(rand_range(-3, 3), rand_range(-3, 3), rand_range(-3, 3)), Vector3(rand_range(0, 3), rand_range(0, 3), rand_range(0, 3)), Color(rand_range(0, 5), rand_range(0, 5), rand_range(0, 5)), round(randf()) as bool)
		dg.DebugShape.SPHERE:
			dg.draw_debug_sphere(rand_range(0, 10), Vector3(rand_range(-3, 3), rand_range(-3, 3), rand_range(-3, 3)), round(rand_range(6, 64)), round(rand_range(6, 64)), rand_range(0.1, 2), Color(rand_range(0, 5), rand_range(0, 5), rand_range(0, 5)), round(randf()) as bool)
		dg.DebugShape.CYLINDER:
			dg.draw_debug_cylinder(rand_range(0, 10), Vector3(rand_range(-3, 3), rand_range(-3, 3), rand_range(-3, 3)), Vector3(rand_range(-3, 3), rand_range(-3, 3), rand_range(-3, 3)), rand_range(0.1, 2), round(rand_range(6, 64)), round(randf()) as bool, Color(rand_range(0, 5), rand_range(0, 5), rand_range(0, 5)), round(randf()) as bool)
		dg.DebugShape.CONE:
			dg.draw_debug_cone(rand_range(0, 10), Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), rand_range(0.1, 2), rand_range(0.1, 3), round(rand_range(6, 64)), Color(rand_range(0, 5), rand_range(0, 5), rand_range(0, 5)), Color(rand_range(0, 5), rand_range(0, 5), rand_range(0, 5)), round(randf()) as bool)
		dg.DebugShape.ARROW:
			dg.draw_debug_arrow(rand_range(0, 10), Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), rand_range(0.1, 5), Color(rand_range(0, 5), rand_range(0, 5), rand_range(0, 5)), round(randf()) as bool)
		dg.DebugShape.COORDINATE_SYSTEM:
			dg.draw_debug_coordinate_system(rand_range(0, 10), Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), rand_range(0.1, 5), rand_range(0, 5), round(randf()) as bool)
		dg.DebugShape.GRID:
			dg.draw_debug_grid(rand_range(0, 10), Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), rand_range(1, 10), rand_range(1, 10), round(rand_range(1, 50)) as int, round(rand_range(1, 50)) as int, Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), Color(rand_range(0, 5), rand_range(0, 5), rand_range(0, 5)))
		dg.DebugShape.LINE:
			dg.draw_debug_line(rand_range(0, 10), Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), rand_range(-1, 1), Color(rand_range(0, 5), rand_range(0, 5), rand_range(0, 5)))
		dg.DebugShape.POINT:
			dg.draw_debug_point(rand_range(0, 10), Vector3(rand_range(-5, 5), rand_range(-5, 5), rand_range(-5, 5)), rand_range(-1, 1), Color(rand_range(0, 5), rand_range(0, 5), rand_range(0, 5)))

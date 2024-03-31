extends CanvasLayer

@export var map_size: Vector2i
@export var grid_cell_scene: PackedScene

@onready var map = %"GridContainer Map"

var player_position:= Vector2i(1,1)

func _ready():
	map.columns= map_size.x + 1
	update_map()

func update_map():
	for child in map.get_children():
		child.free()
	
	for y in map_size.y + 1:
		for x in map_size.x + 1:
			
			if x== 0 and y == 0:
				# empty space
				var label= Label.new()
				map.add_child(label)
				
			elif y == 0 and x > 0:
				var label= Label.new()
				label.text= str(x)
				label.size_flags_horizontal= Control.SIZE_FILL
				label.horizontal_alignment= HORIZONTAL_ALIGNMENT_CENTER
				map.add_child(label)
				
			elif x == 0 and y > 0:
				var label= Label.new()
				label.text= str(y)
				map.add_child(label)

			else:
				var cell= grid_cell_scene.instantiate()
				map.add_child(cell)
				if player_position == Vector2i(x, y):
					cell.set_text("player\npos")


func _on_move_button_pressed(_direction: Vector2i):
	player_position+= _direction
	prints("Player position", player_position)
	update_map()
	

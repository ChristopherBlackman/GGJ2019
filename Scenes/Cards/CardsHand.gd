extends HBoxContainer

var children

func _ready():
	children = self.get_children()
	
func _process(delta):
	var currX = get_global_mouse_position().x
	var currY = get_global_mouse_position().y
	
	print(str(OS.get_real_window_size().x) + ", " + str(currX))
	children = self.get_children()
	if currX > 0 and currX < self.get_size().x and currY > 0 and currY < self.get_size().y:
		for child in children:
			child.set_custom_minimum_size(Vector2(100, 130)) 
			child.set_size(Vector2(100, 130))
			
		var screen_x = OS.get_real_window_size().x
		var num_card_len = children.size() * 100
		var x_position = 50 - num_card_len * (currX / screen_x)
		self.set_position(Vector2(x_position, 0))
	else:
		for child in children:
			child.set_custom_minimum_size(Vector2(50, 130)) 
			child.set_size(Vector2(100, 130))

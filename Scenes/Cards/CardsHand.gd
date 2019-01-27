extends HBoxContainer

var children

func _ready():
	children = self.get_children()
	
func _process(delta):
	var currX = get_local_mouse_position().x
	var currY = get_local_mouse_position().y
	
	if currX > 0 and currX < self.get_size().x and currY > 0 and currY < self.get_size().y:
		print("in")
		children = self.get_children()
	
		for child in children:
			child.set_custom_minimum_size(Vector2(100, 130)) 
			child.set_size(Vector2(100, 130))
	else:
		print("out")
		children = self.get_children()
		
		for child in children:
			child.set_custom_minimum_size(Vector2(50, 130)) 
			child.set_size(Vector2(100, 130))

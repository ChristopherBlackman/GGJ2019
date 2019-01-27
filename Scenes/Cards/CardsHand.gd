extends HBoxContainer

var children

func _ready():
	children = self.get_children()

func _on_Cards_gui_input(ev):
	print(ev)
	children = self.get_children()
	
	for child in children:
		child.set_custom_minimum_size(Vector2(100, 130)) 
		child.set_size(Vector2(100, 130))

func _on_Cards_mouse_exited():
	children = self.get_children()
	
	for child in children:
		child.set_custom_minimum_size(Vector2(50, 130))
		child.set_size(Vector2(100, 130))
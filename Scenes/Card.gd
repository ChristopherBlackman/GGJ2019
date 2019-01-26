extends Button

export (String) var title = "Default"
export var about_text = "about"
export (Texture) var image
export (int) var cycles = 1
export (int) var spawn_time = 1

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#self.get_child("Picture").
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_pressed():
	print("Card Pressed")
	pass # replace with function body



func _on_Button_mouse_entered():
	print("Mouse Enterted")
	pass # replace with function body

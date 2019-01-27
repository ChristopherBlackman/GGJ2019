extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

#group call : used to display things to log
func log_msg(msg):
	print("Logger : "+msg)
	self.text = self.text + "\n" + msg

#group call : used to reset the logger text field
func reset():
	self.text = ""
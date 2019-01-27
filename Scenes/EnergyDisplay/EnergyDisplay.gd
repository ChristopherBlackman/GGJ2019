extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var maximum_val = 10.0
var current_val = 10.0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#set_max_val(10)
	update()
	pass

func set_maximum_val(val):
	maximum_val = val
	update()

func set_current_val(val):
	print("EnergyDisplay setv : " + str(val))
	current_val = val
	update()
	
func update():
	#self.value = (current_val/maximum_val)*self.max_value
	self.text = str(int(current_val))
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

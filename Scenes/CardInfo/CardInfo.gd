extends Control

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

# group call : cards call this to display their value
func card_info_msg(title,desc,img):
	print("CardInfo recived : " + title)
	$HBloc/Title.text = title
	$HBloc/Description.text = desc
	$HBloc/TextureRect.texture = img

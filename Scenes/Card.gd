extends Button

export (String) var title = "Default"
export var about_text = "about"
export (Texture) var image
export (int) var cycles = 1
export (int) var spawn_time = 1
export (int) var expire_time = 3
var current_cycle = 1
export (String) var nextCardExpire
export (String) var nextCardNonExpire

func _ready():

	$Picture.texture = self.image
	pass

func next_cycle():
	current_cycle += 1
	if current_cycle >= expire_time:
		self.next_card(nextCardExpire)

func next_card(card):
	var res = load(isNextCard)
	# call rootlnode or something !!


func _on_Button_pressed():
	print("Card Pressed")
	self.nextCard(card)



func _on_Button_mouse_entered():
	print("Mouse Enterted")
	#display card on the info screen

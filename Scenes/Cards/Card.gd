extends Button

# card attributes
export (String) var title = "Default"
export var about_text = "about"
export (Texture) var image
export (int) var cycles = 1
export (String) var expire_log_msg = "bad event happend"
export (String) var action_log_msg = "Card Preformed Action"

# when this card should be spawned in
	# NAN means it is not spawnable by coincidence
	# number > 0, is the number of turn it will take to spawn
export (int) var spawn_time = NAN

# event spwan time
export (int) var expire_time = 3
var current_cycle = 1

# cards that these affect
export (String) var nextCardExpire = ""
export (String) var nextCardNonExpire = ""

func _ready():

	$Picture.texture = self.image
	pass

# inherited message (may like a reminder kinda system)
func cycle_msg():
	return ""
	
func action():
	self.log_msg(action_log_msg)
	self.next_card(nextCardNonExpire)

func next_cycle():
	self.current_cycle += 1
	var msg = cycle_msg()
	if current_cycle >= expire_time:
		log_msg(expire_log_msg)
		self.next_card(nextCardExpire)
	elif not msg == "" :
		log_msg(msg)

# talks to cardManager and sends next card scene for next cycle
func next_card(card):
	print("next_card")
	print(card)
	if not card == "":
		var res = load(card)
		#!!! call rootlnode or something !!
	destruct()
	
func log_msg(msg):
	print(msg)
	#!!! call root node to display msg / signal for msg or group

func destruct():
	self.queue_free()
	pass


func _on_Button_mouse_entered():
	print("Mouse Enterted")
	#display card on the info screen


func _on_Button_button_down():
	print("Card Pressed")
	action()




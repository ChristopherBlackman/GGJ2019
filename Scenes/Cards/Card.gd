extends Button

# card attributes
export (String) var title = "Default"
export var about_text = "about"
export (Texture) var image
export (int) var cycles = 1
export (String) var expire_log_msg = "bad event happend"
export (String) var action_log_msg = "Card Preformed Action"
export (int) var instant_cost = 1
export (int) var next_cost = 1

# when this card should be spawned in
	# NAN means it is not spawnable by coincidence
	# number > 0, is the number of turn it will take to spawn
export (int) var spawn_time = NAN

# event spwan time
export (int) var expire_time = 3
var current_cycle = 1

# cards that these affect
export (String) var cardExpire = ""
export (String) var action = ""
export (String) var instantAction = ""

#------------------------------------------------------------------------------
#
#
#	Definitions 
#
#
#------------------------------------------------------------------------------

func _ready():
	print("Creating : "+title)
	print("expires : "+cardExpire)
	print("action  : "+action)
	$Picture.texture = self.image
	pass

# inherited message (may like a reminder kinda system)
func cycle_msg():
	return ""

# when agent click on button
func action():
	self.log_msg(action_log_msg)
	if not instantAction == "":
		self.instant_next_card(instantAction,instant_cost)
	if not action == "":
		self.next_card(action,next_cost)
	destruct()
	
# group call : increments cycle
func next_cycle():
	print("--------------------------------------------------")
	print("Card : " + self.title + " at : " + str(self.current_cycle))
	self.current_cycle = self.current_cycle + 1
	var msg = cycle_msg()
	if current_cycle >= expire_time:
		print("IS THIS WORKING")
		log_msg(expire_log_msg)
		self.instant_next_card(cardExpire,0)
		destruct()
	elif not msg == "" :
		log_msg(msg)

# talks to cardManager and sends next card scene for next cycle
func next_card(card,cost):
	print("next_card " + title + " : " + card)
	if not card == "":
		get_tree().call_group("CardManager","add_card_to_next_cycle",card,cost)
func instant_next_card(card,cost):
	print("instant_next_card " + title + " : " + card)
	if not card == "":
		get_tree().call_group("CardManager","add_card_instant",card,cost)

# sends message to logger
func log_msg(msg):
	print(title +" sends msg : " +msg)
	get_tree().call_group("Logger","log_msg",msg)

#sends message to card info
func card_info_msg():
	print(title + " sends card info")
	get_tree().call_group("CardInfo","card_info_msg",self.title,self.about_text,self.image)

func destruct():
	self.queue_free()
	pass


func _on_Button_mouse_entered():
	print("Mouse Enterted")
	card_info_msg()


func _on_Button_button_down():
	print("Card Pressed")
	action()





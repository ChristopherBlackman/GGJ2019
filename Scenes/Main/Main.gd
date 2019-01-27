extends Control

var root_node = self

const base_path = "res://Scenes/Cards/Card.tscn"
var logger = null

var next_cycle_additions = []

func _ready():
	logger = $GUI/Frame/View/VBoxContainer/Logger
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	#var base_card = card_scene.instance()

	#deck.append(base_card)
	
	# this is an example on how to add a card 
	print("loading")
	$GUI/Frame/Cards.add_child(create_card(base_path))
	
	# this is an example for updateing all the cards for the turn
	get_tree().call_group("Cards","next_cycle")

#group call : cards call this to add on next cycle
func add_card_to_next_cycle(path):
	print("Card Manager Cycle Addition : " + path)
	var card = create_card(path)
	next_cycle_additions.append(card)
	print(next_cycle_additions)


func create_card(path):
	var card_res = load(path)
	var card = card_res.instance()
	card.connect("send_log_msg",logger,"log_msg")
	return card
	
	
#func spawn_deck():
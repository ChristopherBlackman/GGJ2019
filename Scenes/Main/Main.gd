extends Control

var root_node = self
var next_cycle_additions = []

#------------------------------------------------------------------------------
#
#
#	Definitions 
#
#
#------------------------------------------------------------------------------

func _ready():
	# this is an example on how to add a card 
	print("loading")
	
	#this is an example for adding a card to the tree
	#var base_path = "res://Scenes/Cards/Card.tscn"
	#$GUI/Frame/Cards.add_child(create_card(base_path))
	
	# this is an example for updateing all the cards for the turn
	#get_tree().call_group("Cards","next_cycle")

#group call : cards call this to add on next cycle
func add_card_to_next_cycle(path):
	print("Card Manager Cycle Addition : " + path)
	var card = create_card(path)
	next_cycle_additions.append(card)
	print(next_cycle_additions)

# instansiates a card from a path
func create_card(path):
	var card_res = load(path)
	print(card_res)
	var card = card_res.instance()
	return card

# adds new cards to deck, simulates a cycle
func next_cycle():
	get_tree().call_group("Cards","next_cycle")
	while len(next_cycle_additions) > 0:
		$GUI/Frame/Cards.add_child(next_cycle_additions.pop_front(),true)
	
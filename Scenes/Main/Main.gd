extends Control

export (int) var energy = 6
var root_node = self
var cards_ui  = null 
var next_cycle_additions = []
var starting_deck = [
	'res://Scenes/Cards/Bed.tscn',
	'res://Scenes/Cards/Bath.tscn']

#------------------------------------------------------------------------------
#
#
#	Definitions 
#
#
#------------------------------------------------------------------------------

func _ready():
	
	print("loading")
	
	# init vars
	cards_ui = $GUI/Frame/Cards

	# add cards to hand
	for path in starting_deck:
		print(path)
		var res = load(path)
		var card = res.instance()
		cards_ui.add_child(card,true)
		
	#reset logger	
	get_tree().call_group("Logger","reset")
	get_tree().call_group("Logger","log_msg","You wake up\nTo Find\nMany things to do")
		

#group call : cards call this to add on next cycle
func add_card_to_next_cycle(path):
	print("Card Manager Cycle Addition : " + path)
	var card = create_card(path)
	next_cycle_additions.append(card)
	print(next_cycle_additions)

# group call : add card immediatly into card_ui list
func add_card_instant(path):
	print("Card Manager Instant Addition : " + path)
	var card = create_card(path)
	cards_ui.add_child(card,true)

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
		cards_ui.add_child(next_cycle_additions.pop_front(),true)
	
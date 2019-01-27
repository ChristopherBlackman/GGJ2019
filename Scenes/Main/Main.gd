extends Control

export (int) var energy = 6
export (int) var max_energy = 6
var cycle_num = 0
var root_node = self
var cards_ui  = null 
var next_cycle_additions = []
var starting_deck = [
	'res://Scenes/Cards/Bed.tscn',
	'res://Scenes/Cards/Bath.tscn']
var increments = {
	1 : [	'res://Scenes/Cards/Bed.tscn',
			'res://Scenes/Cards/Bath.tscn'
		],
	2 : ['res://Scenes/Cards/Plant.tscn'
		],
	3 : ['res://Scenes/Cards/Cat.tscn'],
	4 : ['res://Scenes/Cards/Frame.tscn'],
	5 : ['res://Scenes/Cards/Toilet.tscn']
}
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


	next_cycle()
	change_energy(0)
	
		
	#reset logger	
	get_tree().call_group("Logger","reset")
	get_tree().call_group("Logger","log_msg","You wake up nTo Find Many things to do")
	


#group call : cards call this to add on next cycle
func add_card_to_next_cycle(path,cost):
	print("Card Manager Cycle Addition : " + path)
	var card = create_card(path)
	next_cycle_additions.append(card)
	change_energy(-cost)


# group call : add card immediatly into card_ui list
func add_card_instant(path,cost):
	print("Card Manager Instant Addition : " + path)
	
	var card = create_card(path)
	cards_ui.add_child(card,true)
	change_energy(-cost)

func change_energy(delta):
	energy = energy +delta
	print("Energy Change : " + str(energy))
	
	if energy <= 0:
		get_tree().call_group("Logger","log_msg","You Faint")
		reset_energy()
		next_cycle()
	update_energy()
	
	

func reset_energy():
	energy = max_energy
	update_energy()

func update_energy():
	get_tree().call_group("EnergyDisplay","set_maximum_val",max_energy)
	get_tree().call_group("EnergyDisplay","set_current_val",energy)
	

# instansiates a card from a path
func create_card(path):
	var card_res = load(path)
	print(card_res)
	var card = card_res.instance()
	return card
	

# adds new cards to deck, simulates a cycle
func next_cycle():
	cycle_num = cycle_num + 1
	reset_energy()
	print("cycle : " + str(cycle_num))
	get_tree().call_group("Logger","log_msg","Day " + str(cycle_num))
	
	# next turn add
	get_tree().call_group("Cards","next_cycle")
	while len(next_cycle_additions) > 0:
		cards_ui.add_child(next_cycle_additions.pop_front(),true)
	
	#incremental add
	if increments.has(cycle_num):
		for path in increments[cycle_num]:
			print("Cards added : " + path)
			cards_ui.add_child(create_card(path))
	
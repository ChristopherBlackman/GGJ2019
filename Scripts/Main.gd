extends Control

var root_node = self

var card_scene = load("res://Scenes/Card.tscn")

var deck = []

func _ready():
	#var base_card = card_scene.instance()

	#deck.append(base_card)
	print("loading")
	load_cards()


func load_cards():
	var base_card = card_scene.instance()

#func spawn_deck():
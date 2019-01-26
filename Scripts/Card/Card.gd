extends Node2D

func _ready():
	print("test")

func card_onselect():
	pass # this will be where the card does its action

func _on_Area2D_input_event(viewport, event, shape_idx):
	print("input area")

func _on_Area2D_mouse_entered():
	print("mouse entered")

extends "res://Scenes/Cards/Card.gd"

func _on_Button_button_down():
	._on_Button_button_down()
	print("Card Pressed : bed")
	get_tree().call_group("CardManager","next_cycle")
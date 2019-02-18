extends Control

func _on_ButtonBack_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func _on_ButtonMusic_pressed():
	if Global.boolMusic:
		get_node("VBoxContainer/ButtonMusic").set_text("Music: OFF")
	else:
		get_node("VBoxContainer/ButtonMusic").set_text("Music: ON")
	Global.boolMusic = !Global.boolMusic


func _on_ButtonSound_pressed():
	if Global.boolSound:
		get_node("VBoxContainer/ButtonSound").set_text("Sound: OFF")
	else:
		get_node("VBoxContainer/ButtonSound").set_text("Sound: ON")
	Global.boolSound = !Global.boolSound


func _on_ButtonQuality_pressed():
	if Global.quality == "High":
		Global.quality = "Medium"
	elif Global.quality == "Medium":
		Global.quality = "Low"
	elif Global.quality == "Low":
		Global.quality = "High"
	get_node("VBoxContainer/ButtonQuality").set_text("Quality: "+Global.quality)

func _ready():
	# Sync buttons with global.gd
	if Global.boolMusic:
		get_node("VBoxContainer/ButtonMusic").set_text("Music: ON")
	else:
		get_node("VBoxContainer/ButtonMusic").set_text("Music: OFF")
	if Global.boolSound:
		get_node("VBoxContainer/ButtonSound").set_text("Sound: ON")
	else:
		get_node("VBoxContainer/ButtonSound").set_text("Sound: OFF")
	get_node("VBoxContainer/ButtonQuality").set_text("Quality: "+Global.quality)
	get_node("VBoxContainer2/SliderMusic").set_value(Global.Music*100)
	get_node("VBoxContainer2/SliderSound").set_value(Global.Sound*100)

func _on_SliderMusic_value_changed(value):
	Global.Music = value/100


func _on_SliderSound_value_changed(value):
	Global.Sound = value/100
extends Node

var character = "char1"
#var seed = "seed"
var email = ""
var password 
var enemy = "enemy"

signal deck_pressed

func set_character (value):
	character = value 

func pause():
	Engine.time_scale = 0

func resume():
	Engine.time_scale = 1


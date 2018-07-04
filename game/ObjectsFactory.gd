extends Node

func generate_base():
	return get_child(0).duplicate()

func generate_ship():
	return get_child(1).duplicate()
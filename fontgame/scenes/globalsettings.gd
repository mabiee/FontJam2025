extends Node

#font stuff
@onready var comicfont = preload("res://fonts/ComicSansMS3.ttf")
@onready var segoefont = preload("res://fonts/segoepr.ttf")
@onready var impactfont = preload("res://fonts/impact.ttf")
@onready var consolasfont = preload("res://fonts/CONSOLA.TTF")
	
#font setup
var currentfont

#game flags setup
var plot_flag = 0
var drawings_finished = false

extends Node3D

var mat1 = preload("res://materials/mat1.tres")
var mat2 = preload("res://materials/mat2.tres")

func _ready() -> void:
	update_legend()
	$Control/CheckBox.button_pressed = GameState.legend_visible
	reset_interact_material()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()

func update_legend():
	$Control/RichTextLabel.visible = GameState.legend_visible

func reset_interact_material():
	$ObjectContainer/PlayerInteraction/CSGBox3D.material = mat1

func _on_player_interaction_area_area_entered(area: Area3D) -> void:
	print("entered")
	$ObjectContainer/PlayerInteraction/CSGBox3D.material = mat2

func _on_player_interaction_area_area_exited(area: Area3D) -> void:
	print("exited")
	$ObjectContainer/PlayerInteraction/CSGBox3D.material = mat1

func _on_check_box_toggled(toggled_on: bool) -> void:
	GameState.legend_visible = toggled_on
	update_legend()

@tool
extends EditorPlugin

var palette_import_plugin

func _enter_tree():
	palette_import_plugin = preload("xcom_import_palette.gd").new()
	add_import_plugin(palette_import_plugin)

func _exit_tree():
	remove_import_plugin(palette_import_plugin)
	palette_import_plugin = null
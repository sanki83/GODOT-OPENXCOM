#xcom-palette-import.gd
@tool
extends EditorPlugin

var xcom_palette_import_plugin

func _enter_tree():
	xcom_palette_import_plugin = preload("res://addons/xcom-palette-import/palette_importer.gd").new()
	add_import_plugin(xcom_palette_import_plugin)

func _exit_tree():
	remove_import_plugin(xcom_palette_import_plugin)
	xcom_palette_import_plugin = null

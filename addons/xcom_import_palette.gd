# xcom_palette_import
@tool
extends EditorImportPlugin

func _get_importer_name():
	return "xcom.import.palette"

func _get_visible_name():
	return "XCOM PALETTE IMPORT"

func _get_recognized_extensions():
	return ["dat"]

func _get_save_extension():
	return "palette"

func _get_resource_type():
	return "Texture"

func _import(source_file, save_path, options, platform_variants, gen_files):
	var file = File.new()
	if file.open(source_file, File.READ) != OK:
		return FAILED
	var palette = Texture.new()
	# read the friggin palette

	var filename = save_path + "." + _get_save_exension()
	return ResourceSaver.save(filename, palette)

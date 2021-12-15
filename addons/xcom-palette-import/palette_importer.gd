#palette_importer.gd
@tool
extends EditorImportPlugin

func _get_import_options(path: String, preset_index: int) -> Array:
	return [{"name": "Default", "default_value": true}]

func _get_import_order() -> int:
	return 0

func _get_importer_name() -> String:
	return "xcom.import.palette"

func _get_option_visibility(path: String, option_name: StringName, options: Dictionary) -> bool:
	return false

func _get_preset_count() -> int:
	return 1

func _get_preset_name(preset_index: int) -> String:
	return "Default"

func _get_priority() -> float:
	return 1.0

func _get_recognized_extensions() -> PackedStringArray:
	return PackedStringArray(["dat", "pal"])

func _get_resource_type() -> String:
	return "ImageTexture"

func _get_save_extension() -> String:
	return "tex"

func _get_visible_name() -> String:
	return "XCOM PALETTE IMPORT"

func _import(source_file: String, save_path: String, options: Dictionary,
 platform_variants: Array, gen_files: Array) -> int:
	var file = File.new()
	if file.open(source_file, File.READ) != OK:
		return FAILED
	var imported_image: Image = Image.new()
	imported_image.create(256,5,false,Image.FORMAT_RGB8)
	for y in range(0, 5):
		for x in range(0,256):
			imported_image.set_pixel(x,y,Color(file.get_8()/64.0,file.get_8()/64.0,file.get_8()/64.0))
		for t in range(0,6):
			file.get_8()
	var palette: ImageTexture = ImageTexture.new()
	palette.create_from_image(imported_image)
	var filename = save_path + "." + _get_save_extension()
	return ResourceSaver.save(filename, palette)

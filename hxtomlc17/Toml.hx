package hxtomlc17;

import cpp.ConstCharStar;
import cpp.RawFILE;
import cpp.RawPointer;

@:buildXml("<include name='${haxelib:hxtomlc17}/build.xml' />")
@:include("tomlc17.h")
extern class Toml {
	/**
	 * Parse a toml document. Returns a `TomlResult` which must be freed
	 * using `free()` eventually.
	 *
	 * IMPORTANT: `src` must be a null terminated string! The `len` parameter
	 * does not include the null terminator.
	 */
	@:native("toml_parse_file")
	static function parse(src:ConstCharStar, len:Int):TomlResult;

	/**
	 * Parse a toml file. Returns a `TomlResult` which must be freed
	 * using `free()` eventually.
	 */
	@:native("toml_parse_file")
	static function parseFile(file:RawPointer<RawFILE>):TomlResult;

	/**
	 * Parse a toml file. Returns a `TomlResult` which must be freed
	 * using `free()` eventually.
	 */
	@:native("toml_parse_file_ex")
	static function parseFileEx(fname:ConstCharStar):TomlResult;

	/**
	 * Release the result.
	 */
	@:native("toml_free")
	static function free(result:TomlResult):TomlResult;

    /**
     * Find a key in a `TomlDatum`. Return the value of the key if found,
     * or a `TOML_UNKNOWN` otherwise.
     */
	@:native("toml_table_find")
	static function tableFind(datum:TomlDatum, key:ConstCharStar):TomlDatum;

    @:native("toml_default_option")
	static function defaultOption():TomlOption;

    @:native("toml_set_option")
	static function setOption(opt:TomlOption):Void;
}

package hxtomlc17;

import cpp.RawConstPointer;
import cpp.ConstCharStar;
import cpp.RawFILE;
import cpp.RawPointer;

@:buildXml("<include name='${haxelib:hxtomlc17}/build.xml' />")
@:include("tomlc17.h")
extern class Toml {
	/**
	 * Parse a toml document. Returns a `TomlResult` which must be freed
	 * using `Toml.free()` eventually.
	 *
	 * IMPORTANT: `src` must be a null terminated string! The `len` parameter
	 * does not include the null terminator.
	 */
	@:native("toml_parse")
	static function parse(src:ConstCharStar, len:Int):TomlResult;

	/**
	 * Parse a toml file. Returns a `TomlResult` which must be freed
	 * using `Toml.free()` eventually.
	 */
	@:native("toml_parse_file")
	static function parseFile(file:RawPointer<RawFILE>):TomlResult;

	/**
	 * Parse a toml file. Returns a `TomlResult` which must be freed
	 * using `Toml.free()` eventually.
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
	@:native("toml_get")
	static function get(datum:TomlDatum, key:ConstCharStar):TomlDatum;

	/**
	 * Locate a value starting from a toml_table. Return the value of the key if
	 * found, or a `TOML_UNKNOWN` otherwise.
	 *
	 * Note: the multipart-key is separated by DOT, and must not have any escape
	 * chars.
	 */
	@:native("toml_seek")
	static function seek(table:TomlDatum, multipartKey:ConstCharStar):TomlDatum;

	/**
	 * Find a key in a `TomlDatum`. Return the value of the key if found,
	 * or a `TOML_UNKNOWN` otherwise.
	 */
	@:native("toml_table_find")
	@:deprecated("Use Toml.get() instead")
	static function tableFind(datum:TomlDatum, key:ConstCharStar):TomlDatum;

	/**
	 *  Override values in `r1` using `r2`. Return a new result. All results
	 *  (i.e., `r1`, `r2` and the returned result) must be freed using `Toml.free()`
	 *  after use.
	 *
	 *  LOGIC:
	 *   ret = copy of `r1`
	 *   for each item x in `r2`:
	 *     if x is not in ret:
	 *          override
	 *     elif x in ret is NOT of the same type:
	 *         override
	 *     elif x is an array of tables:
	 *         append `r2`.x to ret.x
	 *     elif x is a table:
	 *         merge `r2`.x to ret.x
	 *     else:
	 *         override
	 */
	@:native("toml_merge")
	static function merge(r1:RawConstPointer<TomlResult>, r2:RawConstPointer<TomlResult>):TomlResult;

	/**
	 *  Check if two results are the same. Dictinary and array orders are
	 *  sensitive.
	 */
	@:native("toml_equiv")
	static function equiv(r1:RawConstPointer<TomlResult>, r2:RawConstPointer<TomlResult>):Bool;

	/**
	 * Get the default options. IF NECESSARY, use this to initialize
	 * `TomlOption` and override values before calling
	 * Toml.setOption().
	 */
	@:native("toml_default_option")
	static function defaultOption():TomlOption;

	/**
	 * Set toml options globally. Do this ONLY IF you are not satisfied with the
	 * defaults.
	 */
	@:native("toml_set_option")
	static function setOption(opt:TomlOption):Void;
}

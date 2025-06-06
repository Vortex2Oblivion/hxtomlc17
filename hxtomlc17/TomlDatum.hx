package hxtomlc17;

import cpp.Int32;
import cpp.Int16;
import cpp.Double;
import cpp.Int64;
import cpp.RawPointer;
import cpp.UInt32;
import cpp.ConstCharStar;

/**
 * /* This is a Node in a Tree that represents a toml document rooted
 * at `TomlResult`.toptab.
 */
@:buildXml("<include name='${haxelib:hxtomlc17}/build.xml' />")
@:include("tomlc17.h")
@:native("toml_datum_t")
@:structAccess
extern class TomlDatum {
	function new():Void;

	var type:TomlType;

	/**
	 * internal
	 */
	private var flag:UInt32;

	var u:TomlDatumU;
}

@:buildXml("<include name='${haxelib:hxtomlc17}/build.xml' />")
@:include("tomlc17.h")
@:structAccess
@:native("toml_datum_t::u")
extern class TomlDatumU {
	function new():Void;

	/**
	 * same as `str.ptr`; use if there are no null in string.
	 */
	var s:ConstCharStar;

	var str:TomlDatumStr;
	var arr:TomlDatumArr;

	/**
	 * integer
	 */
	var int64:Int64;

	/**
	 * float
	 */
	var fp64:Double;

	var boolean:Bool;
	var ts:TomlDatumTs;
	var tab:TomlDatumTab;
}

@:buildXml("<include name='${haxelib:hxtomlc17}/build.xml' />")
@:include("tomlc17.h")
@:structAccess
@:native("toml_datum_t::str")
extern class TomlDatumStr {
	function new():Void;

	/**
	 * null terminated string
	 */
	var ptr:ConstCharStar;

	var len:Int;
}

/**
 * date, time
 */
@:buildXml("<include name='${haxelib:hxtomlc17}/build.xml' />")
@:include("tomlc17.h")
@:structAccess
@:native("toml_datum_t::ts")
extern class TomlDatumTs {
	function new():Void;

	var year:Int16;
	var month:Int16;
	var day:Int16;

	var hour:Int16;
	var minute:Int16;
	var second:Int16;
	var usec:Int32;

	/**
	 * in minutes
	 */
	var tz:Int16;
}

/**
 * array
 */
@:buildXml("<include name='${haxelib:hxtomlc17}/build.xml' />")
@:include("tomlc17.h")
@:structAccess
@:native("toml_datum_t::arr")
extern class TomlDatumArr {
	function new():Void;

	/**
	 * count elem
	 */
	var size:Int32;

	var elem:RawPointer<TomlDatum>;
}

/**
 * table
 */
@:buildXml("<include name='${haxelib:hxtomlc17}/build.xml' />")
@:include("tomlc17.h")
@:structAccess
@:native("toml_datum_t::tab")
extern class TomlDatumTab {
	function new():Void;

	/**
	 * count key
	 */
	var size:Int32;

	var key:RawPointer<ConstCharStar>;
	var len:RawPointer<Int>;
	var value:RawPointer<TomlDatum>;
}

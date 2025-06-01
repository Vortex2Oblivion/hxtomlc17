package hxtomlc17;

import cpp.Char;
import cpp.ForcedString;
import cpp.RawPointer;

/**
 * Result returned by `Toml.parse()`
 */
@:buildXml("<include name='${haxelib:hxtomlc17}/build.xml' />")
@:include("tomlc17.h")
@:native("toml_result_t")
@:structAccess
extern class TomlResult {
	function new():Void;

    var ok:Bool;
    var toptab:TomlDatum;
    var errmsg:ForcedString;

    private var __internal:RawPointer<cpp.Void>;
}

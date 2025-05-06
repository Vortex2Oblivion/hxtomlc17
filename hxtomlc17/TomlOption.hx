package hxtomlc17;

import cpp.Callable;
import cpp.RawPointer;
import cpp.SizeT;

/* Options that override tomlc17 defaults globally */
@:buildXml("<include name='${haxelib:hxtomlc17}/build.xml' />")
@:include("tomlc17.h")
@:native("toml_option_t")
@:structAccess
extern class TomlOption {
	function new():Void;

	var check_utf8:Bool;
	var mem_alloc:Callable<SizeT->cpp.Void>;
	var mem_free:Callable<cpp.Void->cpp.Void>;
	var mem_realloc:Callable<(cpp.Void, SizeT) -> cpp.Void>;
}

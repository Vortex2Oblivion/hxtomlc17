package hxtomlc17;

enum abstract TomlType(Int) to Int from Int {
    var TOML_UNKNOWN:Int;
    var TOML_STRING:Int;
    var TOML_INT64:Int;
    var TOML_FP64:Int;
    var TOML_BOOLEAN:Int;
    var TOML_DATE:Int;
    var TOML_TIME:Int;
    var TOML_DATETIME:Int;
    var TOML_DATETIMETZ:Int;
    var TOML_ARRAY:Int;
    var TOML_TABLE:Int;
}
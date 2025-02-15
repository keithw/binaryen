(module
 (import "env" "js_func" (func $a_js_func))
 (import "env" "js_func_unused" (func $an_unused_js_func))
 (import "env" "memory" (memory $0 256 256))
 (import "env" "table" (table 10 10 funcref))

 (export "wasm_func" (func $a_wasm_func))
 (export "wasm_func_unused" (func $an_unused_wasm_func))

 (global $__THREW__ (mut i32) (i32.const 0))
 (global $__THREW__unused (mut i32) (i32.const 0))
 (global $from_segment (import "env" "g1") i32)
 (global $from_segment_2 (import "env" "g2") i32)
 (global $from_segment_never_used (import "env" "g3") i32)

 (data (i32.const 1024) "abcd")
 (data (global.get $from_segment) "abcd")
 (elem (global.get $from_segment_2) $table_func)

 (func $a_wasm_func
  (call $a_js_func)
  (drop (global.get $__THREW__))
 )
 (func $an_unused_wasm_func
  (drop (global.get $__THREW__unused))
 )
 (func $table_func
 )
)

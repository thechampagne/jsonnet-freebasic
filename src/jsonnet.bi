/'
 ' Copyright 2023 XXIV
 '
 ' Licensed under the Apache License, Version 2.0 (the "License");
 ' you may not use this file except in compliance with the License.
 ' You may obtain a copy of the License at
 '
 '     http://www.apache.org/licenses/LICENSE-2.0
 '
 ' Unless required by applicable law or agreed to in writing, software
 ' distributed under the License is distributed on an "AS IS" BASIS,
 ' WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 ' See the License for the specific language governing permissions and
 ' limitations under the License.
 '/
#ifndef __JSONNET_BI__
#define __JSONNET_BI__

extern "C"

#define LIB_JSONNET_VERSION "v0.19.1"

type JsonnetVm as JsonnetVm

type JsonnetJsonValue as JsonnetJsonValue

type JsonnetImportCallback as function cdecl(byval ctx as any ptr, byval base as const zstring ptr, byval rel as const zstring ptr, byval found_here as zstring ptr ptr, byval buf as zstring ptr ptr, byval buflen as uinteger ptr) as long

type JsonnetNativeCallback as function cdecl(byval ctx as any ptr, byval argv as const JsonnetJsonValue const ptr ptr, byval success as long ptr) as JsonnetJsonValue ptr

declare function jsonnet_version() as const zstring ptr
declare function jsonnet_make() as JsonnetVm ptr
declare sub jsonnet_max_stack(byval vm as JsonnetVm ptr, byval v as ulong)
declare sub jsonnet_gc_min_objects(byval vm as JsonnetVm ptr, byval v as ulong)
declare sub jsonnet_gc_growth_trigger(byval vm as JsonnetVm ptr, byval v as double)
declare sub jsonnet_string_output(byval vm as JsonnetVm ptr, byval v as long)
declare function jsonnet_json_extract_string(byval vm as JsonnetVm ptr, byval v as const JsonnetJsonValue ptr) as const zstring ptr
declare function jsonnet_json_extract_number(byval vm as JsonnetVm ptr, byval v as const JsonnetJsonValue ptr, byval out as double ptr) as long
declare function jsonnet_json_extract_bool(byval vm as JsonnetVm ptr, byval v as const JsonnetJsonValue ptr) as long
declare function jsonnet_json_extract_null(byval vm as JsonnetVm ptr, byval v as const JsonnetJsonValue ptr) as long
declare function jsonnet_json_make_string(byval vm as JsonnetVm ptr, byval v as const zstring ptr) as JsonnetJsonValue ptr
declare function jsonnet_json_make_number(byval vm as JsonnetVm ptr, byval v as double) as JsonnetJsonValue ptr
declare function jsonnet_json_make_bool(byval vm as JsonnetVm ptr, byval v as long) as JsonnetJsonValue ptr
declare function jsonnet_json_make_null(byval vm as JsonnetVm ptr) as JsonnetJsonValue ptr
declare function jsonnet_json_make_array(byval vm as JsonnetVm ptr) as JsonnetJsonValue ptr
declare sub jsonnet_json_array_append(byval vm as JsonnetVm ptr, byval arr as JsonnetJsonValue ptr, byval v as JsonnetJsonValue ptr)
declare function jsonnet_json_make_object(byval vm as JsonnetVm ptr) as JsonnetJsonValue ptr
declare sub jsonnet_json_object_append(byval vm as JsonnetVm ptr, byval obj as JsonnetJsonValue ptr, byval f as const zstring ptr, byval v as JsonnetJsonValue ptr)
declare sub jsonnet_json_destroy(byval vm as JsonnetVm ptr, byval v as JsonnetJsonValue ptr)
declare function jsonnet_realloc(byval vm as JsonnetVm ptr, byval buf as zstring ptr, byval sz as uinteger) as zstring ptr
declare sub jsonnet_import_callback cdecl(byval vm as JsonnetVm ptr, byval cb as JsonnetImportCallback, byval ctx as any ptr)
declare sub jsonnet_native_callback cdecl(byval vm as JsonnetVm ptr, byval name as const zstring ptr, byval cb as JsonnetNativeCallback, byval ctx as any ptr, byval params as const zstring const ptr ptr)
declare sub jsonnet_ext_var(byval vm as JsonnetVm ptr, byval key as const zstring ptr, byval val as const zstring ptr)
declare sub jsonnet_ext_code(byval vm as JsonnetVm ptr, byval key as const zstring ptr, byval val as const zstring ptr)
declare sub jsonnet_tla_var(byval vm as JsonnetVm ptr, byval key as const zstring ptr, byval val as const zstring ptr)
declare sub jsonnet_tla_code(byval vm as JsonnetVm ptr, byval key as const zstring ptr, byval val as const zstring ptr)
declare sub jsonnet_max_trace(byval vm as JsonnetVm ptr, byval v as ulong)
declare sub jsonnet_jpath_add(byval vm as JsonnetVm ptr, byval v as const zstring ptr)
declare function jsonnet_evaluate_file(byval vm as JsonnetVm ptr, byval filename as const zstring ptr, byval error as long ptr) as zstring ptr
declare function jsonnet_evaluate_snippet(byval vm as JsonnetVm ptr, byval filename as const zstring ptr, byval snippet as const zstring ptr, byval error as long ptr) as zstring ptr
declare function jsonnet_evaluate_file_multi(byval vm as JsonnetVm ptr, byval filename as const zstring ptr, byval error as long ptr) as zstring ptr
declare function jsonnet_evaluate_snippet_multi(byval vm as JsonnetVm ptr, byval filename as const zstring ptr, byval snippet as const zstring ptr, byval error as long ptr) as zstring ptr
declare function jsonnet_evaluate_file_stream(byval vm as JsonnetVm ptr, byval filename as const zstring ptr, byval error as long ptr) as zstring ptr
declare function jsonnet_evaluate_snippet_stream(byval vm as JsonnetVm ptr, byval filename as const zstring ptr, byval snippet as const zstring ptr, byval error as long ptr) as zstring ptr
declare sub jsonnet_destroy(byval vm as JsonnetVm ptr)
declare sub jsonnet_fmt_indent(byval vm as JsonnetVm ptr, byval n as long)
declare sub jsonnet_fmt_max_blank_lines(byval vm as JsonnetVm ptr, byval n as long)
declare sub jsonnet_fmt_string(byval vm as JsonnetVm ptr, byval c as long)
declare sub jsonnet_fmt_comment(byval vm as JsonnetVm ptr, byval c as long)
declare sub jsonnet_fmt_pad_arrays(byval vm as JsonnetVm ptr, byval v as long)
declare sub jsonnet_fmt_pad_objects(byval vm as JsonnetVm ptr, byval v as long)
declare sub jsonnet_fmt_pretty_field_names(byval vm as JsonnetVm ptr, byval v as long)
declare sub jsonnet_fmt_sort_imports(byval vm as JsonnetVm ptr, byval v as long)
declare sub jsonnet_fmt_debug_desugaring(byval vm as JsonnetVm ptr, byval v as long)
declare function jsonnet_fmt_file(byval vm as JsonnetVm ptr, byval filename as const zstring ptr, byval error as long ptr) as zstring ptr
declare function jsonnet_fmt_snippet(byval vm as JsonnetVm ptr, byval filename as const zstring ptr, byval snippet as const zstring ptr, byval error as long ptr) as zstring ptr

end extern

#endif '__JSONNET_BI__

project(
	'openhmd_godot', 'c',
	default_options: 'c_std=c99',
	version: '0.1.0',
	meson_version: '>= 0.44',
)
library_version = '0.1.0'
# cc = meson.get_compiler('c')

godot_openhmd_path = 'demo/addons/godot-openhmd/bin/'
# Local dependency paths, adapt them to your setup
godot_glad_path = 'glad' # ARGUMENTS.get("glad", "glad")
godot_headers_path = 'godot_headers' # ARGUMENTS.get("headers", "godot_headers/")

include_dirs = ['.', godot_headers_path, godot_glad_path]

#
# Dependencies
#
# libdl = cc.find_library('dl', required : true)

openhmd_proj = subproject('OpenHMD') # dependency('openhmd', required : true)
openhmd_dep = openhmd_proj.get_variable('openhmd_dep')

deps = [
#	libdl,
	openhmd_dep,
]

sources = [
	'src/ARVRInterface.c',
	'src/GodotCalls.c',
	'src/godot_openhmd.c',
	'src/openhmd_config.c',
	'src/openhmd_data.c',
	'src/openhmd_shader.c',
]

sources += [
  godot_glad_path + '/glad.c'
]

c_args = []
godot_openhmd_lib = library(
        'godot_openhmd',
        sources,
        include_directories: include_directories(include_dirs),
        c_args: c_args,
        cpp_args: c_args,
        dependencies: deps,
        install: true,
        version: library_version,
)

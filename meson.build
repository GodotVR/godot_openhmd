project(
	'godot_openhmd', 'c',
	default_options: 'c_std=c99',
	version: '0.1.1',
	meson_version: '>= 0.44',
)
library_version = '0.1.1'

godot_openhmd_path = 'demo/addons/godot-openhmd/bin/'

# Local dependency paths, adapt them to your setup
godot_glad_path = 'glad' # ARGUMENTS.get("glad", "glad")
godot_headers_path = 'godot_headers' # ARGUMENTS.get("headers", "godot_headers/")

include_dirs = ['.', godot_headers_path, godot_glad_path]

#
# Dependencies
#

openhmd_proj = subproject('OpenHMD') # dependency('openhmd', required : true)
openhmd_dep = openhmd_proj.get_variable('openhmd_dep')

deps = [
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
				install_dir: godot_openhmd_path,
        version: library_version,
)

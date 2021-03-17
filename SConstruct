#!python
import os, subprocess

# Local dependency paths, adapt them to your setup
godot_glad_path = ARGUMENTS.get("glad", "glad")
godot_headers_path = ARGUMENTS.get("headers", "godot_headers/")
openhmd_path = ARGUMENTS.get("openhmd", os.getenv("OPENHMD_PATH", "OpenHMD/"))

target = ARGUMENTS.get("target", "debug")

# platform= makes it in line with Godots scons file, keeping p for backwards compatibility
platform = ARGUMENTS.get("p", "linux")
platform = ARGUMENTS.get("platform", platform)

# destination path
godot_openhmd_path = 'demo/addons/godot-openhmd/bin/'

# This makes sure to keep the session environment variables on windows,
# that way you can run scons in a vs 2017 prompt and it will find all the required tools
env = Environment()
if platform == "windows":
    env = Environment(ENV = os.environ)

if ARGUMENTS.get("use_llvm", "no") == "yes":
    env["CXX"] = "clang++"

def add_sources(sources, directory):
    for file in os.listdir(directory):
        if file.endswith('.c'):
            sources.append(directory + '/' + file)
        elif file.endswith('.cpp'):
            sources.append(directory + '/' + file)

sources = []

platform_dir = ''
if platform == "osx":
    platform_dir = 'osx'
    godot_openhmd_path = godot_openhmd_path + 'osx/'
    env.Append(CCFLAGS = ['-g','-O3', '-arch', 'x86_64'])
    env.Append(LINKFLAGS = ['-arch', 'x86_64'])
    env.Append(LINKFLAGS=['-framework', 'Cocoa', '-framework', 'OpenGL', '-framework', 'IOKit'])
    env.Append(LIBS=['pthread'])

if platform == "linux":
    platform_dir = 'linux'
    godot_openhmd_path = godot_openhmd_path + 'linux/'
    env.Append(CCFLAGS = ['-fPIC', '-g','-O3'])
    env.Append(CXXFLAGS='-std=c++0x')
    env.Append(LINKFLAGS = ['-Wl,-R,\'$$ORIGIN\''])

if platform == "windows":
    platform_dir = 'win'
    godot_openhmd_path = godot_openhmd_path + 'win64/'
    if target == "debug":
        env.Append(CCFLAGS = ['-EHsc', '-D_DEBUG', '/MDd'])
    else:
        env.Append(CCFLAGS = ['-O2', '-EHsc', '-DNDEBUG', '/MD'])
    env.Append(LIBS=["opengl32", "setupapi", "advapi32.lib"])

####################################################################################################################################
# Link in glad
sources.append(godot_glad_path + "/glad.c")


####################################################################################################################################
# Link in openhmd, we're linking in dynamic.
env.Append(CFLAGS=["-DDLL_EXPORT"])
env.Append(CPPFLAGS=["-DDLL_EXPORT"])

env.Append(CPPPATH=[ openhmd_path + "include/" ])
if platform == "windows":
    env.Append(LIBS=[openhmd_path + "lib/win64/openhmd.lib"])

# TODO add other platforms!!

####################################################################################################################################
# and add our main project
env.Append(CPPPATH=['.', godot_headers_path, godot_glad_path])

add_sources(sources, "src")

library = env.SharedLibrary(target=godot_openhmd_path + 'godot_openhmd', source=sources)
Default(library)

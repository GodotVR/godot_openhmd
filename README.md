# OpenHMD GDNative driver for OpenHMD

I'll add more info here soon, this is still a work in progress and likely to change drastically.

The leading version of this repository now lives at:
https://github.com/GodotVR/godot_openhmd

Versions
--------
Note that due to a breaking change in Godot 3.1 the current master of this repository creates a GDNative module that can only be used with Godot 3.1 or later.

If you want to build this module for Godot 3.0 please checkout the 3.0 branch.

Building this module
--------------------
In order to compile this module you will have to clone the source code to disk. You will need a C/C++ compiler, python and scons installed. This is the same toolchain you will need in order to compile Godot from master. The documentation on Godot is a very good place to read up on this. It is too much information to duplicate here.

When cloning this repository make sure you also install all the submodules.
Either clone with `git clone --recursive` or execute:
```
git submodules init
git submodules update
```
after cloning.

If you're pulling a newer version (re)execute the `git submodules update` command to make sure the modules are up to date. If you're interested in using different branches of the 3rd party modules just CD into their subfolder and you can execute git commands on those repositories.

*Compiling*
If everything is into place compiling should be pretty straight forward

For Linux: ```scons platform=linux```
For OSX: ```scons platform=osx```
For Windows: ```scons platform=windows```

*Dependencies*
Finally copy the relevant dynammic libraries from the `OpenHMD` folder into `demo/addons/godot-openhmd/bin/<platform>`

License
-------
The source code for the module is released under MIT license (see license file).
Note that the related products used, hidapi, libusb, openhmd and Godot itself all have their own licenses.

About this repository
---------------------
This repository was created by and is maintained by Bastiaan Olij a.k.a. Mux213

You can follow me on twitter for regular updates here:
https://twitter.com/mux213

Videos about my work with Godot including tutorials on working with VR in Godot can by found on my youtube page:
https://www.youtube.com/channel/UCrbLJYzJjDf2p-vJC011lYw



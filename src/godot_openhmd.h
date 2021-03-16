////////////////////////////////////////////////////////////////////////////
// Oculus GDNative module for Godot
//
// Written by Bastiaan "Mux213" Olij,
// with loads of help from Thomas "Karroffel" Herzog

#ifndef GODOT_OCULUS_H
#define GODOT_OCULUS_H

#include "ARVRInterface.h"
#include "GodotCalls.h"
#include "openhmd_config.h"
#include "openhmd_data.h"
#include <openhmd.h>

// declare our public functions for our ARVR Interface

void GDN_EXPORT godot_oculus_gdnative_singleton();
void GDN_EXPORT godot_oculus_nativescript_init(void *p_handle);

#endif /* !GODOT_OCULUS_H */

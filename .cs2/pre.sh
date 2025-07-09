#!/bin/bash
export AMD_TEX_ANISO="0"
export ENABLE_VKBASALT="1"
export MANGOHUD="1"
export PULSE_LATENCY_MSEC="10"
export PIPEWIRE_LATENCY="25/44100"
export PIPEWIRE_QUANTUM="25/44100"
export RADV_TEX_ANISO="0"
export VKBASALT_LOG_LEVEL="none"
export RADV_FORCE_VRS=1x1
export RADV_PERFTEST=nggc,sam,gpl

export ENABLE_VK_LAYER_TORKEL104_libstrangle="0"
export STRANGLE_AF="1"
export STRANGLE_BICUBIC="1"
export STRANGLE_PICMIP="1337"
export STRANGLE_RETRO="1"
export STRANGLE_TRILINEAR="1"

#pw-metadata -n settings 0 clock.force-rate 44100
#pw-metadata -n settings 0 clock.force-quantum 63

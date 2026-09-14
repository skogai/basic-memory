---
title: jbl-headphones
type: note
permalink: skogai/todo/system/jbl-headphones
---

# JBL Quantum350 Wireless Headphones Configuration

## Problem Description

JBL Quantum350 Wireless headphones connected via USB dongle were causing sound issues:

- No sound output after switching from PipeWire to PulseAudio
- Headphones would crash the system after periods of silence
- Audio cutting out during simultaneous mic/speaker usage

## Hardware Identification

```bash
Bus 001 Device 005: ID 0ecb:206b JBL JBL Quantum350 Wireless
```

## Solution Applied

### 1. Resolved PipeWire/PulseAudio conflict

The system had both PulseAudio and PipeWire running simultaneously, causing conflicts.

```bash
# Stopped and disabled conflicting services
systemctl --user stop pulseaudio pipewire
systemctl --user stop pulseaudio.socket pipewire.socket
systemctl --user disable pipewire pipewire.socket
```

### 2. Properly enabled PulseAudio

```bash
systemctl --user enable --now pulseaudio pulseaudio.socket
```

### 3. Manually loaded ALSA sink module

After checking that the hardware was detected by ALSA but not by PulseAudio:

```bash
pacmd load-module module-alsa-sink
```

This successfully created an audio device recognized by PulseAudio.

### 4. Created custom PulseAudio configuration

Created a configuration file at `~/.config/pulse/default.pa` with the following contents:

```
.include /etc/pulse/default.pa

# Load the ALSA modules for better USB headphone support
load-module module-alsa-sink
load-module module-alsa-source

# Automatically switch to newly-connected devices
load-module module-switch-on-connect

# Disable module-suspend-on-idle as it can cause issues with some USB headphones
unload-module module-suspend-on-idle

# Use higher quality resampling
load-module module-filter-heuristics
load-module module-filter-apply
```

The key changes were:

- Adding `module-alsa-sink` to ensure USB headphones are detected
- Disabling `module-suspend-on-idle` to prevent crashes from power-saving features
- Adding `module-switch-on-connect` for better device switching

### 5. Restarted PulseAudio to apply changes

```bash
systemctl --user restart pulseaudio
```

## Current Status

The headphones are now working with the following configuration:

```
Sink #1
  Name: alsa_output.default
  Description: JBL Quantum350 Wireless
  Driver: module-alsa-sink.c
  State: RUNNING
```

## Remaining Concerns

1. USB power management may still cause issues with the headphones
1. Mic/audio simultaneous usage might still experience cutouts
1. Long-term stability needs monitoring

## Future Improvements

Consider:

1. Creating a udev rule to disable USB autosuspend for the headphones (not yet implemented)
1. Adjusting USB power settings if issues persist
1. Fine-tuning buffer sizes if audio dropouts occur during use

## Related Hardware Info

```
card 0: Wireless [JBL Quantum350 Wireless], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

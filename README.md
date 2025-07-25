# VGA Controller


***


## Table of Contents

- [Introduction](#introduction)  
- [Design Overview](#design-overview)  
- [Module Examples](#module-examples)  
  - [Horizontal Counter](#horizontal-counter)  
  - [Vertical Counter](#vertical-counter)  
  - [VGA Controller](#vga-controller)  
- [Usage](#usage)  
- [Simulation](#simulation)  
- [Directory Structure](#directory-structure)  
- [License](#license)  

---

## Introduction

This repository implements a standard 640×480 VGA controller using Verilog. It produces the HSYNC and VSYNC timing signals and RGB output for a VGA display.

## Design Overview

The design is composed of three main modules:  
1. Horizontal Counter  
2. Vertical Counter  
3. VGA Controller  
![Diagram 1](https://i.ibb.co/Tx1gjVXy/68747470733a2f2f692e6962622e636f2f54316d623262512f53637265656e73686f742d323032332d30392d31322d303332.png)
## Modules

### Horizontal Counter

Description: Tracks the pixel position across each scan line and generates the HSYNC pulse.

### Vertical Counter

Description: Tracks the current scan line number and generates the VSYNC pulse.

### VGA Controller
  
Description: Integrates the horizontal and vertical counters with a frame buffer to output RGB, HSYNC, and VSYNC signals.

## Usage

1. Copy the Verilog source files into your FPGA project.  
2. Set your clock to 25 MHz (for 640×480@60 Hz).  
3. Connect `hsync`, `vsync`, and `rgb` outputs to your VGA connector.

## VGA Standard

The VGA standard specifies various parameters that define how video signals are generated and displayed. These parameters include:

Resolution: VGA typically supports resolutions like 640x480 pixels, 800x600 pixels, and 1024x768 pixels. Refresh Rate: Common refresh rates are 60Hz, 72Hz, and 75Hz. Color Depth: VGA supports 256 colors from a palette of 262,144 (18-bit color depth). Sync Signals: VGA uses horizontal and vertical synchronization signals, HSYNC and VSYNC, to define the timing of each frame. These standard specifications are essential for ensuring compatibility with VGA monitors.  
![Diagram 2](https://i.ibb.co/qYvr3mjv/68747470733a2f2f692e6962622e636f2f474378705833622f53637265656e73686f742d323032332d30392d31322d303332.png)


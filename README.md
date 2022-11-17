# Assembly Workshop

[![CI](https://github.com/TheRealJokerMan/asm-workshop/actions/workflows/CI.yml/badge.svg)](https://github.com/TheRealJokerMan/asm-workshop/actions/workflows/CI.yml)

This repository is effectively a playground for working with [Assembly langauge](https://en.wikipedia.org/wiki/Assembly_language).

There is a plethora of assemblers available, but the code in this repository uses [Netwide Assembler (NASM)](https://www.nasm.us/). Although I was a VU programmer at Sony for quite some time, its been _many_ years since I hand-rolled Assembly, thus, much of the Assembly code here, is based on Ray Toal's [tutorials](https://cs.lmu.edu/~ray/notes/nasmtutorial/).

All projects in the workshop, build via [CMake](https://cmake.org/) on:
 - Windows 10 (and later)
 - macOS Monterey (and later)
 - Ubuntu 20.02 (and later).

## Samples

There is a small number of subdirectories.

### asm-lib

`asm-lib` is an example library that offers a small number of functions. Each function is written in Assembly and has a corresponding C header file. There is a C++ wrapper for the C declarations.

### tests

`tests` are C++ unit tests, written in [Catch2](https://github.com/catchorg/Catch2)'s [BDD](https://github.com/catchorg/Catch2/blob/devel/docs/tutorial.md#bdd-style-testing) style, that consume `asm-lib` via the C++ wrapper.

### win32

`win32` is an example of how a function of the Win32 API can be called from Assembly.

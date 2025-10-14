# openGrid Rebuilt in OpenSCAD

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

An OpenSCAD implementation of the [openGrid](https://www.opengrid.world/) modular storage system. Based on the gridfinity-rebuilt-openscad project, this version is adapted for the 28mm openGrid specification.

openGrid is built around a 28mm grid size, providing a flexible wall and desk mounting framework with modular storage capabilities. This implementation maintains compatibility with the openGrid ecosystem while offering parametric customization through OpenSCAD.

[<img src="./images/base_dimension.gif" width="320">]()
[<img src="./images/compartment_dimension.gif" width="320">]()
[<img src="./images/height_dimension.gif" width="320">]()
[<img src="./images/tab_dimension.gif" width="320">]()
[<img src="./images/holes_dimension.gif" width="320">]()
[<img src="./images/custom_dimension.gif" width="320">]()

## Features
- any size of bin (width/length/height)
- height by units, internal depth, or overall size
- any number of compartments (along both X and Y axis)
- togglable scoop
- togglable tabs, split tabs, and tab alignment
- togglable holes (with togglable supportless printing hole structures)
- manual compartment construction (make the most wacky bins imaginable)
- togglable lip (if you don't care for stackability)
- dividing bases (if you want a 1.5 unit long bin, for instance)
- removed material from bases to save filament
- vase mode bins

### Printable Holes
The printable holes allow your slicer to bridge the gap inside the countersunk magnet hole (using the technique shown [here](https://www.youtube.com/watch?v=W8FbHTcB05w)) so that supports are not needed.

[<img src="./images/slicer_holes.png" height="200">]()
[<img src="./images/slicer_holes_top.png" height="200">]()

## Recommendations
For best results, use a [development snapshots](https://openscad.org/downloads.html#snapshots) version of OpenSCAD. This can speed up rendering from 10 minutes down to a couple of seconds, even for comically large bins. It is not a requirement to use development versions of OpenSCAD.

## External libraries

- `threads-scad` (https://github.com/rcolyer/threads-scad) is used for creating threaded holes, and is included in this project under `external/threads-scad/threads.scad`.

## Enjoy!

[<img src="./images/spin.gif" width="160">]()

## Acknowledgments

This project is based on [gridfinity-rebuilt-openscad](https://github.com/kennetek/gridfinity-rebuilt-openscad) and adapted for the [openGrid](https://www.opengrid.world/) specification (28mm grid).

Original Gridfinity concept by [Zack Freedman](https://www.youtube.com/c/ZackFreedman/about).

This work is licensed under the
[MIT License](https://opensource.org/licenses/MIT).

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

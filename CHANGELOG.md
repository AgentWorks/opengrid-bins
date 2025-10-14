# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- CLAUDE.md development guide with Conventional Commits and Keep a Changelog standards
- Note about using external openGrid Tile Generator for baseplates
- openGrid snap-based attachment system (rectangular cutouts)
- New snap constants: SNAP_THICKNESS, SNAP_WIDTH, SNAP_LENGTH, etc.
- bundle_snap_options() for snap configuration
- Legacy compatibility layer for old magnet/screw hole API

### Changed
- Grid dimensions from 42mm (Gridfinity) to 28mm (openGrid)
- Base dimensions from 41.5mm to 27.5mm
- Tab width from 42mm to 28mm
- Project name from "Gridfinity Rebuilt" to "openGrid Bins"
- Author to David Braun (2025)
- **Attachment mechanism from magnets to snaps** - openGrid uses snap cutouts instead of magnet holes
- Renamed opengrid-holes.scad to opengrid-snaps.scad
- Replaced circular magnet/screw holes with rectangular snap cutouts
- Test files updated to test snap cutouts

### Removed
- Baseplate generator (use [openGrid Tile Generator](https://makerworld.com/en/models/1304337-opengrid-tile-generator) instead)
- "rebuilt" terminology from all file names and documentation
- Magnet-specific constants (MAGNET_HEIGHT, MAGNET_HOLE_RADIUS, etc.)
- Screw hole constants and functions
- Refined hole mechanism
- Crush rib functionality (magnet-specific)

[Unreleased]: https://github.com/yourusername/opengrid-openscad/compare/v0.0.0...HEAD

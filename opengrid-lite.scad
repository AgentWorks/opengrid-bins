// ===== INFORMATION ===== //
/*
 IMPORTANT: rendering will be better in development builds and not the official release of OpenSCAD, but it makes rendering only take a couple seconds, even for comically large bins.

https://github.com/kennetek/gridfinity-rebuilt-openscad (original Gridfinity project)

*/

include <src/core/standard.scad>
use <src/core/opengrid-utility.scad>
use <src/core/opengrid-snaps.scad>
use <src/core/bin.scad>
use <src/core/cutouts.scad>

// ===== PARAMETERS ===== //

/* [Setup Parameters] */
$fa = 8;
$fs = 0.25;

/* [General Settings] */
// number of bases along x-axis
gridx = 3;
// number of bases along y-axis
gridy = 3;
// bin height. See bin height information and "gridz_define" below.
gridz = 6;
// Half grid sized bins.  Implies "only corners".
half_grid = false;

/* [Compartments] */
// number of X Divisions
divx = 2;
// number of y Divisions
divy = 2;

/* [Toggles] */
// snap gridz height to nearest 7mm increment
enable_zsnap = false;
// how should the top lip act
style_lip = 0; //[0: Regular lip, 1:remove lip subtractively, 2: remove lip and retain height]

/* [Other] */
// How "gridz" is used to calculate height.  Some exclude 7mm/1U base, others exclude ~3.5mm (4.4mm nominal) stacking lip.
gridz_define = 0; // [0:7mm increments - Excludes Stacking Lip, 1:Internal mm - Excludes Base & Stacking Lip, 2:External mm - Excludes Stacking Lip, 3:External mm]
// the type of tabs
style_tab = 1; //[0:Full,1:Auto,2:Left,3:Center,4:Right,5:None]
// which divisions have tabs
place_tab = 1; // [0:Everywhere-Normal,1:Top-Left Division]

/* [Base] */
// thickness of bottom layer
bottom_layer = 1;

/* [Base Snap Options] */
// only cut snap cutouts at the corners of the bin to save unnecessary print time
only_corners = false;
// Base will have rectangular cutouts for openGrid snap attachment
snap_cutouts = false;
// Snap cutouts will have a chamfer to ease insertion
chamfer_snaps = true;

snap_options = bundle_snap_options(snap_cutouts, chamfer_snaps);

// ===== IMPLEMENTATION ===== //

binL = new_bin(
    grid_size = [gridx, gridy],
    height_mm = height(gridz, gridz_define, enable_zsnap),
    include_lip = style_lip == 0,
    hole_options = snap_options,
    only_corners = only_corners || half_grid,
    grid_dimensions = GRID_DIMENSIONS_MM / (half_grid ? 2 : 1),
    base_thickness = bottom_layer
);

bin_render(binL){
    bin_subdivide(binL, [divx, divy]) {
        cut_compartment_auto(
            cgs(),
            style_tab,
            place_tab != 0
        );
    }
}

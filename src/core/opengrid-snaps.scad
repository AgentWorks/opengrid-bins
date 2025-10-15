/**
 * @file opengrid-snaps.scad
 * @brief Functions to create openGrid snap cutouts for board attachment.
 * @details openGrid uses snap-based attachment instead of magnets.
 */

include <standard.scad>
use <../helpers/generic-helpers.scad>
use <../helpers/shapes.scad>

/**
 * @brief Create an options list used to configure bin snaps.
 * @param snap_cutout Create rectangular cutout for openGrid snap attachment.
 * @param chamfer Add a chamfer to the snap cutout edges.
 */
function bundle_snap_options(snap_cutout=false, chamfer=false) =
    assert(is_bool(snap_cutout))
    assert(is_bool(chamfer))
    [
        "snap_options_struct",
        snap_cutout,
        chamfer
    ];

/**
 * @brief If the object is a "snap_options".
 * @param snap_options The object to check.
 */
function is_snap_options(snap_options) =
    is_list(snap_options)
    && len(snap_options) == 3
    && snap_options[0] == "snap_options_struct";

/**
 * @brief Create a chamfered rectangular cutout.
 * @param width Width of the rectangle.
 * @param length Length of the rectangle.
 * @param height Height/depth of the cutout.
 * @param chamfer_size Size of the chamfer.
 */
module chamfered_rect_cutout(width, length, height, chamfer_size=0) {
    assert(width > 0, "width must be positive");
    assert(length > 0, "length must be positive");
    assert(height > 0, "height must be positive");

    if (chamfer_size > 0) {
        hull() {
            translate([0, 0, chamfer_size])
            cube([width, length, height - chamfer_size], center=true);

            cube([width - 2*chamfer_size, length - 2*chamfer_size, height], center=true);
        }
    } else {
        cube([width, length, height], center=true);
    }
}

/**
 * @brief A single snap cutout to be cut out of the base.
 * @details Creates a rectangular cutout for openGrid snap attachment.
 * @param snap_options @see bundle_snap_options
 * @param o offset Grows or shrinks the final shapes (in mm).
 */
module block_base_snap(snap_options, o=0) {
    assert(is_snap_options(snap_options));
    assert(is_num(o));

    // Destructure the options
    snap_cutout = snap_options[1];
    chamfer = snap_options[2];

    if (snap_cutout) {
        chamfer_size = chamfer ? CHAMFER_ADDITIONAL_SIZE : 0;

        translate([0, 0, SNAP_HOLE_DEPTH/2])
        chamfered_rect_cutout(
            SNAP_HOLE_WIDTH + o,
            SNAP_HOLE_LENGTH + o,
            SNAP_HOLE_DEPTH + TOLLERANCE,
            chamfer_size
        );
    }
}

// Test module - commented out
// block_base_snap(bundle_snap_options(snap_cutout=true, chamfer=true));

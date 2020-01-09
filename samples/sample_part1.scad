/* sample_part1.scad
 *
 * This is a sample to illustrate the use of the
 * dimlines.scad program for creating dimension lines in OpenSCAD.
 *
 * Upon runing this program, select ctrl-4 (top view) to see the dimensioning.
 *
 * More on this can be found at http://CannyMachines.com
 * created by Don Smiley
 */

include <dimlines.scad>

//  Sample part -- constants used
PART_LENGTH = 3.53;
PART_WIDTH = PART_LENGTH / 2;
PART_HEIGHT = .15;
HOLE_Y1_OFFSET = 1;
HOLE_Y2_OFFSET = 1.25;

HOLE1_RADIUS = .25;
HOLE2_RADIUS = .175;
HOLE1_XOFFSET = .65;
HOLE2_XOFFSET = 1.35;
HOLE3_XOFFSET = 2.25;
HOLE4_XOFFSET = 2.75;

// rotations used for dimensioning
ROTATION2 = [90, 0, 0];
ROTATION3 = [0, 90, 90];
ROTATION4 = [135, 45, 0];

ROT2_VIEW = [0, -2.5, 0];
ROT3_VIEW = [9, -2, 0];
ROT4_VIEW = [7, 2, 0];

DOC_HEIGHT = 2;

module sample_part() {

    difference() {

        union() {
            cube([PART_LENGTH, PART_WIDTH, PART_HEIGHT], center=false);
            translate([PART_LENGTH / 2, 0, -PART_HEIGHT])
            cube([PART_LENGTH / 2, PART_WIDTH, PART_HEIGHT], center=false);
        }

        translate([HOLE1_XOFFSET, HOLE_Y1_OFFSET, -OFFSET / 2])
        cylinder(h=PART_HEIGHT + OFFSET, r=HOLE1_RADIUS, center=false, $fn=100);

        translate([HOLE2_XOFFSET, HOLE_Y1_OFFSET, -OFFSET / 2])
        cylinder(h=PART_HEIGHT + OFFSET, r=HOLE1_RADIUS, center=false, $fn=100);

        translate([HOLE3_XOFFSET, HOLE_Y2_OFFSET, -PART_HEIGHT - OFFSET / 2])
        cylinder(h=(PART_HEIGHT  + OFFSET) * 2, r=HOLE2_RADIUS, center=false,
            $fn=100);

        translate([HOLE4_XOFFSET, HOLE_Y2_OFFSET, -PART_HEIGHT - OFFSET / 2])
        cylinder(h=(PART_HEIGHT  + OFFSET) * 2, r=HOLE2_RADIUS, center=false,
            $fn=100);

    }
}


module show_samplepart() {

    sample_part();

    // upper (actually x) dimensions
    color("Black")
    translate([0, 0, DOC_HEIGHT])
    union() {
        translate([0, PART_WIDTH + DIM_SPACE * 3, 0])
        dimensions(HOLE1_XOFFSET, DIM_LINE_WIDTH, loc=DIM_OUTSIDE);

        translate([0, PART_WIDTH + DIM_SPACE * 6, 0])
        dimensions(HOLE2_XOFFSET, DIM_LINE_WIDTH);

        translate([0, PART_WIDTH + DIM_SPACE * 9, 0])
        dimensions(HOLE3_XOFFSET, DIM_LINE_WIDTH);

        translate([0, PART_WIDTH + DIM_SPACE * 12, 0])
        dimensions(HOLE4_XOFFSET, DIM_LINE_WIDTH);

        translate([0, PART_WIDTH + DIM_SPACE * 15, 0])
        dimensions(PART_LENGTH, DIM_LINE_WIDTH);

        // extension lines
        rotate([0, 0, 90])
        union() {
            translate([PART_WIDTH + DIM_SPACE, 0, 0])
            line(length=DIM_SPACE * 17, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);

            translate([PART_WIDTH + DIM_SPACE, -PART_LENGTH, 0])
            line(length=DIM_SPACE * 17, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);

            // extension lines for holes
            translate([PART_WIDTH - .4, -HOLE1_XOFFSET, 0])
            line(length=PART_WIDTH - HOLE_Y1_OFFSET, width=DIM_LINE_WIDTH,
                height=.01, left_arrow=false, right_arrow=false);

            translate([PART_WIDTH - .4, -HOLE2_XOFFSET, 0])
            line(length=PART_WIDTH - HOLE_Y1_OFFSET + DIM_SPACE * 3,
                width=DIM_LINE_WIDTH, height=.01, left_arrow=false,
                right_arrow=false);

            translate([PART_WIDTH - .2, -HOLE3_XOFFSET, 0])
            line(length=PART_WIDTH - HOLE_Y2_OFFSET + DIM_SPACE * 7,
                width=DIM_LINE_WIDTH, height=.01, left_arrow=false,
                right_arrow=false);

            translate([PART_WIDTH - .2, -HOLE4_XOFFSET, 0])
            line(length=PART_WIDTH - HOLE_Y2_OFFSET + DIM_SPACE * 10,
                width=DIM_LINE_WIDTH, height=.01, left_arrow=false,
                right_arrow=false);}
        }


    // right side
    color("Black")
    translate([0, 0, DOC_HEIGHT])
    rotate([0, 0, -90])
    union() {

        translate([-HOLE_Y1_OFFSET, PART_LENGTH + DIM_SPACE * 3, DIM_HEIGHT])
        dimensions(HOLE_Y1_OFFSET, DIM_LINE_WIDTH);

        translate([-HOLE_Y2_OFFSET, PART_LENGTH + DIM_SPACE * 6, DIM_HEIGHT])
        dimensions(HOLE_Y2_OFFSET, DIM_LINE_WIDTH);

        translate([-PART_WIDTH, PART_LENGTH + DIM_SPACE * 9, DIM_HEIGHT])
        dimensions(PART_WIDTH, DIM_LINE_WIDTH);
    }

    // extension lines
    color("Black")
    translate([0, 0, DOC_HEIGHT])
    union() {
        translate([PART_LENGTH + DIM_SPACE , PART_WIDTH, DIM_HEIGHT])
        line(length=1, width=DIM_LINE_WIDTH, height=.01,
            left_arrow=false, right_arrow=false);

        translate([PART_LENGTH - DIM_SPACE * 4, HOLE_Y1_OFFSET, DIM_HEIGHT])
        line(length=DIM_SPACE * 8, width=DIM_LINE_WIDTH, height=.01,
            left_arrow=false, right_arrow=false);

        translate([PART_LENGTH - DIM_SPACE * 4, HOLE_Y2_OFFSET, DIM_HEIGHT])
        line(length=DIM_SPACE * 11, width=DIM_LINE_WIDTH, height=.01,
            left_arrow=false, right_arrow=false);

        translate([PART_LENGTH + DIM_SPACE, 0, DIM_HEIGHT])
        line(length=1, width=DIM_LINE_WIDTH, height=.01,
            left_arrow=false, right_arrow=false);

    }

    color(GREY)
    translate([0, 0, DOC_HEIGHT])
    union() {
        translate([HOLE1_XOFFSET, HOLE_Y1_OFFSET, DIM_HEIGHT])
        circle_center(HOLE1_RADIUS, DIM_HOLE_CENTER, DIM_LINE_WIDTH);

        translate([HOLE2_XOFFSET, HOLE_Y1_OFFSET, DIM_HEIGHT])
        circle_center(HOLE1_RADIUS, DIM_HOLE_CENTER, DIM_LINE_WIDTH);

        translate([HOLE3_XOFFSET, HOLE_Y2_OFFSET, DIM_HEIGHT])
        circle_center(HOLE2_RADIUS, DIM_HOLE_CENTER, DIM_LINE_WIDTH);

        translate([HOLE4_XOFFSET, HOLE_Y2_OFFSET, DIM_HEIGHT])
        circle_center(HOLE2_RADIUS, DIM_HOLE_CENTER, DIM_LINE_WIDTH);

    }

    // leader line for holes
    leader1_text = str("2X 0 ", HOLE1_RADIUS * 2);
    leader2_text = str("2X 0 ", HOLE2_RADIUS * 2);
    color("Black")
    translate([0, 0, DOC_HEIGHT])
    union() {
        translate([HOLE1_XOFFSET, HOLE_Y1_OFFSET, DIM_HEIGHT])
        leader_line(angle=-70, radius=HOLE1_RADIUS, angle_length=DIM_SPACE * 12,
            horz_line_length=.25, line_width=DIM_LINE_WIDTH, text=leader1_text);

        translate([HOLE3_XOFFSET, HOLE_Y2_OFFSET, DIM_HEIGHT])
        leader_line(angle=-70, radius=HOLE2_RADIUS,
                    angle_length=DIM_SPACE * 15.5, horz_line_length=.25,
                    line_width=DIM_LINE_WIDTH, text=leader2_text);

    }
    // end of initial dimension lines

    // rotate 90 degrees around the y axis
    translate(ROT2_VIEW)
    rotate(ROTATION2)
    sample_part();

    // dimension lines on the TOP
    color("Black")
    translate(ROT2_VIEW)
    translate([0, 0, DOC_HEIGHT])
    union() {
        translate([0, PART_HEIGHT + DIM_SPACE * 3, DIM_HEIGHT])
        dimensions(PART_LENGTH / 2, DIM_LINE_WIDTH, loc=DIM_CENTER);

        translate([0, PART_HEIGHT + DIM_SPACE * 6, DIM_HEIGHT])
        dimensions(PART_LENGTH, DIM_LINE_WIDTH);


        // extension lines
        rotate([0, 0, 90])
        union() {
            translate([PART_HEIGHT + DIM_SPACE, 0, DIM_HEIGHT])
            line(length=DIM_SPACE * 6, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);

            translate([PART_HEIGHT + DIM_SPACE, -PART_LENGTH / 2, DIM_HEIGHT])
            line(length=DIM_SPACE * 3, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);

            translate([PART_HEIGHT + DIM_SPACE, -PART_LENGTH, DIM_HEIGHT])
            line(length=DIM_SPACE * 6, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);

        }

        // right side
        color("Black")
        rotate([0, 0, -90])
        union() {

            translate([-PART_HEIGHT * 2, PART_LENGTH + DIM_SPACE * 3,
                DIM_HEIGHT])
            line(length=DIM_SPACE * 3, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=true);

            translate([PART_HEIGHT, PART_LENGTH + DIM_SPACE * 3, DIM_HEIGHT])
            leader_line(angle=0, radius=0, angle_length=-DIM_SPACE,
                horz_line_length=.25, line_width=DIM_LINE_WIDTH,
                text=str(PART_HEIGHT));

            translate([-PART_HEIGHT, PART_LENGTH + DIM_SPACE * 6, DIM_HEIGHT])
            line(length=PART_HEIGHT * 2, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=true, right_arrow=true);

            // leader line for dimension
            translate([PART_HEIGHT, PART_LENGTH + DIM_SPACE * 6, DIM_HEIGHT])
            leader_line(angle=0, radius=0, angle_length=-DIM_SPACE,
                horz_line_length=.25, line_width=DIM_LINE_WIDTH,
                text=str(PART_HEIGHT * 2));
        }

        // extension lines
        color("Black")
        union() {
            translate([PART_LENGTH + DIM_SPACE, PART_HEIGHT, DIM_HEIGHT])
            line(length=DIM_SPACE * 6, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);

            translate([PART_LENGTH + DIM_SPACE, 0, DIM_HEIGHT])
            line(length=DIM_SPACE * 3, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);


            translate([PART_LENGTH + DIM_SPACE, -PART_HEIGHT, DIM_HEIGHT])
            line(length=DIM_SPACE * 6, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=false);
        }
    }


    translate(ROT3_VIEW)
    rotate(ROTATION3)
    sample_part();

    color("Black")
    translate(ROT3_VIEW)
    translate([0, 0, DOC_HEIGHT])
    union() {

        translate([-PART_WIDTH, PART_HEIGHT + DIM_SPACE * 3, DIM_HEIGHT])
        dimensions(PART_WIDTH, DIM_LINE_WIDTH, loc=DIM_CENTER);


        // extension lines
        rotate([0, 0, 90])
        union() {
            translate([PART_HEIGHT + DIM_SPACE, PART_WIDTH, DIM_HEIGHT])
            line(length=DIM_SPACE * 4);

            translate([PART_HEIGHT + DIM_SPACE, 0, DIM_HEIGHT])
            line(length=DIM_SPACE * 4);
        }


       // right side
        color("Black")
        rotate([0, 0, -90])
        union() {

            translate([-PART_HEIGHT * 2, DIM_SPACE * 3, DIM_HEIGHT])
            line(length=DIM_SPACE * 3, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=false, right_arrow=true);

            translate([PART_HEIGHT, DIM_SPACE * 3, DIM_HEIGHT])
            leader_line(angle=0, radius=0, angle_length=-DIM_SPACE,
                horz_line_length=.25, line_width=DIM_LINE_WIDTH,
                text=str(PART_HEIGHT));

            translate([-PART_HEIGHT, DIM_SPACE * 6, DIM_HEIGHT])
            line(length=PART_HEIGHT * 2, width=DIM_LINE_WIDTH, height=.01,
                left_arrow=true, right_arrow=true);

            // leader line for dimension
            translate([PART_HEIGHT, DIM_SPACE * 6, DIM_HEIGHT])
            leader_line(angle=0, radius=0, angle_length=-DIM_SPACE,
                horz_line_length=.25, line_width=DIM_LINE_WIDTH,
                text=str(PART_HEIGHT * 2));
        }

        // extension lines
        color("Black")
        union() {
            translate([DIM_SPACE, PART_HEIGHT, DIM_HEIGHT])
            line(length=DIM_SPACE * 6);

            translate([DIM_SPACE, 0, DIM_HEIGHT])
            line(length=DIM_SPACE * 3);


            translate([DIM_SPACE, -PART_HEIGHT, DIM_HEIGHT])
            line(length=DIM_SPACE * 6);

        }

    }


    translate(ROT4_VIEW)
    rotate(ROTATION4)
    sample_part();

}


module draw_frame(length, height, line_width=DIM_LINE_WIDTH) {

    line(length=length, width=line_width);

    translate([0, height, 0])
    line(length=length, width=line_width);

    translate([line_width / 2, line_width / 2, 0])
    rotate([0, 0, 90])
    line(length=height - line_width, width=line_width);

    translate([length - line_width / 2, line_width / 2, 0])
    rotate([0, 0, 90])
    line(length=height - line_width, width=line_width);

}

show_samplepart();
color("Black")
translate([-3, -7.0, DOC_HEIGHT])
color("Black")
union() {
    draw_frame(length=17, height=11, line_width=DIM_LINE_WIDTH * 2);

    color("Black")
    translate([10.22, 3.5, 0])
    sample_titleblock2();
}

$fn=120;

height=3.9;
innerDia=4.1;
outerDia=innerDia + 2 * 1.1;

difference() {
    union() {
        difference() {
            translate([-5.5, -0.75,0]) cube([42,31 + 1.5, height - 2.6]);
            translate([-4.0, 0.75,0]) cube([39,31 - 1.5, height - 2.6]);
            translate([0.0, 0.75,0]) cube([31,34, height - 2.6]);
        }
        translate([0,0,0]) cylinder(d=outerDia, h=height);
        translate([31,0,0]) cylinder(d=outerDia, h=height);
        translate([0,31,0]) cylinder(d=outerDia, h=height);
        translate([31,31,0]) cylinder(d=outerDia, h=height);
    }
    translate([0,0,0]) cylinder(d=innerDia, h=height);
    translate([31,0,0]) cylinder(d=innerDia, h=height);
    translate([0,31,0]) cylinder(d=innerDia, h=height);
    translate([31,31,0]) cylinder(d=innerDia, h=height);
}
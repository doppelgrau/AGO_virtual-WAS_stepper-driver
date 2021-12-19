$fn=120;

height=4.1;
innerDia=4.1;
outerDia=innerDia + 2 * 1.1;

difference() {
    union() {
        difference() {
            translate([-4.5, -0.75,0]) cube([40,31 + 1.5, height - 2.6]);
            translate([-3.0, 0.75,0]) cube([38,31 - 1.5, height - 2.6]);
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
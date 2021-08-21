height = 16.3;
topThickness = 3;

module screwHole(center=[0,0,0], wall=1.2) {
    bottomClearance = 0.0;
    $fn=90;
    translate(center) translate([0,0,bottomClearance]) {
        difference() {
            cylinder(h=height - bottomClearance, d=5.6 + 2*wall);
            translate([0,0,-0.1]) cylinder(h=height + 0.1, d= 3.5);
            translate([0,0,0.6]) cylinder(h=0.6, d1=3.5, d2=5.6); 
            translate([0,0,1.2]) cylinder(h=height, d=5.5); 
        }
    }
}


//translate([50.95,0.1,-1.6]) color("red") import("PCB.stl");

module top() {
    difference() {
        translate([0,0,height - topThickness + 0.75]) minkowski() {
            union() {
                translate([51-47.4,0,0]) cube([47.4,42,1.5]);
                translate([0,3.5,0]) cube([47.4,35,1.5]);
                intersection() {
                    union() {
                        translate([5.4,5.4,0]) cylinder(h=2.5, r=5.8, $fn=60);
                        translate([5.4,42-5.4,0]) cylinder(h=2.5, r=5.8, $fn=60);
                    }
                    cube([47.4,42,1.5]);
                }
            }
            sphere(d=1.5, $fn=90);
        }
        // holes
        translate([36.1,12.80,0.1]) cube([12.3,16.3, 18]); // ethernet
        translate([7.9,16,0.1]) cylinder(d=2.5, h=18, $fn=30); // reset  button    
        translate([5.5,5.5,0.1]) cylinder(d=6, h=18, $fn=30); // mounting holes
        translate([5.5,42-5.5,0.1]) cylinder(d=6, h=18, $fn=30); // mounting holes
        translate([42-5.5,5.5,0.1]) cylinder(d=6, h=18, $fn=30); // mounting holes
        translate([42-5.5,42-5.5,0.1]) cylinder(d=6, h=18, $fn=30); // mounting holes
        for (x = [10:4.6:30] ) for (y = [9.2-1.5:4.6:33] ) translate([x,y, height - topThickness -0.1]) cube([3,3,10]); 
    }
    screwHole([5.5,5.5,0.0]);
    screwHole([5.5,42-5.5,0.0]);
    screwHole([42-5.5,5.5,0.0], wall=0.8);
    screwHole([42-5.5,42-5.5,0.0], wall=0.8);
    
    // for the foot switch
    translate([21.5,42-8.3,11.3]) intersection() {cube([8,8.5,height - 11.2]);translate([0.5,-0.5,-0.5]) minkowski() {cube([7, 8, height - 11.3 - 1]); sphere(d=1, $fn=30);}}
    
    // a bit protection for the capacitors
    translate([52-6,0,4]) difference() {
        minkowski() {cube([5, 4, height - 4-1]); sphere(d=1.5, $fn=30);}
        translate([-0.5,6,-1]) cylinder(d=11, h=8.5);
    }
    translate([52-6,42-4,4]) difference() {
        minkowski() {cube([5, 4, height - 4-1]); sphere(d=1.5, $fn=30);}
        translate([-0.5,-2,-1]) cylinder(d=11, h=8.5);
    }
    translate([0,22.5,4]) difference() {
        minkowski() {cube([4, 8, height - 4-1]); sphere(d=1.5, $fn=30);}
        translate([6,3.75,-1]) cylinder(d=11, h=8.5);
    }

}
top();

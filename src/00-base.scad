use <../libs/mcad/boxes.scad>

// All dimensions in mm
x = 270;
y = 150;
z = 5;
corner_radius = 5;
hole_offset = 20;
hole_diameter = 10;

difference() {
	// create the base
	translate([x/2,y/2,z/2]){
	  roundedBox([x, y, z], corner_radius, true);
	}
    
	// Create a hole
	for (i=[ [hole_offset,hole_offset,-10],
		[hole_offset,y-hole_offset,-10],
		[x-hole_offset,hole_offset,-10],
		[x-hole_offset,y-hole_offset,-10] ])
	{
		translate(i) {
			linear_extrude(height=z+10)
			circle(r=(hole_diameter/2));
		}
	}
}

use <../../libs/mcad/boxes.scad>
include <../../libs/variables.scad>

// All dimensions in mm
x = width;
y = depth;
z = material_thickness;

difference() {
	// create the base
	translate([x/2, y/2, z/2]){
	  roundedBox([x, y, z], corner_radius, true);
	}
	// Create 4 holes
	for (i = [ [hole_offset,hole_offset, -10],
		[hole_offset,y-hole_offset, -10],
		[x-hole_offset,hole_offset, -10],
		[x-hole_offset,y-hole_offset, -10] ])
	{
		translate(i) {
			linear_extrude(height = z + 10)
			circle(r=(hole_diameter/2));
		}
	}
}

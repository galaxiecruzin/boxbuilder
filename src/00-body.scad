use <../libs/mcad/boxes.scad>
include <../libs/variables.scad>

// All dimensions in mm
x = width;
y = depth;
z = height;

union(){
	for (i=[ [(hole_offset/2),(hole_offset/2), 0],
			[(hole_offset/2),y-(hole_offset/2), 0],
			[x-(hole_offset/2),(hole_offset/2), 0],
			[x-(hole_offset/2),y-(hole_offset/2), 0] ])
		{
		translate(i){
			linear_extrude(height=z){
				difference(){
					circle(r=(hole_diameter));
					circle(r=(hole_diameter/2));
				}
			}
		}
	}
	difference(){
		translate([x/2, y/2, height/2]){
		  roundedBox([x, y, height], 5, true);
		}
		translate([material_thickness, material_thickness, 0]) {
			linear_extrude(height=z)
			square(size = [x-(material_thickness*2), y-(material_thickness*2)], center = false);
	   	}
	}
}

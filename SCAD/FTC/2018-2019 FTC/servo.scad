//
// Modelcraft RS 2 Servo
//

// Set the length of segments in a cylinder to have a decent resolution
$fs=0.3;

RenderServo();

// A wedge made from a polyhedron
module wedge(width, length, height)
{
	polyhedron(
		points=[ 
			[0, 0, 0], [0, length, 0], [0, length, height],
			[width, 0, 0], [width, length, 0], [width, length, height] 
			],
		triangles= [ 
			[0, 1, 2], 
			[3, 5, 4], 
			[1, 4, 2], 
			[4, 5, 2],
			[0, 3, 4],
			[0, 4, 1],
			[0, 2, 5],
			[0, 5, 3]
			] );
}

// A wedge made from a polyhedron
module wedge2(width1, width2, length, height)
{

}

module body(width1, width2, length, height)
{
	extraWidth = width2 - width1;
	polyhedron(
		points=[ 
			[-extraWidth, 0, 0], [-extraWidth, length, 0], [0, length, height],
			[width2, 0, 0], [width2, length, 0], [width1, length, height],
			[0, 0, height], [width1, 0, height]
			],
		triangles= [ 
			[0, 1, 2], 
			[3, 5, 4], 
			[1, 4, 2], 
			[4, 5, 2],
			[0, 3, 4],
			[0, 4, 1],
			[0, 6, 7],
			[3, 0, 7],
			[0, 2, 6],
			[3, 7, 5],
			[6, 5, 7],
			[6, 2, 5],
			] );}

// A mount point on one side of the servo
module mount()
{
	difference()
	{
		cube([19.5, 8, 2]);
		translate([0, 5, -1]) rotate([0, 0, 45]) cube([19.5, 8, 4]);
		translate([17, 8, -1]) rotate([0, 0, -45]) cube([19.5, 8, 4]);
		translate([4.25, 4.6, -1]) cylinder(r=2.15, h=4);
		translate([15.75, 4.6, -1]) cylinder(r=2.15, h=4);
	}
	translate([9.0, 0, 2]) cube([1.5, 2.5, 0.8]);
	translate([9.0, 2.5, 2.8]) mirror([0, 1, 0]) wedge(1.5, 2.5, 0.2);
	translate([9.0, 3, 2]) mirror([0, 1, 0]) wedge(1.5, 0.5, 0.8);
}


module RenderServo()
{
color("darkslategray")
{

// Left mount
translate([0, 40.3, 26.2]) mount();

// Right mount
translate([0, 0, 26.2]) mirror([0, 1, 0]) mount();

// Main body
//cube([19.5, 40.3, 32.7]);
body(19.5, 20.1, 40.3, 32.7);

// Upper body parts
translate([0, 3, 32.7]) cube([19.5, 36.4, 1]);
translate([0, 6, 33.7]) cube([19.5, 33.3, 3]);

// Wedges in the upper body part
translate([0, 40.3, 32.7]) mirror([0, 1, 0]) wedge(19.5, 1.0, 4);
translate([0, 0, 32.7]) wedge(19.5, 3.0, 1);
translate([0, 3, 33.7]) wedge(19.5, 3.0, 3);

// Ring around shaft
translate([10, 30.3, 36.7]) cylinder(r1=7.15, r2=6.35, h=1);

// Cable outlet
translate([6.7, 40.6, 0.8]) cube([6.7, 2, 3.75]);


}

// Shaft
color("white") translate([10, 30.3, 36.7]) cylinder(r=3, h=5.4);
}
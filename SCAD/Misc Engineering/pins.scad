// increases vertical hole diameters by this much
pinhole_tolerance = 0.2;

pinshaft_diameter = 10; // anything under 6 is too fragile
pinshaft_radius = pinshaft_diameter/2;
pinlip_height = 2;
pinlip_thickness = 2;

pinbase_diameter = pinshaft_diameter*1.5;
pinbase_radius = pinbase_diameter/2;
pinbase_height = 3;

module pinloophole(pinshaft_length) {
  assign(pinloophole_radius=pinshaft_radius+(pinhole_tolerance/2)+0.25) {
    echo("pinloophole_radius: ", pinloophole_radius);
    union() {
      cylinder(h=pinshaft_length, r=pinloophole_radius);
      translate([0, 0, pinshaft_length-pinlip_height]) cylinder(h=pinlip_height, r1=pinloophole_radius, r2=pinloophole_radius+(pinlip_thickness/2)+(pinhole_tolerance/2));
      translate([0, 0, pinshaft_length]) cylinder(h=pinhole_tolerance, r=pinloophole_radius+(pinlip_thickness/2)+(pinhole_tolerance/2));
    }
  }
}

module pinhole(pinshaft_length) {
  assign(pinshafthole_radius=pinshaft_radius+(pinhole_tolerance/2)) {
    echo("pinshafthole_radius: ", pinshafthole_radius);
    union() {
      cylinder(h=pinshaft_length, r=pinshafthole_radius);
      translate([0, 0, pinshaft_length-pinlip_height]) cylinder(h=pinlip_height, r1=pinshafthole_radius, r2=pinshafthole_radius+(pinlip_thickness/2)+(pinhole_tolerance/2));
      translate([0, 0, pinshaft_length]) cylinder(h=pinhole_tolerance, r=pinshafthole_radius+(pinlip_thickness/2)+(pinhole_tolerance/2));
    }
  }
}

module pinshaft(pinshaft_length) {
  difference() {
    union() {
      cylinder(h=pinshaft_length, r=pinshaft_radius);
      translate([0, 0, pinshaft_length-pinlip_height]) cylinder(h=pinlip_height, r1=pinshaft_radius, r2=pinshaft_radius+(pinlip_thickness/2));
    }
    
    translate([-(pinshaft_diameter/4)/2, -(pinshaft_diameter+pinlip_thickness*2)/2, pinshaft_length/4]) cube([pinshaft_diameter/4, pinshaft_diameter+pinlip_thickness*2, pinshaft_length]);
    translate([0, 0, pinshaft_length/4]) rotate([90, 0, 0]) cylinder(h=pinshaft_diameter, r=(pinshaft_diameter/4)/2, center=true);
    
    translate([-pinshaft_diameter, -(pinlip_thickness*2)-pinshaft_radius+pinlip_thickness/2, -1]) cube([pinshaft_diameter*2, pinlip_thickness*2, pinshaft_length+2]);
    translate([-pinshaft_diameter, pinshaft_radius-pinlip_thickness/2, -1]) cube([pinshaft_diameter*2, pinlip_thickness*2, pinshaft_length+2]);
  }
}

module pin(pinshaft_length) {
  union() {
    cylinder(h=pinbase_height, r=pinbase_radius);
    translate([0, 0, pinbase_height]) pinshaft(pinshaft_length);
  }
}


//Extrusion($Type = "Extruded", $Sections = 1);
//Extrusion($Type = "Hollow", $Dimension = 15, $Dimension2 = 30);
CornerBrace($Width = 22,$Length = 51, $MaterialThickness = 4.8, $HoleCenters = 25.4, $HoleSize = 7.3);

module ExtrusionSlot($Rotation = 0)
{
  rotate($Rotation, [1, 0, 0])
  {
    translate([0, 0, 2.51 * $Dimension / 6])
      cube([$Length + 1, $Dimension / 3, $Dimension / 6], center = true);
    translate([0, 0, 2.01 * $Dimension / 6])
      cube([$Length + 1, $Dimension / 2.4, $Dimension / 6], center = true);
  }
}

module Extrusion1x()
{
  color("Silver")
    difference()
    {
      cube([$Length, $Dimension, $Dimension], center = true);
      rotate(90, [0, 1, 0])
        cylinder(d = $Bore, h = $Length + 1, center = true, $fn = 20);
      ExtrusionSlot(0);
      ExtrusionSlot(90);
      ExtrusionSlot(-90);
      ExtrusionSlot(180);
    }
}

module Extrusion($Type = "Extruded", $Dimension = 15, $Dimension2 = 15, $Length = 100, $Bore = 4.8, $Thickness = 2.6, $Sections = 1)
{
  if ($Type == "Extruded")
  {
    translate([0, -$Dimension * ($Sections - 1) / 2, 0])
    for ( i = [0 : $Sections - 1])
    {
      translate([0, i * $Dimension, 0])
        Extrusion1x();
    }
  }
  else if ($Type == "Hollow")
  {
    color("Silver")
      difference()
      {
        cube([$Length, $Dimension2, $Dimension], center = true);
        cube([$Length + 1, $Dimension2 - ($Thickness * 2), $Dimension - ($Thickness * 2)], center = true);
      }
  }
}

module CornerBrace($Width = 22,$Length = 51, $MaterialThickness = 4.8, $HoleCenters = 25.4, $HoleSize = 7.3)
{
  translate([0, 0, -$Width / 2])
    color([0.7, 0.7, 0.75])
      difference()
      {
        cube([$Length, $Length, $Width]);
        translate([$Length, $MaterialThickness, -1])
          rotate(45, [0, 0, 1])
            cube([$Length, $Length * 1.5, $Width + 2]);
        translate([$MaterialThickness, $MaterialThickness, -1])
        difference()
        {
          cube([$Length - ($MaterialThickness * 2.4), $Length - $MaterialThickness - $MaterialThickness, $Width + 2]);
          translate([$Length - ($MaterialThickness * 2.4), 0, 0])
            rotate(45, [0, 0, 1])
              cube([$Length, $Length * 1.5, $Width + 2]);
        }
        translate([0, 0, $Width / 2])
        {
          rotate(-90, [1, 0, 0])
          {
            translate([($Length + $HoleCenters) / 2, 0, -1])
              cylinder(d = $HoleSize, h = $Length * 1.5, $fn = 20);
            translate([($Length - $HoleCenters) / 2, 0, -1])
              cylinder(d = $HoleSize, h = $Length * 1.5, $fn = 20);
          }
          rotate(90, [0, 1, 0])
          {
            translate([0, ($Length + $HoleCenters) / 2, -1])
              cylinder(d = $HoleSize, h = $Length * 1.5, $fn = 20);
            translate([0, ($Length - $HoleCenters) / 2, -1])
              cylinder(d = $HoleSize, h = $Length * 1.5, $fn = 20);
          }
        }
      }
}
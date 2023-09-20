
module Core()
{
  //Width check
//  cylinder(d = 20, h= 25.4, center = true, $fn = 40);
  //Center bore idler
  cylinder(d = 23, h= 35, center = true, $fn = 40);
  //Left ridge
  translate([0, 0, 13 + 3])
    cylinder(d1 = 23, d2 = 35, h = 6, center = true, $fn = 40);
  //Right ridge
  translate([0, 0, -13 - 3])
    cylinder(d1 = 35, d2 = 23, h = 6, center = true, $fn = 40);
  //Left bearing mount
  translate([0, 0, 13 + 3 + 9])
    cylinder(d = 35, h = 12, center = true, $fn = 40);
  //Right bearing mount
  translate([0, 0, -13 - 3 - 9])
    cylinder(d = 35, h = 12, center = true, $fn = 40);
}

module TrackGuide()
{
  translate([0, 0, 62 / 2])
  {
    difference()
    {
      //Main core body
      Core();
      //Bolt opening
      cylinder(d = 8.2, h= 62, center = true, $fn = 40);
      //Bearing mounts
      translate([0, 0, 27.6])
        cylinder(d = 22.4, h = 7, center = true, $fn = 40);
      translate([0, 0, -27.6])
        cylinder(d = 22.4, h = 7, center = true, $fn = 40);
    }
    //Bridging support
    translate([0, 0, -23.8])
      cylinder(d = 10, h = .6, , center = true, $fn = 40);
  }
}

module Spacer()
{
  translate([0, 0, 18.5 / 2])
  difference()
  {
    cylinder(d = 24, h = 18.5, , center = true, $fn = 40);
    cylinder(d = 8.2, h = 18.6, , center = true, $fn = 40);
  }
}

module GuideSet()
{
  TrackGuide();
//  translate([32, 0, 0])
//    Spacer();
//  translate([20, 25, 0])
//    Spacer();
}

GuideSet();
translate([0, -40, 0])
  rotate(-30, [0, 0, 1])
  GuideSet();
translate([-38, 0, 0])
  rotate(55, [0, 0, 1])
    GuideSet();
translate([-37, -40, 0])
  rotate(150, [0, 0, 1])
    GuideSet();


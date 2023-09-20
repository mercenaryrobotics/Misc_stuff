pi = 3.1415926535897932384626433832795;

module grubscrew(bore, Rad, flangedepth)
{
  translate([0, -(bore / 2) - 1.3, -flangedepth])
    cube([5.5, 2.5, bore], center = true);
  translate([0, 2-(bore / 2), 0])
    rotate(90, [1, 0, 0])
      cylinder(r = 1.5, h = Rad + 2, $fn = 6);
}

module   RenderPulley(teeth = 20, pitch = 2.3, depth = 7, tooththickness = 0.6, toothlength = 1.3, bore = 7, flangestyle = 3, flangesize = 3, flangedepth = 1, grub = 0)
{

  //SCAD can't handle assignments inside conditional if, nor can it handle complex conditional assigns, so need to combine multiple together
  shifttemp = (flangestyle == 1 ?flangedepth : 0);
  shift = (flangestyle == 3 ?flangedepth : shifttemp);

  Cir = teeth * pitch;
  Dia = Cir / pi;
  Rad = Dia / 2;
  Ang = 360 / teeth;

  difference()
  {
    translate([0, 0, shift])
    union()
    {
      if ((flangestyle == 1) || (flangestyle == 3))
      {
        translate([0, 0, -flangedepth])
        cylinder(r = Rad + flangesize, h = flangedepth, $fn = 20);
      }
      if ((flangestyle == 2) || (flangestyle == 3))
      {
        translate([0, 0, depth])
        cylinder(r = Rad + flangesize, h = flangedepth, $fn = 20);
      }
      for (i = [0 : teeth - 1])
      {
        rotate(Ang * i, [0, 0, 1])
        translate([- tooththickness / 2, 0, 0])
        cube([tooththickness, Rad + toothlength, depth]);
      }
      cylinder(r = Rad, h = depth, $fn = 20);
    }
    translate([0, 0, -2])
    cylinder(r = bore / 2, h = depth + (flangedepth * 2) + 2, $fn = 20);

    if (grub == 1)
    {
      translate([0, 0, flangedepth / 2])
        grubscrew(bore = bore, Rad = Rad, flangedepth = (flangedepth / 2) - 3);
    }
  }
}

module pulley(style, teeth, depth, bore, flangestyle, flangesize, flangedepth, grub)
{
    if (style == "T2.5")
    {
      //2.18 is too wide with 22 teeth. not sure about other teeth counts
      RenderPulley(pitch = 2.15, tooththickness = 0.6, toothlength = 1.7, flangestyle = flangestyle, teeth = teeth, depth = depth, bore = bore, flangesize = flangesize, flangedepth = flangedepth, grub = grub);
    }
}

pulley(style = "T2.5", teeth = 22, depth = 12, bore = 7.3, flangestyle = 1, flangesize = 3, flangedepth = 6, grub = 1);

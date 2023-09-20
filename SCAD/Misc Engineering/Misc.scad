pi = 3.1415926535897932384626433832795;

////////////////////////////////////////////////////////////////////////////////////////////////
//                                 Module list                                                              //
////////////////////////////////////////////////////////////////////////////////////////////////

//	RodClamp()


////////////////////////////////////////////////////////////////////////////////////////////////
//                                 Module parameters                                                  //
////////////////////////////////////////////////////////////////////////////////////////////////

//RodClamp()
//	width = width of main block
//	height = height of main block
//	depth = depth of main block
//	boreheight = height of center of shaft from base
//	boreradius = radius of bore
//	gapwidth = width of clamp gap
//	screwbore = bore hole radius for clamp screw
//	screwstyle = 0-hex side aligned, 1-hex top aligned, 2-round
//	captivestyle = 0-hex side aligned, 1-hex top aligned, 2-square open to top, 3-hex base open top
//	captivebore = bore hole radius of captive nut
//	captivedepth = thicknes of captuve nut


////////////////////////////////////////////////////////////////////////////////////////////////
//                                 Module definitions                                                   //
////////////////////////////////////////////////////////////////////////////////////////////////

module RodClamp()
{
  //width = width of main block
  //height = height of main block
  //depth = depth of main block
  //boreheight = height of center of shaft from base
  //boreradius = radius of bore
  //gapwidth = width of clamp gap
  //screwbore = bore hole radius for clamp screw
  //screwstyle = 0-hex side aligned, 1-hex top aligned, 2-round
  //captivestyle = 0-hex side aligned, 1-hex top aligned, 2-square open to top, 3-hex base open top
  //captivebore = bore hole radius of captive nut
  //captivedepth = thicknes of captuve nut

  upper = (height - boreheight - boreradius);
  screwoffset = (upper / 2) + boreradius;
  difference()
  {
    translate([-width/2, -depth/2, -boreheight])
      cube([width, depth, height]);
    rotate(90, [1, 0, 0])
      cylinder(r = boreradius, h = depth + 0.1, center = true, $fn = 25);
    translate([0, -(depth + 0.1) / 2, 0])
      rotate(-45, [0, 1, 0])
      cube([boreradius, depth + 0.1, boreradius]);
    translate([-gapwidth / 2, -(depth + 0.1) / 2, 0])
    cube([gapwidth, depth + 0.1, height - boreheight + 0.1]);
    translate([0, 0, screwoffset])
    {
      rotate(90, [0, 1, 0])
        if (screwstyle == 0)
          cylinder(r = screwbore, h = width + 0.1, center = true, $fn = 6);
        else if (screwstyle == 1)
          rotate(30, [0, 0, 1])
          cylinder(r = screwbore / 0.866025, h = width + 0.1, center = true, $fn = 6);
        else if (screwstyle == 2)
          cylinder(r = screwbore / 0.866025, h = width + 0.1, center = true, $fn = 20);
      translate([((width - captivedepth) / 2) + 0.1, 0, 0])
      {
      if (captivestyle == 0)
        rotate(90, [0, 1, 0])
          cylinder(r = captivebore / 0.866025, h = captivedepth + 0.1, center = true, $fn = 6);
      else if (captivestyle == 1)
        rotate(90, [0, 1, 0])
          rotate(30, [0, 0, 1])
            cylinder(r = captivebore / 0.866025, h = captivedepth + 0.1, center = true, $fn = 6);
      else if (captivestyle == 2)
        translate([0, 0, ((upper + (captivebore * 2)) / 4) - ((captivebore * 2)/ 1.8)])
        cube([captivedepth + 0.1, captivebore * 2, ((upper + (captivebore * 2)) / 1.8)], center = true);
      else if (captivestyle == 3)
      {
        translate([0, 0, ((upper + captivebore) / 4)])
        cube([captivedepth + 0.1, captivebore * 2, ((upper + captivebore) / 1.7)], center = true);
        rotate(90, [0, 1, 0])
          cylinder(r = captivebore / 0.866025, h = captivedepth + 0.1, center = true, $fn = 6);
      }
      }
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////
//                                 Module tests                                                           //
////////////////////////////////////////////////////////////////////////////////////////////////

RodClamp(width = 15, height = 15, depth = 12, boreheight = 6, boreradius = 3, gapwidth = 1, screwbore = 1.2, screwstyle = 1, captivestyle = 3, captivebore = 2, captivedepth = 1.5);

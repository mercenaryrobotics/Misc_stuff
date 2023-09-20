//Triangle functions
//Return 3rd side for side_angle_side triangle
function Triangle_SAS_S() = sqrt((pow($L1, 2)) + (pow($L2, 2)) - (2 * $L1 * $L2 * cos($A)));
//Return included angle given 3 sides
function Triangle_SSS_A() = acos((pow($A1 , 2) + pow($A2, 2) - pow($O, 2)) / (2 * $A1 * $A2));

$HexToRScale        = 1.23607;

module ShowBounds($Bounds = [30, 30, 45], $Color = [0.7, 0.0, 0.8, 0.2])
{
	color($Color)
		translate([-$Bounds[0] / 2, -$Bounds[1] / 2, 0])
		cube($Bounds);
}

module RobotBaseSimple($DriveWheelDiameter = 6, $DriveFrameSize      = [28, 28.5, 3], $BumperDepth = 3.5, $BumperOffset = 2, $OpenFront = true)
{
    $DriveFrameSizeInner = [$DriveFrameSize[0] - 6, $DriveFrameSize[1] - 6, $DriveFrameSize[2] + 0.05];
    $BumperSize          = [$DriveFrameSize[0] + ($BumperDepth * 2), $DriveFrameSize[1] + ($BumperDepth * 2), 5];
    $FrontGap            = $DriveFrameSize[0] - 12;

    translate([0, 0, $DriveWheelDiameter / 2])
	difference()
	{
		union()
		{
			color([0.7, 0.2, 0.6, 0.5])
			difference()
			{
				cube($DriveFrameSize, center = true);
				cube($DriveFrameSizeInner, center = true);
			}
            translate([0, 0, $BumperOffset])
		color([0.3, 0.1, 0.5, 0.5])
            difference()
            {
				cube($BumperSize, center = true);
				cube($BumperSize - [2 * $BumperDepth, 2 * $BumperDepth, -1], center = true);
            }
			translate([13, 0, 0])
				WheelSet();
			translate([-13, 0, 0])
				WheelSet();
		}
		if ($OpenFront)
			translate([0, 10, 0])
				cube([$FrontGap, 20, 30], center = true);
	}
}

module WheelSet()
{
	color("white")
	rotate(90, [0, 1, 0])
	{
		translate([0, -11, 0])
			cylinder(d = $DriveWheelDiameter, h = 1, $fn = 40, center = true);
		cylinder(d = $DriveWheelDiameter, h = 1, $fn = 40, center = true);
		translate([0, 11, 0])
			cylinder(d = $DriveWheelDiameter, h = 1, $fn = 40, center = true);
	}
}

module Tube($W = 2, $T = 1, $HoleDiameter = 1/4, $Center = 0, $Holes = undef)
{
	if ($Holes != undef)
		echo ($W,$T, $L, $Holes);
	else
		echo ($W,$T, $L);

	translate([0, 0, -$Center * ($L / 2)])
	{
		color("BLACK")
			translate([0, 0, $L / 2])
				WireBox($W = $W + 0.01, $T = $T + 0.01, $L = $L + 0.01);
		
		color([0.7, 0.7, 0.7])
			difference()
			{
				translate([-$W/2, -$T/2, 0])
					cube([$W, $T, $L]);
				translate([0.1-$W/2, 0.1-$T/2, -0.05])
					cube([$W - 0.2, $T - 0.2, $L + 0.1]);
				for($HoleCoord=$Holes)
				{
					translate([$HoleCoord[1], 0, $HoleCoord[0]])
						rotate(90, [1, 0, 0])
	#						cylinder(d = $HoleDiameter, h = $T + 2.1, $fn = 20, center = true);
				}
			}
		}
}

module WireBox()
{
	$OutlineSize = 0.05;
	difference()
	{
		cube([$W, $T, $L], center = true);
		cube([$W - $OutlineSize, $T - $OutlineSize, $L + 0.1], center = true);
		cube([$W + 0.1,          $T - $OutlineSize, $L - $OutlineSize], center = true);
		cube([$W - $OutlineSize, $T + 0.1         , $L - $OutlineSize], center = true);
	}
}

module FlatLBracket($L = 2.5, $W = 0.5)
{
	color($BracketColor)
	{
		cube([3/16, $W, $L]);
		cube([3/16, $L, $W]);
	}
}

module FlatPlate($L = 2.5, $W = 0.5)
{
	color($BracketColor)
	{
		cube([3/16, $W, $L]);
	}
}

module LBracket($L = 2.5, $W = 0.5)
{
	translate([-3/16, 0, 0])
		color($BracketColor)
		{
			cube([3/16, $W, $L]);
			translate([3/16, 0, 0])
				rotate(-90, [0, 1, 0])
					cube([3/16, $W, $L]);
		}
}

module CornerBracket($L = 2.5, $W = 0.5)
{
	translate([-3/16, 0, 0])
		color($BracketColor)
		{
			cube([3/16, $W, $L]);
			translate([3/16, 0, 0])
				rotate(-90, [0, 1, 0])
					cube([3/16, $W, $L]);
			translate([-$L, 0, 0])
			difference()
			{
				translate([3/16, 0, 3/16])
					cube([$L - (3/16), 3/16, $L - (3/16)]);
				translate([0, -0.02, 0])
					rotate(-45, [0, 1, 0])
						cube([$L * 1.5, 4/16, $L * 1.5]);

			}
		}
}

module VBearing($ID = 3/8, $OD = 1.2, $T = 3/8)
{
	difference()
	{
		union()
		{
			color("SILVER")
			{
				translate([0, 0, 0 * ($T / 4)])
					cylinder(d1 = $OD - .3, d2 = $OD, h = $T / 4, $fn = 50);
				translate([0, 0, 1 * ($T / 4)])
					cylinder(d2 = $OD - .3, d1 = $OD, h = $T / 4, $fn = 50);
				translate([0, 0, 2 * ($T / 4)])
					cylinder(d1 = $OD - .3, d2 = $OD, h = $T / 4, $fn = 50);
				translate([0, 0, 3 * ($T / 4)])
					cylinder(d2 = $OD - .3, d1 = $OD, h = $T / 4, $fn = 50);
			}
			color("BLACK")
				translate([0, 0, -0.01])
					cylinder(d = $ID + 0.2, h = $T + 0.02, $fn = 50);
		}
		translate([0, 0, -0.02])
			cylinder(d = $ID, h = $T + 0.04, $fn = 50);
	
	}
}

module NeverestSprocket()
{
  $fn = 40;
  $GuideInnerDiameter = (($SprocketTeethCount * 0.25) / 3.141);
  $GuideOuterDiameter = $GuideInnerDiameter + ((3/8));
  $SprocketTeethCount = 16;
  difference()
  {
    difference()
    {
      union()
      {
        translate([0, 0, (0.25 / 2)])
          scale(1/25.4)
          sprocket($ChainSize, $SprocketTeethCount, 0, 0, 0, $ChainGuideAngle);
        difference()
        {
          translate([0, 0, -0.22])
            cylinder(d = $GuideInnerDiameter - (7 / 25.4), h = 0.8, $fn = $SprocketTeethCount * 2);
          translate([0, .25, 0])
            cube([.22, .13, 5], center = true);
         }
      }
      difference()
      {
        cylinder(d = 0.25, h = 5, $fn = 20, center = true);
        translate([0, .35, 0])
          cube([.5, .5, 5], center = true);
      }
    }
    translate([0, 0, .18 - .27])
      rotate(-90, [1, 0, 0])
        cylinder(d = 4/25.4, h = 3, $fn = 20);
    translate([0, 0, .18 + .27])
      rotate(-90, [1, 0, 0])
        cylinder(d = 4/25.4, h = 3, $fn = 20);
  }
}

module HexSprocket()
{
  $GuideInnerDiameter = (($SprocketTeethCount * 0.25) / 3.141);
  $GuideOuterDiameter = $GuideInnerDiameter + ((3/8));
  {
    difference()
    {
      union()
      {
        translate([0, 0, (0.25 / 2)])
          scale(1/25.4)
          sprocket($ChainSize, $SprocketTeethCount, 0, 0, 0, $ChainGuideAngle);
        cylinder(d = $GuideInnerDiameter - (7 / 25.4), h = ((0.11 + 0.25)), $fn = $SprocketTeethCount * 2);
      }
      HexShaft($D = $HexBore, $L = 5, $Center = true);
    }
  }
}

module HexShaft($D = 0.5, $L = 5, $Center = false)
{
	cylinder(d = $D * $HexToRScale, h = $L, $fn = 6, center = $Center);
}

module NeverRestHexShaftMotorCoupler($HexShaftBore = 0.515)
{
  difference()
  {
    difference()
    {
      union()
      {
        difference()
        {
          translate([0, 0, -0.22])
            cylinder(d = 1.3, h = 0.8, $fn = 6);
          translate([0, .25, -0.42])
            cube([.22, .13, 1], center = true);
         }
      }
      difference()
      {
        cylinder(d = 0.25, h = 5, $fn = 20, center = true);
        translate([0, .35, 0])
          cube([.5, .5, 5], center = true);
      }
    }
    translate([0, 0, .18 - .25])
      rotate(-90, [1, 0, 0])
        cylinder(d = 4/25.4, h = 3, $fn = 20);
    translate([0, 0, .58 - 0.5])
      HexShaft($D = $HexShaftBore, $L = 1);
  }
}

module HexBearing()
{
  rotate(-90, [1, 0, 0])
    color([0.4, 0.4, 0.5])
      difference()
      {
        union()
        {
          cylinder(d = 1.225, h = 0.063, $fn = 40);
          translate([0, 0, 0.063])
            cylinder(d = 1.124, h = 0.25, $fn = 40);
        }
        if ($Shaft == 1)
        {
          translate([0, 0, -0.1])
            cylinder(d = 0.5, h = 2, $fn = 6);
        }
      }
}

module HexCoupler()
{
  color([0.3, 0.3, 0.4])
    rotate(90, [1, 0, 0])
      difference()
      {
        intersection()
        {
          cylinder(d = 1, h = 1.5, $fn = 20, center = true);
          cube([1, .879, 1.5], center = true);
        }
        cylinder(d = 0.5, h = 1.6, $fn = 6, center = true);
      }
}

module Wheel($Color = $ShooterFlywheelColor, $Diameter = $FlyWheelDiameter, $Thickness = 1)
{
  //Flywheel
    color($Color)
      cylinder(d = $Diameter, h = $Thickness, $fn = 30, center = true);
}

module MiniCIM()
{
  //Mounting Spaced at 2"
  color([0.2, 0.2, 0.2])
    cylinder(d = 2.5, h = 3.55, $fn = 30);
  color("SILVER")
    cylinder(d = 0.315, h = 3.55 + 1.402, $fn = 30);
}

module Neverest($Correction = 0)
{
  translate([0, -0.28, 0])
    color([0.6, 0.7, 0.75])
      cylinder(d = 1.5 + $Correction, h = 2.24 + 0.709 + 1.024, $fn = 30);
  color("SILVER")
    cylinder(d = 0.217, h = 5.3, $fn = 30);
}


module slice(r = 10, deg = 30) 
{
  degn = (deg % 360 > 0) ? deg % 360 : deg % 360 + 360;
  difference() 
  {
    circle(r);
    if (degn > 180) intersection_for(a = [0, 180 - degn]) rotate(a) translate([-r, 0, 0]) square(r * 2);

    else union() for(a = [0, 180 - degn]) rotate(a) translate([-r, 0, 0]) square(r * 2);

  }

}

module BearingReceptical($Type="608", $DOversize = 0, $HOversize = 0)
{
	if ($Type=="608")
	{
		cylinder(d = 22 + $DOversize, h = 7 + $HOversize, $fn = 40);
	}
}

module Bolt()
{
  rotate($Angle, $Orientation)
    scale($Units)
    {
      cylinder(d = $Shaft, h = $ShaftLength, $fn = 30);
      cylinder(d = $Head, h = $HeadDepth, $fn = 6);
    }
}

module CaptiveBoltOpening($Type = "M5", $ShaftLength = 100, $Angle = 0, $Orientation = [0,1, 0], $Units = 1/25.4, $DepthCorrection = 0, $BoreCorrection = 0)
{
  if ($Type == "M5")
    Bolt($Shaft = 5.3 + $BoreCorrection, $Head = 10, $HeadDepth = 4 + $DepthCorrection);
  else if ($Type == "M2.5")
    Bolt($Shaft = 2.55 + $BoreCorrection, $Head = 5.7, $HeadDepth = 3.2 + $DepthCorrection);
  else if ($Type == "M4")
    Bolt($Shaft = 4.3 + $BoreCorrection, $Head = 8, $HeadDepth = 4 + $DepthCorrection);
}

module LBar($Size = .64, $Gauge = 0.14)
{
  difference()
  {
    cube([$Size, $Size, $L]);
    translate([$Gauge, $Gauge, -0.1])
      cube([$Size, $Size, $L + 0.2]);
    }
}

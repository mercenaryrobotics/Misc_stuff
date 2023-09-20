
//function Triangle_SAS_S()         - Return 3rd side for side_angle_side triangle
//function Triangle_SSS_A()         - Return included angle given 3 sides
//ShowBounds($Bounds = [30, 30, 45], $Color = [0.7, 0.0, 0.8, 0.2]);
//RobotBaseSimple($DriveWheelDiameter = 6, $DriveFrameSize      = [28, 28.5, 3], $BumperDepth = 3.5, $BumperOffset = 2, $OpenFront = true);
//WireBox();
//WheelSet();
//Tube($W = 2, $T = 1, $HoleDiameter = 1/4, $Center = 0, $Holes = undef);
//FlatLBracket($L = 2.5, $W = 0.5);
//FlatPlate($L = 2.5, $W = 0.5);
//LBracket($L = 2.5, $W = 0.5);
//CornerBracket($L = 2.5, $W = 0.5);
//VBearing($ID = 3/8, $OD = 1.2, $T = 3/8);
//NeverestSprocket();
//HexSprocket();
//HexShaft($D = 0.5, $L = 5, $Center = false);
//NeverRestHexShaftMotorCoupler($HexShaftBore = 0.515);
//HexBearing();
//HexCoupler();
//Wheel($Color = $ShooterFlywheelColor, $Diameter = $FlyWheelDiameter, $Thickness = 1);
//MiniCIM();
//Neverest();
//BearingReceptical($Type="608", $DOversize = 0, $HOversize = 0);
//Bolt();
//CaptiveBoltOpening($Type = "M5", $ShaftLength = 100, $Angle = 0, $Orientation = [0,1, 0], $Units = 1/25.4);
//RevHDHex();
//RevMountPattern($D = 3, $H = 10, $R = 8, $Count = 6, $Rotate = 0);
//UltraPlanetaryGearbox($Stages = 2, $Color = [.2, .2, .2]);
//HDAndGearbox();
//ActobotixExtrusion($Length = 100);
//StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 5, $DoHoles = true, $ServoMountHoleLength = 20, $HolesOffset = 0));
//Bearing608();
//RevHDHoleSet();
//Slot($Width = 5, $Length = 20, $Height = 3);
//HexShaftBearingShim($Height = $Bearing608Height);
//HexShaftBearingShimSpacer();
//OpticalHolder();
//Washer($Outer = 140, $Inner = 135, $Thickness = 60, $fn = 80);
//ActoBearingMountHoleSet($YSpacing = 27, $XSpacing = 11);
//ActoBearingMount($BlockWidth = 34, $Outer = 1, $Inset = 1, $BlockLength = 32);
//ActoBearingMountCap($BlockWidth = 25, $Outer = 0);
//HexMotorMountHoles();
//TetrixHoles($Type = 0, $HolePattern = 15, $Center = true);
//TetrixHolePattern($Height = 30, $Count = 3, $StartType = 0, $Pattern = [1, 0, 1], $Centers = 2, $TetrixShaftHoleDiameter = 15);
//TetrixNarrowBearingMount();
//TetrixWideBearingMount();
//TetrixEdgeBearingMount();
//GoBildaMecanumMountHoleSet();
//GoBildaMecanumMount($DoSprocket = 1);
//SmallPulleyCap();
//BoxExtrusionInsert($Length = 30);
//Rev5mmHexBearingBlock($BoltHeight = 10, $Cutout = 1);
//CaptiveBoltSlot($ShaftL = 20, $ShaftD = 4.3, $HeadD = 6, $HeadL = 3, $Spacing = 2, $Angle = 0, $Orientation = [0, 0, 0], $Units = 1);
//GrubScrewPattern($ShaftD = 2.6, $ShaftL = 20, $NutFlatD = 5.0, $NutThickness = 2.0, $SlotL = 10, $SlotOffset = 7, $Angle = -90, $Orientation = [1, 0, 0], $fn = 20);
//HexGearCheckFlags();
//ExtrusionSlide($BlockWidth = 30, $BlockDepth = 25, $BlockHeight = 40, $ExtrusionSize = 15.5, $Holes = 2, $HoleD = 3.3, $HOffset = .5, $fn = 20);
//Extrusion($Size = 15, $Length = 100, $Offset = 0)
//ShamferedShaft($D = 6, $H = 20, $DOver = 1, $HOver = 1, $fn = 6);

$AluminumHexShaftD = 6.1;
$SteelHexShaftD = 6.25;

$SmalHexShaftD = 6.1;
$HexShaftD = $AluminumHexShaftD;
$RevHDShaftD = 6;

$ServoLength = 40.5;
$ServoWidth = 20;
$ServoDepth = 36.1;
$ServoTabLength = 55.5;
$ServoMountHSpacing = 48;
$ServoMountVSpacing = 10;
$ServoMountHoleDiameter = 3.3;
$ServoTabOffset = 26.6;
$ServoShaftOffset = 10.4;
$ServoXOffset = 80;
$ServoYOffset = 15;
$PivotLength1 = 62;
$PivotLength2 = 37;

$M3Tight = 3;
$M3Slack = 3.3;

$Bearing608Diameter = 22.3; 
$Bearing608Height = 7.5;
$Bearing608InnerD = 8.0;

$Bearing625Diameter = 16; 
$Bearing625Height = 5.1;
$Bearing625InnerD = 5.2;

$ArcMotorMountSpacing = 32;
$ArcMotorHubOpening = 25;


//Triangle functions
//Return 3rd side for side_angle_side triangle
function Triangle_SAS_S() = sqrt((pow($L1, 2)) + (pow($L2, 2)) - (2 * $L1 * $L2 * cos($A)));
//Return included angle given 3 sides
function Triangle_SSS_A() = acos((pow($A1 , 2) + pow($A2, 2) - pow($O, 2)) / (2 * $A1 * $A2));

//$HexToRScale        = 1.23607;
$HexToRScale        = 1.15;

module HighStrengthHexHub($DClearance = 0, $HClearance = 0, $PinExtend1 = 0, $PinExtend2 = 0)
{
  cylinder(d = 21   + $DClearance, h = 3.25 + $HClearance);
  cylinder(d = 12   + $DClearance, h = 4.25 + $HClearance);
  cylinder(d = 8.93 + $DClearance, h = 11.22 + $HClearance);
  translate([8, 0, -5 - $PinExtend1])
    cylinder(d = 3 + $DClearance, h = 5 + $PinExtend1);
  translate([-8, 0, -5 - $PinExtend1])
    cylinder(d = 3 + $DClearance, h = 5 + $PinExtend1);
  translate([0, 8, -5 - $PinExtend2])
    cylinder(d = 3 + $DClearance, h = 5 + $PinExtend2);
  translate([0, -8, -5 - $PinExtend2])
    cylinder(d = 3 + $DClearance, h = 5 + $PinExtend2);
}

module GrubScrewPattern($Angle = 0, $Orientation = [0, 0, 0])
{
  rotate($Angle, $Orientation)
  {
    rotate(90, [0, 0, 1])
    {
      cylinder(d = $ShaftD, h = $ShaftL);
      translate([0, 0, $SlotOffset])
      {
        cylinder(d = $NutFlatD * $HexToRScale, h = $NutThickness, $fn = 6);
        translate([0, -$NutFlatD / 2, 0])
          cube([$SlotL, $NutFlatD, $NutThickness]);
      }
    }
  }
}

module Rev5mmHexBearingBlock($BoltHeight = 10, $Cutout = 1)
{
  $fn = 50;
  
  difference()
  {
    cube([33, 22.5, 4.6], center = true);
    if ($Cutout == 0)
    {
      cylinder(d = 12, h = $BoltHeight, center = true);
      translate([10, 8, 0])
        cylinder(d = 3.2, h = $BoltHeight, center = true);
      translate([-10, 8, 0])
        cylinder(d = 3.2, h = $BoltHeight, center = true);
      translate([10, -8, 0])
        cylinder(d = 3.2, h = $BoltHeight, center = true);
      translate([-10, -8, 0])
        cylinder(d = 3.2, h = $BoltHeight, center = true);
    }
  }
  if ($Cutout == 1)
  {
    cylinder(d = 12, h = $BoltHeight, center = true);
    translate([10, 8, 0])
      cylinder(d = 3.2, h = $BoltHeight, center = true);
    translate([-10, 8, 0])
      cylinder(d = 3.2, h = $BoltHeight, center = true);
    translate([10, -8, 0])
      cylinder(d = 3.2, h = $BoltHeight, center = true);
    translate([-10, -8, 0])
      cylinder(d = 3.2, h = $BoltHeight, center = true);
  }
}

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

module Neverest()
{
  translate([0, -0.28, 0])
    color([0.6, 0.7, 0.75])
      cylinder(d = 1.5, h = 2.24 + 0.709 + 1.024, $fn = 30);
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

module BearingReceptical($Type="608", $DOversize = 0, $HOversize = 0, $Rotate = [0, 0, 0])
{
  rotate(90, $Rotate)
  {
    if ($Type=="608")
    {
      cylinder(d = $Bearing608Diameter + $DOversize, h = $Bearing608Height + $HOversize, $fn = 40);
    }
    else if ($Type=="625")
    {
      cylinder(d = $Bearing625Diameter + $DOversize, h = $Bearing625Height + $HOversize, $fn = 40);
    }
  }
}

module Bolt($Angle = 0, $Orientation = [0, 0, 0], $Units = 1, $Shaft = 3, $ShaftLength = 20, $Head = 5, $HeadFlat = 0, $HeadDepth = 4, $Sides = 6)
{
  rotate($Angle, $Orientation)
    scale($Units)
    {
      cylinder(d = $Shaft, h = $ShaftLength, $fn = 30);
      if ($HeadFlat == 0)
      {
        cylinder(d = $Head, h = $HeadDepth, $fn = $Sides);
      }
      else
      {
        cylinder(d = $HeadFlat * $HexToRScale, h = $HeadDepth, $fn = $Sides);
      }
    }
}

module CaptiveBoltOpening($Type = "M5", $ShaftLength = 100, $Angle = 0, $Orientation = [0,1, 0], $Units = 1/25.4)
{
  if ($Type == "M5")
    Bolt($Shaft = 5.3, $Head = 10, $HeadDepth = 4);
  else if ($Type == "M2.5")
    Bolt($Shaft = 2.55, $Head = 5.7, $HeadDepth = 3.2);
}

module RevHDHex()
{
  translate([0, 0, -75])
  {
    color("silver")
      cylinder(d = 38, h = 75, $fn = 40);
    color("white")
    {
      translate([-3.5, 14, -8])
        cube([7, 5, 8]);
      translate([-5.5, -16, -8])
        cube([11, 3, 8]);
    }
  }
}

module RotatedShaftSet($D = 3, $H = 10, $Radius = 8, $Count = 6, $Rotate = 0)
{
  rotate($Rotate, [0, 0, 1])
    for ( i = [0 : $Count - 1] )
    {
      rotate(i * (360 / 6), [0, 0, 1])
        translate([$Radius, 0, 0])
          cylinder(d = $D, h = $H, $fn = 20);
    }
}

module RevMountPattern($D = 3, $H = 10, $R = 8, $Count = 6, $Rotate = 0)
{
  for ( i = [0 : $Count - 1] )
  {
    rotate((i * (360 / 6))+ $Rotate, [0, 0, 1])
      translate([$R, 0, 0])
        cylinder(d = $D, h = $H, $fn = 20);
  }
}

module UltraPlanetaryGearbox()
{
  $Color = [.2, .2, .2];
  $StackHeight = 5 + (10 * $Stages) + 11;

  color($Color)
    difference()
    {
      union()
      {
        cylinder(d = 38 * $HexToRScale, $StackHeight, $fn = 6);
        translate([0, 0, $StackHeight])
          cylinder(d = 22, h = 6, $fn = 30);
      }
      cylinder(d = 5, h = $StackHeight + 10, $fn = 6);
      //Drive shaft mount pattern
      translate([0, 0, $StackHeight])
        RevMountPattern($D = 3, $H = 10, $R = 8);
      //Motor mounting plate pattern
      translate([0, 0, $StackHeight - 6])
        rotate(30, [0, 0, 1])
          RevMountPattern($D = 3, $H = 10, $R = 16);
      //Gearbox clamp bolt pattern, head openings
      translate([0, 0, $StackHeight - 5])
        RevMountPattern($D = 9, $H = 10, $R = 19);
      //Gearbox clamp bolt pattern
      translate([0, 0, $StackHeight - 10])
        RevMountPattern($D = 3, $H = 10, $R = 18);
    }
}

module HDAndGearbox()
{
  UltraPlanetaryGearbox();
  RevHDHex();
}

module ActobotixExtrusion($ShowCHoles = true, $ShowSlots = true, $ShowHoles = true, $ShowAngledHoles = true, $ShowTopBottomHoles = true)
{
  $Height = 48.2;
  $Depth = 12;
  $fn = 20;
  
  $HoleCount = ($Length / 24);

  difference()
  {
    translate([0, 0, -$Height / 2])
      difference()
      {
        cube([$Depth, $Length, $Height]);
        translate([2.4, -0.5, 2.4])
          cube([$Depth, $Length + 1, $Height - 2.4 - 2.4]);
      }
      rotate(90, [0, 1, 0])
      {
        for ($X = [0:$HoleCount])
        {
          translate([0, ($X * 24), 0])
          {
            if ($ShowCHoles && ($X != 0))
              cylinder(d = 14, h = 10, center = true);
            if ($ShowSlots)
            {
              if ($X != 0)
              {
                translate([-16, 0, 1])
                  Slot($Width = 4, $Length = 4, $Height = 5);
                translate([16 - 4, 0, 1])
                  Slot($Width = 4, $Length = 4, $Height = 5);
              }
              rotate(90, [0, 0, 1])
                translate([11.1, 0, 0])
                  Slot($Width = 4, $Length = 1.25, $Height = 5);
            }
            if ($ShowHoles)
            {
              translate([16, 8, 0])
                cylinder(d = 4, h = 10, center = true);
              translate([16, -8, 0])
                cylinder(d = 4, h = 10, center = true);
              translate([-16, 8, 0])
                cylinder(d = 4, h = 10, center = true);
              translate([-16, -8, 0])
                cylinder(d = 4, h = 10, center = true);
            }
            if ($ShowAngledHoles)
            {
              rotate(-45, [0, 0, 1])
                translate([11.1, 0, 0])
                  Slot($Width = 4, $Length = .75, $Height = 5);
              rotate(45, [0, 0, 1])
                translate([11.1, 0, 0])
                  Slot($Width = 4, $Length = .75, $Height = 5);
              rotate(-45 - 90, [0, 0, 1])
                translate([11.1, 0, 0])
                  Slot($Width = 4, $Length = .75, $Height = 5);
              rotate(45 + 90, [0, 0, 1])
                translate([11.1, 0, 0])
                  Slot($Width = 4, $Length = .75, $Height = 5);
            }
          }
        }
      }
      if ($ShowTopBottomHoles)
      {
        for ($X = [0:$HoleCount * 3])
          translate([8, 8 + ($X * 8), 0])
            cylinder(d = 4, h = $Height + 2, center = true);
      }
  }
}

module StandardServo($ServoMountHoleLength = 20, $HolesOffset = 0)
{
  translate([$ServoShaftOffset - ($ServoLength / 2), 0, -2.5])
  {
    color([0.3, 0.3, 0.3])
    {
      //Main body
      translate([-($ServoLength + $Gap)/ 2, -($ServoWidth + $Gap) / 2, -$ServoTabOffset])
        cube([($ServoLength + $Gap), ($ServoWidth + $Gap), $ServoDepth]);
      //Mounting tabs
      difference()
      {
        translate([-$ServoTabLength / 2, -$ServoWidth / 2, 0])
          cube([$ServoTabLength, $ServoWidth, 2.5]);
        if ($DoHoles == 1)
        {
            translate([$ServoMountHSpacing / 2, $ServoMountVSpacing / 2, -9])
              cylinder(d = $ServoMountHoleDiameter, h = $ServoMountHoleLength, $fn = 40);
            translate([$ServoMountHSpacing / 2, -$ServoMountVSpacing / 2, -9])
              cylinder(d = $ServoMountHoleDiameter, h = $ServoMountHoleLength, $fn = 40);
            translate([-$ServoMountHSpacing / 2, $ServoMountVSpacing / 2, -9])
              cylinder(d = $ServoMountHoleDiameter, h = $ServoMountHoleLength, $fn = 40);
            translate([-$ServoMountHSpacing / 2, -$ServoMountVSpacing / 2, -9])
              cylinder(d = $ServoMountHoleDiameter, h = $ServoMountHoleLength, $fn = 40);
          }
        }
      }
    //Mounting holes. Note, positive so that can be 'differenced'
    if ($DoPillars == 1)
    {
      color([0.6, 0.2, 0.2, 0.3])
      {
        translate([$ServoMountHSpacing / 2, $ServoMountVSpacing / 2, -9 - $HolesOffset])
          cylinder(d = $ServoMountHoleDiameter, h = $ServoMountHoleLength, $fn = 40);
        translate([$ServoMountHSpacing / 2, -$ServoMountVSpacing / 2, -9 - $HolesOffset])
          cylinder(d = $ServoMountHoleDiameter, h = $ServoMountHoleLength, $fn = 40);
        translate([-$ServoMountHSpacing / 2, $ServoMountVSpacing / 2, -9 - $HolesOffset])
          cylinder(d = $ServoMountHoleDiameter, h = $ServoMountHoleLength, $fn = 40);
        translate([-$ServoMountHSpacing / 2, -$ServoMountVSpacing / 2, -9 - $HolesOffset])
          cylinder(d = $ServoMountHoleDiameter, h = $ServoMountHoleLength, $fn = 40);
      }
    }
  }
  //Horn shaft
  color([0.6, 0.6, 0.6])
    translate([0, 0, $ServoDepth - $ServoTabOffset - 2.5])
      difference()
      {
        cylinder(d = $ShaftDiameter, h = 8, $fn = 40);
//        cylinder(d = $M3Tight, h = 8, $fn = 40);
      }
      
  //Strengtheners
  color([0.3, 0.3, 0.3])
  {
    translate([10.9, -1.5, 0])
      cube([7, 3, 6.0]);
    translate([-37.5, -1.5, 0])
      cube([7, 3, 6.0]);
  }
}

module Bearing608()
{
    cylinder(d = $Bearing608Diameter, h = $Bearing608Height, $fn = 50);
}

module RevHDHoleSet()
{
  //Motor shaft opening
  cylinder(d = $ArcMotorHubOpening, h = 20, center = true, $fn = 30);
  //Motor mount holes
  translate([$ArcMotorMountSpacing / 2, 0, 0])
    cylinder(d = 3.4, h = 20, center = true, $fn = 30);
  translate([-$ArcMotorMountSpacing / 2, 0, 0])
    cylinder(d = 3.4, h = 20, center = true, $fn = 30);
  rotate(60, [0, 0, 1])
  {
    translate([$ArcMotorMountSpacing / 2, 0, 0])
      cylinder(d = 3.4, h = 20, center = true, $fn = 30);
    translate([-$ArcMotorMountSpacing / 2, 0, 0])
      cylinder(d = 3.4, h = 20, center = true, $fn = 30);
  }
  rotate(-60, [0, 0, 1])
  {
    translate([$ArcMotorMountSpacing / 2, 0, 0])
      cylinder(d = 3.4, h = 20, center = true, $fn = 30);
    translate([-$ArcMotorMountSpacing / 2, 0, 0])
      cylinder(d = 3.4, h = 20, center = true, $fn = 30);
  }
}

module Slot($Centered = 0)
{
  if ($Centered == 1)
  {
    translate([-$Length / 2, 0, 0])
      hull()
      {
        cylinder(d = $Width, h = $Height, $fn = 30, center = true);
        translate([$Length, 0, 0])
          cylinder(d = $Width, h = $Height, $fn = 30, center = true);
      }
  }
  else
  {
    hull()
    {
      cylinder(d = $Width, h = $Height, $fn = 30, center = true);
      translate([$Length, 0, 0])
        cylinder(d = $Width, h = $Height, $fn = 30, center = true);
    }
  }
}

module HexShaftBearingShim($Height = $Bearing608Height, $Sides = 6)
{
  difference()
  {
    cylinder(d2 = $Bearing608InnerD - 0.2, d1 = $Bearing608InnerD, h = $Height, $fn = 60);
    cylinder(d = $RevHDShaftD + .25, h = $Height + 1, $fn = $Sides);
  }
}

module HexShaftBearingShimSpacer($Height = $Bearing608Height, $SpacerHeight = 1, $Sides = 6, $OuterD = $Bearing608InnerD, $InnerD = $RevHDShaftD)
{
  difference()
  {
    cylinder(d2 = $OuterD - 0.2, d1 = $OuterD, h = $Height + $SpacerHeight, $fn = 60);
    //Main shaft opening
    cylinder(d = $InnerD, h = $Height + $SpacerHeight, $fn = $Sides);
    //Lower shamfer
    cylinder(d1 = $InnerD + 1.2, d2 = $InnerD, h = 1.2, $fn = $Sides);
    //upper shamfer
    translate([0, 0, $Height + $SpacerHeight - 1.2])
      cylinder(d2 = $InnerD + 1.2, d1 = $InnerD, h = 1.2, $fn = $Sides);
    
  }
  Washer($Inner = $OuterD - 0.1, $Outer = 11, $Thickness = $SpacerHeight, $fn = 40);
//  Washer($Inner = $Bearing608InnerD - 0.1, $Outer = 16, $Thickness = 1, $fn = 40);
}

module OpticalSensor()
{
  union()
  {
    //PCB
    cube([34, 2, 16]);
     //Sensor
    translate([0, 2, 2.5])
      cube([10, 8, 14]);//Z really 11 but extended to make opening on mount
    //LED stems
    translate([27, 0, 2.5])
      rotate(90, [1, 0, 0])
        cylinder(d = 2.5, h = 10, $fn = 50);
    translate([27, 0, 13.5])
      rotate(90, [1, 0, 0])
        cylinder(d = 2.5, h = 10, $fn = 50);
    //Pot
    translate([14, -6, 8])
      cube([8, 9, 8]);
    translate([18, -6, 12])
      rotate(90, [1, 0, 0])
        cylinder(d = 4, h = 10, $fn = 50);
    //Connector
    translate([30, -3, 2])
      cube([4, 6, 15]);//Z really 12 but extended to make opening on mount
    translate([30, -11, 2])
      cube([10, 10, 15]);//Z really 12 but extended to make opening on mount
    //"Stuff"
    translate([0, -2.5, 0])
      cube([34, 2.5, 16]);
  //Mounting hole
  translate([25, 15, 8])
    rotate(90, [1, 0, 0])
      cylinder(d = 4, h = 30, $fn = 50);
  //Mounting hole captive opening
  translate([25, 10, 8])
    rotate(90, [1, 0, 0])
      cylinder(d = 7, h = 4, $fn = 50);
  }
}

module OpticalHolder()
{
  difference()
  {
    //Main holder
    cube([38, 20, 18]);
    translate([2, 10, 2])
      OpticalSensor();
  }
}

module Washer()
{
  difference()
  {
    cylinder(d = $Outer, h = $Thickness);
    translate([0, 0, -1])
      cylinder(d = $Inner, h = $Thickness + 2);
  }
}

module ActoBearingMountHoleSet($Diameter = 4, $Height = 13)
{
  translate([$XSpacing / 2, $YSpacing / 2, 0])
    cylinder(d = $Diameter, h = $Height, $fn = 40);
  translate([-$XSpacing / 2, $YSpacing / 2, 0])
    cylinder(d = $Diameter, h = $Height, $fn = 40);
  translate([$XSpacing / 2, -$YSpacing / 2, 0])
    cylinder(d = $Diameter, h = $Height, $fn = 40);
  translate([-$XSpacing / 2, -$YSpacing / 2, 0])
    cylinder(d = $Diameter, h = $Height, $fn = 40);
}

module ActoBearingMount($BlockWidth = 34, $Outer = 1, $Inset = 1, $BlockLength = 32)
{
  difference()
  {
    union()
    {
      //Main block
      translate([-$BlockWidth / 2, -32 / 2, 0])
        cube([$BlockWidth, 32, 10]);
      //Alignment ring
      translate([0, 0, -2])
        cylinder(d = 12.7, h = 2, $fn = 50);
    }
    //Bearing insert
    translate([0, 0, 10 - $Bearing608Height - 1])
      cylinder(d = $Bearing608Diameter, h = $Bearing608Height + 1, $fn = 50);
    //Shaft opening
    translate([0, 0, -2])
//      cylinder(d = $Bearing608InnerD + 1, h = 13, $fn = 50);
      cylinder(d = 12.7 - 0.8, h = 13, $fn = 50);
    //Primary hole set
    ActoBearingMountHoleSet($YSpacing = 27, $XSpacing = 11);
    if ($Inset == 1)
      translate([0, 0, 10 - 3])
      ActoBearingMountHoleSet($YSpacing = 27, $XSpacing = 11, $Diameter = 6.5);
    if ($Outer == 1)
    {
      //Secondary hole set for large width block
      ActoBearingMountHoleSet($YSpacing = 27, $XSpacing = 27);
      if ($Inset == 1)
        translate([0, 0, 10 - 3])
          ActoBearingMountHoleSet($YSpacing = 27, $XSpacing = 27, $Diameter = 8.5);
    }
    
    //Inner frame chamfers
    translate([-$BlockWidth / 2, (32 / 2) - 2, 0])
      rotate(-45, [1, 0, 0])
        cube([$BlockWidth, 5, 5]);
    mirror([0, 1, 0])
      translate([-$BlockWidth / 2, (32 / 2) - 2, 0])
        rotate(-45, [1, 0, 0])
          cube([$BlockWidth, 5, 5]);    
  }
  //Bearing spacer lip
  translate([0, 0, 10 - $Bearing608Height - 1])
    Washer($Inner = $Bearing608Diameter - 2, $Outer = $Bearing608Diameter, $Thickness = 1, $fn = 40);
}

module ActoBearingMountCap($BlockWidth = 34, $Outer = 1, $Clearance = 0.6)
{
  intersection()
  {
    difference()
    {
      union()
      {
        translate([-$BlockWidth / 2, -32 / 2, 0])
          cube([$BlockWidth, 32, 1]);
        translate([0, 0, -2.9])
          ActoBearingMountHoleSet($YSpacing = 27, $XSpacing = 11, $Diameter = 6.5 - $Clearance, $Height = 3);
        if ($Outer == 1)
        {
          translate([0, 0, -2.9])
            ActoBearingMountHoleSet($YSpacing = 27, $XSpacing = 27, $Diameter = 8.5 - $Clearance, $Height = 3);
        }
      }
      cylinder(d = $Bearing608Diameter - 2, h = 5, center = true, $fn = 30);
      translate([0, 0, -5])
      {
        //Primary hole set
        ActoBearingMountHoleSet($YSpacing = 27, $XSpacing = 11);
        if ($Outer == 1)
        {
          //Secondary hole set for large width block
          ActoBearingMountHoleSet($YSpacing = 27, $XSpacing = 27);
        }
      }
    }
    translate([-$BlockWidth / 2, -32 / 2, -7])
      cube([$BlockWidth, 32, 10]);
  }
}

module HexMotorMountHoles()
{
  cylinder(d = 10, h = 20, center = true);
  for (i = [0:6])
    rotate(360 * i / 6, [0, 0, 1])
      translate([16 / 2, 0, 0])
        cylinder(d = 3.5, h = 20, center = true, $fn = 20);
}

module TetrixHoleOppositeSet()
{
  translate([0, $TetrixShaftHoleSpacing / 2, 0])
    cylinder(d = $TetrixMountHoleDiameter + $TetrixAdjust, h = $Height, center = true);
  translate([0, -$TetrixShaftHoleSpacing / 2, 0])
    cylinder(d = $TetrixMountHoleDiameter + $TetrixAdjust, h = $Height, center = true);
}

module TetrixHoleCloseSet()
{
  rotate(-45, [0, 0, 1])
    translate([0, $TetrixShaftHoleSpacing / 2, 0])
      cylinder(d = $TetrixMountHoleDiameter + $TetrixAdjust, h = $Height, center = true);
  rotate(45, [0, 0, 1])
    translate([0, -$TetrixShaftHoleSpacing / 2, 0])
      cylinder(d = $TetrixMountHoleDiameter + $TetrixAdjust, h = $Height, center = true);
}

module TetrixHoles($Type = 0, $HolePattern = 15, $Center = true)
{
  if ($Center)
    cylinder(d = $TetrixShaftHoleDiameter + $TetrixAdjust, h = $Height, center = true);
  if ($Type == 0)
  {
    if (bit_set(0, $HolePattern))
      TetrixHoleOppositeSet();
    if (bit_set(1, $HolePattern))
      rotate(90, [0, 0, 1])
        TetrixHoleOppositeSet();
    if (bit_set(2, $HolePattern))
        TetrixHoleCloseSet();
    if (bit_set(3, $HolePattern))
      mirror([1, 0, 0])
        TetrixHoleCloseSet();
  }
  else if ($Type == 2)
  {
    if (bit_set(0, $HolePattern))
      TetrixHoleOppositeSet();
    if (bit_set(1, $HolePattern))
      rotate(90, [0, 0, 1])
        TetrixHoleOppositeSet();
  }
}

module TetrixHolePattern($Count = 1, $StartType = 0, $Centers = 65535)
{
  for ($x = [0:$Count - 1])
  {
    translate([$TetrixShaftHoleSpacing * $x, 0, 0])
      TetrixHoles($Type = and($StartType + $x, 3), $HolePattern = $Pattern[$x], $Center = bit_set($x, $Centers));
  }
  
}

module TetrixNarrowBearingMount()
{
  difference()
  {
    translate([-40/2, -27/2, 0])
      cube([40, 27, 10]);
    //Inner shamfer
    translate([0, -(27/2) -5, 0])
      rotate(45, [1, 0, 0])
        cube([41, 10, 10], center = true);
    translate([0, (27/2) +5, 0])
      rotate(45, [1, 0, 0])
        cube([41, 10, 10], center = true);

    //Bearing insert
    translate([0, 0, 10 - $Bearing608Height - 1])
      cylinder(d = $Bearing608Diameter, h = $Bearing608Height + 1, $fn = 50);
    //Mount holes
    translate([-$TetrixShaftHoleSpacing, 0, 0])
      TetrixHolePattern($Height = 30, $Count = 3, $StartType = 0, $Pattern = [1, 0, 1], $Centers = 2, $TetrixShaftHoleDiameter = 15);
  }
}

module TetrixWideBearingMount()
{
  difference()
  {
    translate([-72/2, -27/2, 0])
      cube([72, 27, 10]);
    //Inner shamfer
    translate([0, -(27/2) -5, 0])
      rotate(45, [1, 0, 0])
        cube([73, 10, 10], center = true);
    translate([0, (27/2) +5, 0])
      rotate(45, [1, 0, 0])
        cube([73, 10, 10], center = true);

    //Bearing insert
    translate([0, 0, 10 - $Bearing608Height - 1])
      cylinder(d = $Bearing608Diameter, h = $Bearing608Height + 1, $fn = 50);
    //Mount holes
    translate([-$TetrixShaftHoleSpacing * 2, 0, 0])
      TetrixHolePattern($Height = 30, $Count = 5, $StartType = 2, $Pattern = [1+2, 0, 0, 0, 1+2], $Centers = 4, $TetrixShaftHoleDiameter = 15);
  }
}

module TetrixEdgeBearingMount()
{
  difference()
  {
    TetrixWideBearingMount($fn = 50);
    translate([40, 0, 0])
      cube([50, 50, 50], center = true);
  }
}

module GoBildaMecanumMountHoleSet()
{
  echo ("GoBildaMecanumMountHoleSet H", $H);
  for (i = [0:3])
  {
    rotate((360 / 4) * i, [0, 0, 1])
    translate([8, 8, 0])
    {
      cylinder(d = $Diameter, h = $H, center = true);
      translate([0, 0, -($H / 2) - 0.05])
        cylinder(d2 = $Diameter, d1 = $Diameter + 1, h = 1);
      translate([0, 0, ($H / 2) - 1 + 0.05])
        cylinder(d1 = $Diameter, d2 = $Diameter + 1, h = 1);
    }
  }
}

module GoBildaMecanumMount($DoSprocket = 0, $SpacerHeight = 0, $DoCountersink = 1, $SprocketTeethCount = 21, $AxleDiameter = 30, $CountersinkDepth = 3, $MainHubHeight = 17)
{
  $ChainSize = 25;
  $ChainGuideAngle = 25;
  $fn = 50;
  
  $SprocketClearance = 2;

  difference()
  {
    union()
    {
      translate([0, 0, (-$MainHubHeight / 2)])
        cylinder(d = 36, h = 10);
      //Wheel alignment hub
      translate([0, 0, -($MainHubHeight/2) - 5])
        cylinder(d = 13.7, h = 5);
      if ($DoSprocket == 1)
      {
        translate([0, 0, ($MainHubHeight/2) + $SprocketClearance])
        {
          sprocket($ChainSize, $SprocketTeethCount, 0, 0, 0, $ChainGuideAngle);
          translate([0, 0, -$MainHubHeight])
            cylinder(d = $AxleDiameter, h = $MainHubHeight);
          if ($SpacerHeight >0)
            translate([0, 0, 2.5])
              cylinder(d = 18, h = $SpacerHeight);
        }
      }
      else if ($DoSprocket == 2)
      {
        translate([0, 0, ($MainHubHeight/2) + $SprocketClearance])
        {
          cylinder(d = 40, h = 4);
          translate([0, 0, -$MainHubHeight])
            cylinder(d = $AxleDiameter, h = $MainHubHeight);
          if ($SpacerHeight >0)
            translate([0, 0, 2.5])
              cylinder(d = 18, h = $SpacerHeight);
        }
      }
    }
    //Hex shaft
    cylinder(d = $HexShaftD, h = 40, center = true, $fn = 6);
    //Wheel mount holes
    GoBildaMecanumMountHoleSet($Diameter = 3.5, $H = 35);
    //Wheel mount screw head openings
    if ($DoCountersink == 1)
    {
      translate([0, 0, $MainHubHeight + $SpacerHeight + 3.8 - $CountersinkDepth])
        GoBildaMecanumMountHoleSet($Diameter = 6.2);
    }
    //Grub screw holes
    translate([0, 0, 5])
      rotate(90, [1, 0, 0])
        cylinder(d = 3, h = 40, center = true);
    //Grub screw nut openings
    translate([0, 10, 10.5])
      cube([5.2, 2.4, 20], center = true);
    translate([0, -10, 10.5])
      cube([5.2, 2.4, 20], center = true);
    /*
    //Grub screw flat faces
    translate([0, 36 / 2, 0])
      cube([40, 3, 20], center = true);
    translate([0, -36 / 2, 0])
      cube([40, 3, 20], center = true);
    */
  }
}

module SmallPulleyCap()
{
  $PlateLength = 30;
  $FlatThickness = .4;
  $HubInnerDiameter = 3.2;
  $HubOuterDiameter = 6;
  $HubHeight = .2;
  $HubOffset = .4;
  $BearingDiameter = 12;
  $BearingThickness = 4;
  $ChannelDiameter = 4.5;
  $OuterThickness = 2;
  $CapDiamater = $BearingDiameter + $ChannelDiameter + $OuterThickness;
  $TorusOffset = ($ChannelDiameter - $BearingThickness) / 2;
  $DoPlate = 1;
  
  $fn = 40;
//  translate([0, 0, $FlatThickness + $HubHeight + $HubOffset])
//    color("silver")
//      cylinder(d = $BearingDiameter, h = $BearingThickness);
  
  difference()
  {
    union()
    {
      cylinder(d = $CapDiamater, h = $ChannelDiameter + $FlatThickness + $HubHeight );
      if ($DoPlate == 1)
      {
        translate([-$PlateLength / 2, 0, 0])
          cube([$PlateLength, 17/2, 2]);
      }
    }
    //Chop half off
    translate([-10, -20, -0.1])
      cube([20, 20, 10]);
    //Inner torus
    translate([0, 0, $HubHeight + ($ChannelDiameter / 2) + $FlatThickness - $TorusOffset])
      rotate_extrude(convexity = 10)
        translate([$BearingDiameter / 2, 0, 0])
          circle(d = $ChannelDiameter);
    //Central opening
    cylinder(d = $CapDiamater - $ChannelDiameter - $OuterThickness, h = 20); 
    //Mount holes
    translate([12, 5, -0.1])
      cylinder(d = 3, h = 20);
    translate([-12, 5, -0.1])
      cylinder(d = 3, h = 20);
  }
  
  Washer($Inner = $HubInnerDiameter, $Outer = $CapDiamater, $Thickness = $FlatThickness);
  Washer($Inner = $HubInnerDiameter, $Outer = $HubOuterDiameter, $Thickness = $FlatThickness + $HubHeight + $HubOffset);
}

module BoxExtrusionInsert($Length = 40, $Rounding = 4)
{
  $InnerWidth = 45.5;
  $InnerHeight= 20.45;
  
  hull()
  {
    cylinder(d = $Rounding, h = $Length, $fn = 30);
    translate([$InnerWidth - $Rounding, 0, 0])
      cylinder(d = $Rounding, h = $Length, $fn = 30);
    translate([$InnerWidth - $Rounding, $InnerHeight - $Rounding, 0])
      cylinder(d = $Rounding, h = $Length, $fn = 30);
    translate([0, $InnerHeight - $Rounding, 0])
      cylinder(d = $Rounding, h = $Length, $fn = 30);
  }
}

module CChannel($Length = 100)
{
  $OuterWidth = 48.0;
  $InnerWidth = 43;
  $OuterDepth = 12.0;
  $InnerDepth = 9.5;
  $HoleSpacing = 8;
  $HoleDiameter = 4;
  
  $HoleCount = $Length / $HoleSpacing;

  difference()
  {
    cube([$Length, $OuterDepth, $OuterWidth]);
    translate([-0.1, -0.1, ($OuterWidth - $InnerWidth) / 2])
      cube([$Length + 0.2, $InnerDepth + 0.1, $InnerWidth]);
    for ( i = [1 : $HoleCount] )
    {
      //Short side hole pairs
      translate([$HoleSpacing * i, $HoleSpacing / 2, -0.1])
        cylinder(d = $HoleDiameter, h = $OuterWidth + 0.2);
      //Large face set 1
//      translate([$HoleSpacing * i, 0, $OuterDepth - ($HoleSpacing / 2)])
      translate([$HoleSpacing * i, 0, ($OuterWidth / 2) + (2 * $HoleSpacing)])
        rotate(-90, [1, 0, 0])
          cylinder(d = $HoleDiameter, h = 20);
//      translate([$HoleSpacing * i, 0, $OuterWidth - $OuterDepth + ($HoleSpacing / 2)])
      translate([$HoleSpacing * i, 0, ($OuterWidth / 2) - (2 * $HoleSpacing)])
        rotate(-90, [1, 0, 0])
          cylinder(d = $HoleDiameter, h = 20);
    }
  }


}

module RoundedBlock($XDim = 43, $YDim = 43, $ZDim = 9.6, $CurveD = 4)
{
  hull()
  {
    translate([-($XDim - $CurveD)/ 2, -($YDim  - $CurveD)/ 2, -($ZDim - $CurveD) / 2])
      sphere( d = $CurveD, $fn = 50);
    translate([($XDim - $CurveD)/ 2, -($YDim  - $CurveD)/ 2, -($ZDim - $CurveD) / 2])
      sphere( d = $CurveD, $fn = 50);
    translate([-($XDim - $CurveD)/ 2, ($YDim  - $CurveD)/ 2, -($ZDim - $CurveD) / 2])
      sphere( d = $CurveD, $fn = 50);
    translate([($XDim - $CurveD)/ 2, ($YDim  - $CurveD)/ 2, -($ZDim - $CurveD) / 2])
      sphere( d = $CurveD, $fn = 50);
    translate([-($XDim - $CurveD)/ 2, -($YDim  - $CurveD)/ 2, ($ZDim - $CurveD) / 2])
      sphere( d = $CurveD, $fn = 50);
    translate([($XDim - $CurveD)/ 2, -($YDim  - $CurveD)/ 2, ($ZDim - $CurveD) / 2])
      sphere( d = $CurveD, $fn = 50);
    translate([-($XDim - $CurveD)/ 2, ($YDim  - $CurveD)/ 2, ($ZDim - $CurveD) / 2])
      sphere( d = $CurveD, $fn = 50);
    translate([($XDim - $CurveD)/ 2, ($YDim  - $CurveD)/ 2, ($ZDim - $CurveD) / 2])
      sphere( d = $CurveD, $fn = 50);
  }
}

module CoreHexMotor()
{
  import("CoreHex.stl");
}

module CaptiveBoltSlot($ShaftL = 20, $ShaftD = 4.3, $HeadD = 6, $HeadL = 3, $Spacing = 2, $Angle = 0, $Orientation = [0, 0, 0], $Units = 1)
{
//  rotate($Angle, $Orientation)
  rotate($Angle, $Orientation)
  {
    scale($Units)
    {
      //Bolt shaft
      hull()
      {
        translate([$Spacing / 2, 0, 0])
          cylinder(d = $ShaftD, h = $ShaftL);
        translate([-$Spacing / 2, 0, 0])
          cylinder(d = $ShaftD, h = $ShaftL);
      }
      hull()
      {
        translate([$Spacing / 2, 0, 0])
          cylinder(d = $HeadD, h = $HeadL, $fn = 6);
        translate([-$Spacing / 2, 0, 0])
          cylinder(d = $HeadD, h = $HeadL, $fn = 6);
      }
    }
  }
}

module Extrusion($Size = 15, $Length = 100, $Offset = 0)
{
  color("lightgray")
  {
  translate([-$Offset, -$Size / 2, -$Size / 2])
    cube([$Length, $Size, $Size]);
  }
}

module DoRotate(Angle, Offset)
{
  //Move back up
  translate([Offset, 0, 0])
    rotate(Angle, [0, 1, 0])
      //Move down to the point of rotation
      translate([-Offset, 0, 0])
        children();
}

module DoTranslateRotate(Angle, CenterSpacing)
{
  rotate(Angle, [0, 1, 0])
    translate([CenterSpacing, 0, 0])
      rotate(-Angle, [0, 1, 0])
        children();
}

module RoundMetalServoHornCutout($AttachThickness = 2)
{
    {
      translate([0, 0, -4])
        cylinder(d = 9.3, h = 4);
      translate([0, 0, -10 - 4])
        cylinder(d = 23.2, h = 10);
    }
    
    translate([0, 8, - 4 + $AttachThickness])
      cylinder(d = 6.3, h = 4 - $AttachThickness);
    translate([0, 8, - 4])
      cylinder(d = 3.2, h = 4);

    translate([0, -8, - 4 + $AttachThickness])
      cylinder(d = 6.3, h = 4 - $AttachThickness);
    translate([0, -8, - 4])
      cylinder(d = 3.2, h = 4);

    translate([8, 0, - 4 + $AttachThickness])
      cylinder(d = 6.3, h = 4 - $AttachThickness);
    translate([8, 0, - 4])
      cylinder(d = 3.2, h = 4);

    translate([-8, 0, - 4 + $AttachThickness])
      cylinder(d = 6.3, h = 4 - $AttachThickness);
    translate([-8, 0, - 4])
      cylinder(d = 3.2, h = 4);
}

module HexGearCheckFlags()
{
  slope = .2;
  translate([0, 15, 0])
  {
    cylinder(d1 = 8.25 + slope, d2 = 8.25 - slope, h = 8 + 3, $fn = 3);
    translate([20, 0, 0])
      cylinder(d = 10, h = 3, $fn = 3);
    translate([-1, -2.5, 0])
      cube([20, 5, 3]);
  }
  difference()
  {
    cylinder(d = 15, h = 3);
    cylinder(d = 8.25, h = 3);
  }
    translate([20, 0, 0])
      cylinder(d = 10, h = 3, $fn = 3);
    translate([6, -2.5, 0])
      cube([14, 5, 3]);
  
}

module ExtrusionSlide()
{
  difference()
  {
    translate([-$BlockWidth / 2, 0, 0])
      cube([$BlockWidth, $BlockDepth, $BlockHeight]);
    translate([-$ExtrusionSize / 2, -0.1, -0.1])
      cube([$ExtrusionSize, $ExtrusionSize + .1, $BlockHeight + 0.2]);
    for (i = [0:$Holes - 1])
    {
      translate([0, ($ExtrusionSize / 2) - $HOffset, 10 + (i * (($BlockHeight - 20) / ($Holes - 1)))])
        rotate(90, [0, 1, 0])
          cylinder(d = $HoleD, h = $BlockWidth + 1, center = true);
    }
  }
}

module ShamferedShaft($DOver = 1, $HOver = 1)
{
  cylinder(d = $D, h = $H);
  translate([0, 0, $H - $HOver])
    cylinder(d1 = $D, d2 = $D + $DOver, h = $HOver);
  cylinder(d2 = $D, d1 = $D + $DOver, h = $HOver);
}
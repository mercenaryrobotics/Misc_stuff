use <D:\3D Printer & Laser Cutter\3D models\Robotics\Library\Getriebe.scad>
include <D:\3D Printer & Laser Cutter\3D models\Robotics\Library\RobotPrimitives.scad>
use <D:\3D Printer & Laser Cutter\3D models\Robotics\Library\Sprockets.scad>
use <D:\3D Printer & Laser Cutter\3D models\MCAD\involute_gears.scad>

// sprocket(size, teeth, bore, hub_diameter, hub_height, guideangle);

//rotate(-90, [0, 1, 0])
  // arrow bevel gear (module = 1, number of teeth = 30, partial cone angle = 45, tooth width = 5, bore = 4,  pressure angle = 20, helix angle = 30);
//  pfeilkegelrad(      modul=1,    zahnzahl=30,          teilkegelwinkel=45,      zahnbreite=5,    bohrung=4, eingriffswinkel=20,  schraegungswinkel=30);


$Action = 1;// [1:Display, 2:Print, 3:Individual]

$Object = 1;// [1:Inside Motor Mount Vertical Set, 2:Inside Motor Mount Vertical Frame, 3:Motor Shaft Gear, 4:Inside Motor Mount Vertical Drive Gear, 5:Bearing Test Block, 6:Wheel hub, 7: VerticalDriveStack, 8: VerticalStackMainFrame, 9: DriveShaftGearInvolute, 10: WheelMountInvolute, 11: Vertical Stack Set, 12: Bearing shims]

/* [Bearing types] */
//Left bearing type
$GearboxBearingType1   = 1; // [0:Rev Hex Block, 1:0608 Skate Bearing, 2:0625 Skate Bearing]
//Motor bearing type
$GearboxBearingType2   = -1; // [-1: No bearing, 0:Rev Hex Block, 1:0608 Skate Bearing, 2:0625 Skate Bearing]
//Right bearing type
$GearboxBearingType3   = 1; // [0:Rev Hex Block, 1:0608 Skate Bearing, 2:0625 Skate Bearing]
//Wheel frame bearing type
$WheelFrameBearingType = 1; // [0:Rev Hex Block, 1:0608 Skate Bearing, 2:0625 Skate Bearing]

/* [Frame attach] */
//Frame attach mount type
$WheelSideMount = 0;    //[0:Outside wings, 1:No wings]
//Frame attach mount type
$MotorSideMount = 0;    //[0:Outside wings, 1:No wings]

/* [Misc tweaks] */
$ShimCount = 2;
$ShimSpacerHeight = 1.2;
$GearboxAccessSize = 4;
$MotorMountAccessHole = 7;

$Bearing0608HOversize = 0.2;
$Bearing0625HOversize = 0.05;
$HexShaftD = $AluminumHexShaftD;

$ShowMotor = false;

/* [Hidden] */
$WheelVerticalOffset = -6.5;
$InvoluteNudge = .7;

$SimpleSprocket = 1;

//Version 1 parameters
$DriveGearOffset = 22.572;
$WheelSpacing = 90;//83;//77.75;//80;
$OuterChainClearance = 4.5;
$FrameLength = 168;
$GearboxWidth = 56;
$CenterNudge = 2;

//Version 2 parameters
$DriveGearCenterOffset = 65.8;
$MotorMountWidth = 44;
$MotorMountHeight = 50;
$MotorMountPlatThickness = 4;
$BearingBlockWidth = 30;
$BearingBlockWidthOffset = 5;
$BearingBlockLengh = 25;
$BearingBlockLenghOffset = 9;
$BearingBlockHeight = $MotorMountHeight;

//Dual version parameters
$MotorShroudLength = 30;
$FrameHeight = 43;

$OuterFrameOffset = 40;

module MotorTemplate()
{
  rotate(-90, [1, 0, 0])
   translate([0, 0, -42])
     HDAndGearbox($Stages = 2);
  rotate(-30, [0, 1, 0])
    translate([0, -5, 0])
      color([.5, .2, .8])
        cylinder(d = 2, h = 80, $fn = 10, center = true);
}

module GoBildaMechWheel($ShowHubs = true)
{
  rotate(90, [0, 1, 0])
  {
    color("lightgreen")
      cylinder(d = 100, h = 37, $fn = 100, center = true);
    if ($ShowHubs)
    {
      color("gray")
        translate([0, 0, -1])
        {
          rotate(180, [1, 0,0])
            translate([0, 0, -27])
              WheelOuterMount($CountersinkType = 1, $Spacer = 0, $H = 19);
            translate([0, 0, 27 - 45.5])
              WheelOuterMount($CountersinkType = 1, $Spacer = 0, $H = 19);
        }
    }
  }
}

module DriveGear($SimpleSprocket = 0, $AttatchType = 0, $BearingOffsetAdjust = 0)
{
  translate([$CenterNudge, $DriveGearOffset, 0])
  {
    difference()
    {
      union()
      {
        //Bevel gear
        translate([-21.58, 0, 0])
          rotate(90, [0, 1, 0])
            kegelrad(2,20,45,6,3,20,0);
        //Sprocket
        if ($AttatchType == 0)
        {
          translate([-29.26, 0, 0])
            rotate(90, [0, 1, 0])
              if ($SimpleSprocket)
                cylinder(d = 40, h = 2.75, $fn = 20);
              else
                sprocket(25, 17, 0, 0, 0, 25);
          //Coupler
          translate([-19, 0, 0])
            rotate(-90, [0, 1, 0])
              cylinder(d = 25, h = 8);
          //Bearing spacer
          translate([-14, 0, 0])
            rotate(-90, [0, 1, 0])
              cylinder(d = 17, h = 15 + $OuterChainClearance);
        }
        else if ($AttatchType == 1)
        {
          difference()
          {
            union()
            {
              //Bearing spacer
              translate([-14, 0, 0])
                rotate(-90, [0, 1, 0])
                  cylinder(d = 17, h = 15 + $OuterChainClearance);
              //Coupler
              translate([-21.5, 0, 0])
                rotate(-90, [0, 1, 0])
                  cylinder(d = 37, h = 7.5);
            }
            //Bearing spacer
            translate([-14 - 15 - $OuterChainClearance + 11.3 + $BearingOffsetAdjust, 0, 0])
              rotate(-90, [0, 1, 0])
                cylinder(d = 21.4, h = 21.3);
          }
        }
      }
    
      //Shaft
      translate([-40, 0, 0])
        rotate(90, [0, 1, 0])
          cylinder(d = 6, h = 80, $fn = 6);

      //Steel shaft coupler pins
      if ($AttatchType == 1)
      {
        //Fixed shaft holes
        translate([-24, 8, 0])
          rotate(90, [0, 1, 0])
            cylinder(d = 3.3, h = 20, $fn = 20);
        translate([-24, -8, 0])
          rotate(90, [0, 1, 0])
            cylinder(d = 3.3, h = 20, $fn = 20);
        //Bolt holes
        translate([-24, 0, 8])
          rotate(90, [0, 1, 0])
            cylinder(d = 3.4, h = 20, $fn = 20);
        translate([-24, 0, -8])
          rotate(90, [0, 1, 0])
            cylinder(d = 3.4, h = 20, $fn = 20);
        //Bolt head holes
        translate([-17, 0, 8])
          rotate(90, [0, 1, 0])
            cylinder(d = 6.4, h = 20, $fn = 20);
        translate([-17, 0, -8])
          rotate(90, [0, 1, 0])
            cylinder(d = 6.4, h = 20, $fn = 20);
      }
    }   
  }
}

module MotorGear()
{
  translate([$CenterNudge, 1, 0])
    rotate(-90, [1, 0, 0])
    {
      difference()
      {
        union()
        {
          //Gear
          kegelrad(2,20,45,6,3,20,0);
          //Strengthener
          translate([0, 0, -5])
            cylinder(d = 37, h = 5, $fn = 100);
          //Alignment ring
          translate([0, 0, -10])
            cylinder(d = 9, h = 10, $fn = 100);
          //Spacer ring
          translate([0, 0, -9])
            cylinder(d = 22, h = 9, $fn = 100);
        }
        {
          //Hex shaft
          translate([0, 0, -30])
          {
            cylinder(d = $HexShaftD, h = 40, $fn = 6);
            //Drive shaft mouting holes
            rotate(-30, [0, 0, 1])
              RevMountPattern($D = 3.6, $H = 40, $R = 8, $Count = 6);
          }
        }
        //Grub screw holes
        translate([0, 0, -7.5])
        {
          translate([0, 0, 5])
            rotate(90, [1, 0, 0])
              cylinder(d = 3, h = 40, center = true, $fn = 30);
          //Grub screw nut openings
          translate([0, 8, 6])
            cube([5.2, 2.4, 20], center = true);
          translate([0, -8, 6])
            cube([5.2, 2.4, 20], center = true);
          //Grub screw flats
          translate([-10, 17, 0])
            cube([20, 10, 7.5]);
          rotate(180, [0, 0, 1])
            translate([-10, 17, 0])
              cube([20, 10, 7.5]);
        }
        //Motor mount access channel
        rotate(9, [0, 0, 1])
          translate([17.2, 0, -6])
            rotate(18, [0, 1, 0])
              cylinder(d1 = 5, d2 = 2.5, h = 7, $fn = 20);
      }
    }
}

module BevelGear()
{
  //$GearHubDepth = 5, $GearHubDiameter = 37
//  translate([$CenterNudge, 1, 0])
    {
      //Gear      
      kegelrad(2,20,45,6,3,20,0);
      //Strengthener
      translate([0, 0, -$GearHubDepth])
        cylinder(d = $GearHubDiameter, h = $GearHubDepth, $fn = 100);
    }
}

module GearboxSupports()
{
  translate([-13, $DriveGearOffset, 0])
  difference()
  {
    union()
    {
      difference()
      {
        //Inside bearing frame
        translate([-17 - $OuterChainClearance, -12, -26 / 2])
          cube([$GearboxWidth + $OuterChainClearance, $FrameLength - $DriveGearOffset + 3, 26]);
        //Gear shaft bearing mount
        translate([$CenterNudge, 0, 0])
          rotate(90, [0, 1, 0])
            cylinder(d = $Bearing606Diameter, h = $Bearing606Height, $fn = 30);
        //Gear shaft opening
        rotate(90, [0, 1, 0])
          cylinder(d = 7, h = 60, $fn = 30);
        //Sprocket and gear clearance
        translate([-17 - $OuterChainClearance, 0, 0])
          rotate(90, [0, 1, 0])
            cylinder(d = 47, h = 17 + $CenterNudge + $OuterChainClearance, $fn = 30);
        //Wheel
        translate([-17 - $OuterChainClearance, $WheelSpacing, 0])
          rotate(90, [0, 1, 0])
            cylinder(d = 106, h = 70, $fn = 30);
        //Motor shaft bearing mount
        translate([13 + $CenterNudge, 10 + $Bearing606Height, 0])
          rotate(-90, [1, 0, 0])
            cylinder(d = $Bearing606Diameter, h = $Bearing606Height + 5, $fn = 30);
        //Motor shaft opening
        translate([13 + $CenterNudge, 30, 0])
          rotate(90, [1, 0, 0])
            cylinder(d = 7, h = 50, $fn = 30);
        //Access hole for Motor spur gear bolts
        translate([19.93 + $CenterNudge, -26, 4])
          rotate(-90, [1, 0, 0])
            cylinder(d = 5, h = 60, $fn = 30);
        
      }
      //Outer bearing frame, non gear side
      translate([$GearboxWidth + 8.5, 0, 0])
        difference()
        {
          //Frame
          translate([-25.5, -36 - $MotorShroudLength, -$FrameHeight / 2])
            cube([8.5, $FrameLength + $MotorShroudLength + 4.4, $FrameHeight]);
          //Gearbox bearing/shaft
          translate([-10, 0, 0])
            rotate(-90, [0, 1, 0])
            {
                cylinder(d = 9, h = 20, $fn = 30);
            }
          //Wheelbearing
          translate([-25.5, $WheelSpacing, 0])
            rotate(90, [0, 1, 0])
            {
              cylinder(d = $Bearing606Diameter, h = $Bearing606Height, $fn = 30);
              translate([0, 0, -2])
                cylinder(d = 9, h = 20, $fn = 30);
            }
        }
      //Outer bearing frame, gear side
      translate([2.5 - $OuterChainClearance, 0, 0])
        difference()
        {
          //Frame
          translate([-25.5, -36 - $MotorShroudLength, -$FrameHeight / 2])
            cube([8.5, $FrameLength + $MotorShroudLength + 4.4, $FrameHeight]);
          //Gearbox bearing/shaft
          translate([-25.5 + 8.5 - $Bearing606Height + 0, 0, 0])
            rotate(90, [0, 1, 0])
            {
              cylinder(d = $Bearing606Diameter, h = $Bearing606Height, $fn = 30);
              translate([0, 0, -10])
                cylinder(d = 9, h = 20, $fn = 30);
            }
          //Wheelbearing
          translate([-25.49 + 8.5 - $Bearing606Height, $WheelSpacing, 0])
            rotate(90, [0, 1, 0])
            {
              cylinder(d = $Bearing606Diameter, h = $Bearing606Height, $fn = 30);
              translate([0, 0, -10])
                cylinder(d = 9, h = 20, $fn = 30);
            }
        }
      //Motor mount
      translate([-17, -36 - $MotorShroudLength, -$FrameHeight / 2])
        difference()
        {
          //Mount plate
          translate([-$OuterChainClearance, 0, 0])
          cube([$GearboxWidth + $OuterChainClearance, 4 + $MotorShroudLength, $FrameHeight]);
          translate([17 + 13 + $CenterNudge, $MotorShroudLength, $FrameHeight / 2])
          {
            //Hub opening
            rotate(90, [1, 0, 0])
              cylinder(d = 23.2, h = 10, $fn = 50, center = true);      
            rotate(-90, [1, 0, 0])
              RevMountPattern($D = 3.6, $H = 10, $R = 16);
          }
          //Motor shroud opening
          translate([17 + 13 + $CenterNudge, 0, $FrameHeight / 2])
            translate([0, $MotorShroudLength, 0])
              rotate(30, [0, 1, 0])
                rotate(90, [1, 0, 0])
                  cylinder(d = 46.5, h = $MotorShroudLength, $fn = 6);      
        }
    }
    translate([0, $FrameLength - 37, 32 / 2])
      rotate(90, [0, 1, 0])
        cylinder(d = 5, h = 120, $fn = 40, center = true);
    translate([0, $FrameLength - 37, -32 / 2])
      rotate(90, [0, 1, 0])
        cylinder(d = 5, h = 120, $fn = 40, center = true);
  }
}

module WheelInnerMount()
{
  if ($SimpleSprocket)
  {
    translate([0, 0, 11.5])
      cylinder(d = 40, h = 2.75, $fn = 20);
    translate([0, 0, 5])
      cylinder(d = 28, h = 9, $fn = 20);
    translate([0, 0, 11.5])
      cylinder(d = 18, h = 7, $fn = 20);
  }
  else
    GoBildaMecanumMount($DoSprocket = 1, $SpacerHeight = $OuterChainClearance, $DoCountersink = 1, $SprocketTeethCount = 17, $AxleDiameter = 28, $MainHubHeight = 19, $CountersinkDepth = 6);
}

module Gearbox()
{
  /*
  translate([0, 1, 0])
    rotate(-90, [1, 0, 0])
      // bevel gear pair (module = 1, number of teeth gear = 30, number of teeth pinion = 11, axis angle = 100, tooth width = 5, pressure angle = 20,  helix angle = 20,     assembled_ = true,   Bore 1,          Bore 2);
      kegelradpaar(       modul=2,    zahnzahl_rad=20,           zahnzahl_ritzel=20,          achsenwinkel=90,  zahnbreite=6,    eingriffswinkel = 20, schraegungswinkel=0, zusammen_gebaut=true, bohrung_rad = 3, bohrung_ritzel = 3);
  */
  
  color("Blue")
    DriveGear();
  color("Green")
    MotorGear();
  color("LightBlue")
    GearboxSupports();
}

module DisplayGearbox()
{
  translate([$CenterNudge, -7, 0])
    rotate(30, [0, 1, 0])
      MotorTemplate();


  Gearbox();

  translate([0, $WheelSpacing + $DriveGearOffset, 0])
  {
    GoBildaMechWheel();
    color("Red")
      translate([-15 + $CenterNudge, 0, 0])
        rotate(-90, [0, 1, 0])
          WheelInnerMount();
  }
  
  translate([-25.8, 64, 17])
  color([0.1, 0.1, 0.1, .7])
    cube([10, 100, 6], center = true);

//  color("silver")
//    translate([-41, -80, 0])
//      ActobotixExtrusion($Length = 300);
}

module BevelGearPair($AlignMotorCenter = 0, $AlignDriveCenter = 0)
{
  if ($AlignMotorCenter)
  {
    translate([-2, 9, 0])
    {
      color("Blue")
        DriveGear();
      color("Green")
        MotorGear();
    }
  }
  else if ($AlignDriveCenter)
  {
    translate([31.55, -22.6, 0])
    {
      color("Blue")
        DriveGear();
      color("Green")
        MotorGear();
    }
  }
}


module GearboxVertical($MountStyle = 0, $HorizontalChain = 1)
{
  difference()
  {
    union()
    {
      //Motor mount and gear mount
      rotate(-90, [1, 0, 0])
        translate([0, -$DriveGearCenterOffset, 0])
          GearboxMotorSupportHub();
      //Motor mount to gear mount frame
      difference()
      {
        union()
        {
          translate([-(($MotorMountWidth) / 2), -($BearingBlockHeight / 2) - 5, -($BearingBlockLengh / 2)  - $BearingBlockLenghOffset])
            cube([$MotorMountWidth , 5, $MotorShroudLength + 57.3]);
          translate([-(($MotorMountWidth) / 2), ($BearingBlockHeight / 2) , -($BearingBlockLengh / 2)  - $BearingBlockLenghOffset])
            cube([$MotorMountWidth, 5, $MotorShroudLength + 57.3]);
        }
        translate([19, -50, 21.5])
          hull()
          {
            cube([4, 90, 2]);
            translate([4, 0, 4])
              cube([4, 90, 2]);
          }
      }
      if ($MountStyle == 0)
      {
        LowerSeperator($DoBearing = 0, $Style = 0);
        translate([-12, 0, 0])
          mirror([1, 0, 0])
            LowerSeperator($DoClearance = 0, $Style = 0);
      }
      else
      {
        LowerSeperator($DoBearing = 0, $Style = 2);
        translate([-12, 0, 0])
          mirror([1, 0, 0])
            LowerSeperator($DoClearance = 0, $Style = 1);
      }
      //Drive side seperator attachments
      translate([-43.4, -30, -21.5])
        cube([25, 5, 43]);

      if ($HorizontalChain == 1)
      {
        translate([-43.4, 25, -10])
          cube([25, 5, 20]);
      }
      else
      {
        translate([-43.4, 25, -21.5])
          cube([25, 5, 43]);
     }
    }
    translate([0, 0, 34.8])
      rotate(90, [1, 0, 0])
        cylinder(d = 4, h = 100, $fn = 20, center = true);
  }
}

module LowerSeperator($DoClearance = 1, $DoBearing = 1, $Style = 0)
{
  translate([22, -30, -21.5])
  {
    difference()
    {
      //Channel insertion
      if ($Style == 0)
      {
        cube([9.4, 96, 43]);
      }
      else if ($Style == 1)
      {
        translate([0, -20, 0])
        cube([9.4, 100, 43]);
      }
      else
      {
        cube([9.4, 60, 43]);
      }
      
      if ($DoClearance == 1)
      {
        //Drive gear clearance
        translate([0, 5, 34])
          cube([15, 50, 10]);
      }
      
      if ($Style == 0)
      {
        //Clamp region
        translate([0,60, 0])
          cube([15, 50, 23.4]);
        //Clamp bolt openings
        hull()
        {
          translate([5.15 - 1.15, 74 - 11, 0])
            cylinder(d = 3.3, h = 50, $fn = 30);
          translate([5.15 - 1.15, 74 + 16, 0])
            cylinder(d = 3.3, h = 50, $fn = 30);
        }
      }
      else if ($Style == 1)
      {
        translate([0, 30, 21.5])
        {
          rotate(90, [0, 1, 0])
          {
            translate([12, 40, 0])
              cylinder(d = 4, h = 30, center = true, $fn = 40);
            translate([-12, 40, 0])
              cylinder(d = 4, h = 30, center = true, $fn = 40);
            translate([12, -40, 0])
              cylinder(d = 4, h = 30, center = true, $fn = 40);
            translate([-12, -40, 0])
              cylinder(d = 4, h = 30, center = true, $fn = 40);
          }
        }
      }

      //Shaft opening
      translate([0, 30, 21.55])
      {
        rotate(90, [0, 1, 0])
          cylinder(d = 17, h = 40, $fn = 30, center = true);
        if ($DoBearing == 1)
        {
            BearingReceptical($Type="608", $DOversize = 0.2, $HOversize = 0, $Rotate = [0, 1, 0]);
        }
      }
    }
  }
}

module UpperSeperator()
{
  translate([22, 40, -21.5])
  {
    difference()
    {
      //Channel insertion
      cube([9.4, 70, 43]);
      //Clamp region
      translate([-1, 0, 23])
        cube([15, 36, 20.5]);
      translate([20, 50, 21.5])
      {
        //Wheel shaft opening
        rotate(-90, [0, 1, 0])
          cylinder(d = 12, h = 100, $fn = 30);
        //Wheel shaft bearing
        translate([-20, 0, 0])
          BearingReceptical($Type="608", $DOversize = 0, $HOversize = 0, $Rotate = [0, 1, 0]);
      }
      //Clamp bolt openings
      translate([5.15 - 1.15, 4, -1])
        cylinder(d = 3.3, h = 50, $fn = 30);
      translate([5.15 - 1.15, 4, 0])
        rotate(30, [0, 0, 1])
          cylinder(d = 6.4, h = 7, $fn = 6);
      translate([5.15 - 1.15, 4 + 16, 0])
        cylinder(d = 3.3, h = 50, $fn = 30);
      translate([5.15 - 1.15, 4 + 16, 0])
        rotate(30, [0, 0, 1])
          cylinder(d = 6.4, h = 7, $fn = 6);
            
    }
  }
}

module DisplayMotorAndGears()
{
  //Display motor and gears
  translate([0, -$DriveGearCenterOffset, 0])
  {
    translate([0, $MotorShroudLength + 4.2, 0])
      BevelGearPair($AlignMotorCenter = 1);
    translate([0, 1 + 5 + $MotorShroudLength, 0])
      rotate(30, [0, 1, 0])
        MotorTemplate();
  }
}

module WheelSupport($IncludeBrace = 1, $ClearAccessTop = 1, $ClearAccessBottom = 1)
{
  difference()
  {
    union()
    {
      UpperSeperator();
      translate([-12, 0, 0])
        mirror([1, 0, 0])
          UpperSeperator();
      if ($IncludeBrace == 1)
      {
        difference()
        {
          translate([-43.4, 110, -21.5])
            cube([74.8, 45, 43]);
          translate([-34, 100, -21.5])
            cube([56, 45, 43]);
        }
      }
    }
    if ($ClearAccessTop == 1)
    {
      translate([-50, 105, 21.5 - 11])
        cube([100, 50, 11]);
    }
    if ($ClearAccessBottom == 1)
    {
      translate([-50, 105, -21.5])
        cube([100, 50, 11]);
    }
  }
}

module DisplayVerticalGearbox()
{
  rotate(-90, [1, 0, 0])
    DisplayMotorAndGears();
  GearboxVertical();  
  WheelSupport();

  translate([-2, $WheelSpacing, 0])
  {
    GoBildaMechWheel();
    color("Red")
      translate([-15 + $CenterNudge, 0, 0])
        rotate(-90, [0, 1, 0])
          WheelInnerMount();
  }
  /*
  translate([-6, 0, 0])
    color("silver")
      translate([$OuterFrameOffset, -80, 0])
        rotate(180, [0, 1, 0])
          ActobotixExtrusion($Length = 300);
  */
  //Rail spacing test check
#  translate([-38, 40, 0])
    {
      cylinder(d = 3.4, h = 70, $fn = 30);
      translate([64, 0, 0])
        cylinder(d = 3.4, h = 70, $fn = 30);
    }
}

module GearboxMotorSupportHub()
{  
    //Motor mount
    difference()
    {
      //Mount plate
      translate([-$MotorMountWidth / 2, 30 - $MotorShroudLength, -$MotorMountHeight / 2])
        cube([$MotorMountWidth, $MotorMountPlatThickness + $MotorShroudLength, $MotorMountHeight]);
      translate([0, 30 - 1, 0])
      {
        //Hub opening
        rotate(90, [1, 0, 0])
          cylinder(d = 23.2, h = 20, $fn = 50, center = true);      
        translate([0, -10, 0])
          rotate(-90, [1, 0, 0])
          RevMountPattern($D = 3.6, $H = 20, $R = 16);
      }
      //Motor shroud opening
        translate([0, 30 - 1, 0])
          rotate(30, [0, 1, 0])
            rotate(90, [1, 0, 0])
              cylinder(d = 45.5, h = $MotorShroudLength, $fn = 6);      
    }
    //Inner bearing block
    translate([0, $DriveGearCenterOffset, 0])
      difference()
      {
        translate([($BearingBlockWidthOffset / 2) - 2.5, $BearingBlockLenghOffset / 2, 0])
          cube([$BearingBlockWidth - 5, $BearingBlockLengh + $BearingBlockLenghOffset, $BearingBlockHeight], center = true);
        //Shaft openings
        rotate(90, [1, 0, 0])
          cylinder(d = 10, h = 40, center = true, $fn = 30);
        rotate(90, [0, 1, 0])
          cylinder(d = 10, h = 40, center = true, $fn = 30);
        //Drive gear bearing
        translate([(-$BearingBlockWidth / 2) - .5 + 2.5, 0, 0])
          BearingReceptical($Type="608", $DOversize = 0.2, $HOversize = 0, $Rotate = [0, 1, 0]);
        //Lower motor shaft bearing
        translate([0, ($BearingBlockWidth / 2) + .01 + $BearingBlockLenghOffset - 2.5, 0])
          BearingReceptical($Type="608", $DOversize = 0, $HOversize = 0, $Rotate = [1, 0, 0]);
        //Lower motor shaft bearing shim clearance
        translate([0, 11.2, 0])
          rotate(-90, [1, 0, 0])
            cylinder(d = 16, h = 3, $fn = 40);
        //Lower bearing clamp washer holes
        translate([0, 22, 0])
          rotate(90, [1, 0, 0])
            {
              translate([0, 13, 0])
                cylinder(d = 2, h = 10, $fn = 20);
              translate([0, -13, 0])
                cylinder(d = 2, h = 10, $fn = 20);
            }
        //Motor gear mount screw access hole
        rotate(30, [0, 1, 0])
          translate([8, 0, 0])
            rotate(90, [1, 0, 0])
              cylinder(d = 5, h = 50, $fn = 20, center = true);
    }
}

module SpacerTest()
{
  translate([-5, -40, 1.5])
    rotate(180, [0, 1, 0])
    {
      difference()
      {
        WheelSupport($IncludeBrace = 0);
        translate([0, 120, 0])
          cube([100, 100, 100], center = true);
        translate([-50, 30, -46.5])
          cube([100, 100, 40]);
      }
      translate([-43.4, 70, -6.5])
        cube([74.8,5, 8]);
    }
    /*
    translate([33, 4, -2])
      cylinder(d = 3.3, h = 20, $fn = 40);
    translate([33 - 64, 4, -2])
      cylinder(d = 3.3, h = 20, $fn = 40);
    */
}



module PrintGearbox()
{
  translate([0, -5, 31.5])
    rotate(-90, [0, 1, 0])
      DriveGear();
  translate([0, -30, 9])
    rotate(90, [1, 0, 0])
      MotorGear();
  translate([0, -110, $FrameHeight / 2])
    GearboxSupports();
  translate([55, 0, 14.5])
    WheelInnerMount();
  /*
  translate([17, -4, 0])
    HexShaftBearingShim($Height = $Bearing606Height);
  translate([17 - 10, -4, 0])
    HexShaftBearingShim($Height = $Bearing606Height);
  translate([17 - 20, -4, 0])
    HexShaftBearingShim($Height = $Bearing606Height);
  translate([17 - 30, -4, 0])
    HexShaftBearingShim($Height = $Bearing606Height);
  translate([17 - 40, -4, 0])
    HexShaftBearingShim($Height = $Bearing606Height);
  translate([17 - 40, -4 + 10, 0])
    HexShaftBearingShim($Height = $Bearing606Height);
  translate([17 - 40, -4 - 10, 0])
    HexShaftBearingShim($Height = $Bearing606Height);
    */
}

module PrintVerticalGearbox()
{
  GearboxVertical();  
  translate([0, -9, 0])
    WheelSupport();
}

module PrintVerticalGearboxSet()
{
  translate([0, 0, 21.5])
  {
    GearboxVertical();  
    translate([0, -9, 0])
      WheelSupport();
  }
  for(a = [0 : 7])
  {
    translate([15, 40 + (a * 12), 0])
      HexShaftBearingShimSpacer($SpacerHeight = .4);
  }
  translate([-13, 60, 9])
    rotate(90, [1, 0,0])
      MotorGear();
  translate([-13, 110, 14.5])
    WheelInnerMount($SimpleSprocket = 0);
  translate([55, 40, 0])
    WheelOuterMount($CountersinkType = 0, $Spacer = 0, $H = 19);
  translate([55, 70, 31.5])
    rotate(-90, [0, 1, 0])
      DriveGear($SimpleSprocket = 0);
}


//PrintVerticalGearboxSet();
//PrintVerticalGearbox();
//HexShaftBearingShimSpacer($SpacerHeight = .4); // Print me as necessary
//MotorGear(); // Print me
//WheelInnerMount($SimpleSprocket = 0); // Print me
//WheelOuterMount($CountersinkType = 0, $Spacer = 0, $H = 19); // Print me
//DriveGear($SimpleSprocket = 0); // Print me

//DisplayVerticalGearbox();
//SpacerTest();
//WheelOuterMount($CountersinkType = 0, $Spacer = 0, $H = 19);
//WheelSupport($IncludeBrace = 1, $ClearAccessTop = 1, $ClearAccessBottom = 1);

//Print for Paul
//MotorGear();
//DriveGear($SimpleSprocket = 1, $AttatchType = 1, $BearingOffsetAdjust = 1);//This can be used in place of MotorGear() when using steel coupler
//GearboxVertical($MountStyle = 1, $HorizontalChain = 0);//Use for vertical chain, not for 'standard' Mecanum drive
//DriveGear($SimpleSprocket = 1, $AttatchType = 1);
//HexShaftBearingShimSpacer($SpacerHeight = 1);


/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////
//                                                                                 //
//   Modules above this point are legacy from original Mechanum drives             //
//                                                                                 //
/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

module WheelOuterMount($CountersinkType = 0, $Spacer = 0)
{
  difference()
  {
    union()
    {
      cylinder(d = 36, h = $H, $fn = 40);
      translate([0, 0, -$Spacer])
        cylinder(d = 13.7, h = $H + 2 + $Spacer, $fn = 40);
    }
    //Axle opening
    translate([0, 0, -$Spacer])
      ShamferedShaft($D = $HexShaftD, $H = $H + 2 + $Spacer, $DOver = 1, $HOver = 1, $fn = 6);
//      cylinder(d = $HexShaftD, h = 40, $fn = 6);
    //Wheel mount holes
    echo ("WheelOuterMount H", $H);
    translate([0, 0, $H / 2])
    {
      GoBildaMecanumMountHoleSet($Diameter = 3.5, $H = $H - .0, $fn = 30);
    }
    //Wheel mount nut or screw access
    if ($CountersinkType == 0)
      translate([0, 0, 4.4])
        GoBildaMecanumMountHoleSet($Diameter = 6.5, $H = 9, $fn = 6);
    else if ($CountersinkType == 1)
      translate([0, 0, (9 / 2) - 0.1])
        GoBildaMecanumMountHoleSet($Diameter = 7.5, $H = 9, $fn = 30);
    translate([0, 0, 5])
      GrubScrewPattern($ShaftD = 2.8, $ShaftL = 20, $NutFlatD = 5.20, $NutThickness = 2.4, $SlotL = 11, $SlotOffset = 7, $Angle = -90, $Orientation = [1, 0, 0], $fn = 20);
    translate([0, 18, 11])
      cube([20, 3, 23], center = true);
  }
}

module WheelMountInvolute()
{
  rotate(90, [1, 0, 0])
  {
    WheelOuterMount($CountersinkType = 1, $Spacer = 0, $H = 19.5);
      rotate(6.2, [0, 0, 1])
        gear (number_of_teeth=29,	circular_pitch=500,	gear_thickness = 5,	rim_thickness = 5,	hub_thickness = 5,	circles=0, bore_diameter=32);
  }
}

module MotorMountFrame($BoxLength = 10, $BoxHeight = 10, $BearingStyle1 = 0, $BearingStyle2 = 0, $BearingStyle3 = 0, $HInnerExtension = 0, $HOuterExtension = 0)
{
  if ($ShowMotor)
  {
    $Stages = 2;
      translate([0, 0, -(5 + (10 * $Stages) + 11)])
        HDAndGearbox();
  }
  difference()
  {
    union()
    {
      //Top motor mount
      hull()
      {
        translate([-$BoxLength / 2, -13, 0])
          cube([$BoxLength, 26, 6]);
        cylinder(d = 45, h = 6, $fn = 80);
      }
      //Middle motor bearing mount
      if ($BearingStyle2 != -1)
        translate([-$BoxLength / 2, -13 - $HInnerExtension, 28])
          cube([$BoxLength, 26 + $HInnerExtension, 6]);
      //Lower frame supprot
//      translate([-$BoxLength / 2, -13 - $HInnerExtension, $BoxHeight - 6])
//        cube([$BoxLength, 26 + $HInnerExtension, 6]);
      //Side supports
      translate([-$BoxLength / 2, -13, 0])
        cube([5, 26, $BoxHeight - 3]);
      translate([($BoxLength / 2) - 5, -13, 0])
        cube([5, 26, $BoxHeight-3]);
      //Horizontal inside boaring support
      translate([-$BoxLength / 2, -13 - $HInnerExtension, 28])
        cube([$BoxLength, 6, $BoxHeight - 28]);
//      if ($BearingStyle2 == -1)
//        translate([-40 / 2, -13 - $HInnerExtension, 28])
//          cube([40, 10, $BoxHeight - 28]);
        
      //Horizontal outside boaring support
      translate([-$BoxLength / 2, 27 + $HOuterExtension, 28])
        cube([$BoxLength, 6, $BoxHeight - 28]);
      translate([-$BoxLength / 2, 27 - 14 - $HInnerExtension - 26, 28])
        cube([5, 14 + $HOuterExtension + $HInnerExtension + 26, $BoxHeight - 31]);
      translate([($BoxLength / 2) - 5, 27 - 14 - $HInnerExtension - 26, 28])
        cube([5, 14 + $HOuterExtension + $HInnerExtension + 26, $BoxHeight - 31]);
    }
    //Motor collar grub screw opening
    translate([0, 0, 2.5])
      rotate(20, [0, 0, 1])
        rotate(90, [1, 0, 0])
            cylinder(d = 3, h = 40, $fn = 30);
    //Motor collar opening in top section
    cylinder(d = 24, h = 20);
    //Motor shaft opening on bottom section
    translate([0, 0, $BoxHeight - 18])
      cylinder(d = 10, h = 20);
    //Motor attach screws openings
    RevMountPattern($D = 3.7, $H = 10, $R = 16, $Rotate = 30);
    //Gearbox access holes
    if ($BearingStyle2 == -1)
      RevMountPattern($D = $GearboxAccessSize, $H = 20, $R = 36.9 / 2, $Rotate = 0);
    else
      RevMountPattern($D = $GearboxAccessSize, $H = 100, $R = 36.9 / 2, $Rotate = 0);
    //Motor gear mount screws access hole
    translate([-8, 0, 17])
      cylinder(d = 8, h = 20);

    //Motor mount screws access holes
    rotate(60, [0, 0, 1])
      translate([-0, -16, 20])
        cylinder(d = $MotorMountAccessHole, h = 50);
    rotate(-60, [0, 0, 1])
      translate([-0, -16, 20])
        cylinder(d = $MotorMountAccessHole, h = 50);
    rotate(120, [0, 0, 1])
      translate([-0, -16, 20])
        cylinder(d = $MotorMountAccessHole, h = 50);
    rotate(-120, [0, 0, 1])
      translate([-0, -16, 20])
        cylinder(d = $MotorMountAccessHole, h = 50);
    
    if ($BearingStyle1 == 0)
    {
      //horizontal shaft inside support bearing
      translate([0, -11 - $HInnerExtension , 40])
        rotate(-90, [1, 0, 0])
          Rev5mmHexBearingBlock($BoltHeight = 10, $Cutout = 1);
    }
    else if ($BearingStyle1 == 1)
    {            
      //horizontal shaft inside support bearing
      translate([0, -13.1 - $HInnerExtension , 40])
        rotate(-90, [1, 0, 0])
        {
          if ($BearingStyle2 == -1)
          {
            translate([0, 0, 1.2])
              BearingReceptical($Type="608", $DOversize = 0.5, $HOversize = $Bearing0608HOversize, $Rotate = [0, 0, 0]);
            //Clear so support material easy to get to
            cube([5, 22.5, 16], center = true);
          }
          else
            BearingReceptical($Type="608", $DOversize = 0.5, $HOversize = $Bearing0608HOversize, $Rotate = [0, 0, 0]);
          //Shaft/shim opening
          cylinder(d = 17, h = 11);
          //Clamp screw holes
          translate([14, 0, 0])
            cylinder(d = 2, h = 15, center = true);
          translate([-14, 0, 0])
            cylinder(d = 2, h = 15, center = true);
        }
    }
    else if ($BearingStyle1 == 2)
    {
      //horizontal shaft inside support bearing
      translate([0, -13.1 - $HInnerExtension , 40])
        rotate(-90, [1, 0, 0])
        {
          BearingReceptical($Type="625", $DOversize = 0.5,$HOversize = $Bearing0625HOversize, $Rotate = [0, 0, 0]);
          cylinder(d = 12, h = 10);
          //Clamp screw holes
          translate([11, 0, 0])
            cylinder(d = 2, h = 15, center = true);
          translate([-11, 0, 0])
            cylinder(d = 2, h = 15, center = true);
        }
      }

    if ($BearingStyle2 == 0)
    {
      translate([0, 0, 30])
        Rev5mmHexBearingBlock($BoltHeight = 10, $Cutout = 1);
    }
    else if ($BearingStyle2 == 1)
    {
      //Motor shaft support bearing
      translate([0, 0, 28.6])
        {
          BearingReceptical($Type="608", $DOversize = 0.5, $HOversize = $Bearing0608HOversize, $Rotate = [0, 0, 0]);
          cylinder(d = 17, h = 10, center = true);
          //Clamp screw holes
          translate([0, 15, 0])
            cylinder(d = 2, h = 15, center = true);
          translate([0, -15, 0])
            cylinder(d = 2, h = 15, center = true);
        }
    }
    else if ($BearingStyle2 == 2)
    {
      //Motor shaft support bearing
      translate([0, 0, 29])
        {
          //Bearing and shaft holes
          BearingReceptical($Type="625", $DOversize = 0.5, $HOversize = $Bearing0625HOversize, $Rotate = [0, 0, 0]);
          cylinder(d = 13, h = 10, center = true);
          //Clamp screw holes
          translate([0, 11, 0])
            cylinder(d = 2, h = 15, center = true);
          translate([0, -11, 0])
            cylinder(d = 2, h = 15, center = true);
        }
    }

    translate([0, $HOuterExtension - 4, 0])
    {
      if ($BearingStyle3 == 0)
      {
        //horizontal shaft outside support bearing
        translate([0, 33, 40])
          rotate(90, [1, 0,0])
            Rev5mmHexBearingBlock($BoltHeight = 10, $Cutout = 1);
      }
      else if ($BearingStyle3 == 1)
      {
        //horizontal shaft outside support bearing
        translate([0, 28, 40])
          rotate(-90, [1, 0, 0])
          {
            BearingReceptical($Type="608", $DOversize = 0.5, $HOversize = $Bearing0608HOversize, $Rotate = [0, 0, 0]);
            cylinder(d = 17, h = 11);
            //Clear so support material easy to get to
            translate([0, 0, 5])
              cube([5, 22.5, 16], center = true);

          //Clamp screw holes
          translate([14, 0, 0])
            cylinder(d = 2, h = 25, center = true);
          translate([-14, 0, 0])
            cylinder(d = 2, h = 25, center = true);
          }
        }
      else if ($BearingStyle3 == 2)
      {
        //horizontal shaft outside support bearing
        translate([0, 28.2, 40])
          rotate(-90, [1, 0, 0])
          {
            BearingReceptical($Type="625", $DOversize = 0.5, $HOversize = $Bearing0625HOversize, $Rotate = [0, 0, 0]);
            cylinder(d = 12, h = 11);
          //Clamp screw holes
          translate([11, 0, 0])
            cylinder(d = 2, h = 25, center = true);
          translate([-11, 0, 0])
            cylinder(d = 2, h = 25, center = true);
          }
        }
      }
  }
}

module InsideVerticalDriveMount()
{
  //Use children to pass motor frame in so it can be correctly cut for the holes etc...
  RailAttach($Cutout = true, $DriveClearance = $Bearing2 + 1)  
    MotorMountFrame($BoxLength = $Length, $BoxHeight = 55, $BearingStyle1 = $Bearing1, $BearingStyle2 = $Bearing2, $BearingStyle3 = $Bearing3, $HInnerExtension = $InnerExtension, $HOuterExtension = $OuterExtension);
}

module RailAttach($DriveClearance = 1)
{
  $WheelSideMountLength = 90 - ($WheelSideMount * 20);
  $WheelSideMountSpacing = 80 - ($WheelSideMount * 32);
  $MotorSideMountLength = 90 - ($MotorSideMount * 20);
  $MotorSideMountSpacing = 80 - ($MotorSideMount * 32);
  $MountHoleDiameter = 4.2;
 
  //Mount wings
  $fn = 20;
  difference()
  {
    union()
    {
      difference()
      {
        translate([-$WheelSideMountLength / 2, 27 + $OuterExtension, 40 - (42 / 2)])
          cube([$WheelSideMountLength, 6, 42]);
        if ($Cutout)
          translate([-70 / 2, 25 + $OuterExtension, 41.5 - (27 / 2)])
            cube([70, 10, 27]);
      }
      difference()
      {
        translate([-$MotorSideMountLength / 2, -13 - $InnerExtension, 40 - (42 / 2)])
          cube([$MotorSideMountLength, 6, 42]);
        if ($DriveClearance == 1)
          translate([-50 / 2, -15 - $InnerExtension, 18])
            cube([50, 10, 10]);
        if ($Cutout) 
          translate([-70 / 2, -15 - $InnerExtension, 41.5 - (27 / 2)])
            cube([70, 10, 27]);
      }
      children();
    }
    translate([0, 37, 40 - (42 / 2)])
    {
      translate([0, 0, 21])
      {
        rotate(-90, [1, 0, 0])
        {
          translate([($WheelSideMountSpacing / 2), 16, -$OuterExtension + 5])
            cylinder(d = $MountHoleDiameter, h = 20);
          translate([($WheelSideMountSpacing / 2), -16, -$OuterExtension + 5])
            cylinder(d = $MountHoleDiameter, h = 20);
          translate([-($WheelSideMountSpacing / 2), 16, -$OuterExtension + 5])
            cylinder(d = $MountHoleDiameter, h = 20);
          translate([-($WheelSideMountSpacing / 2), -16, -$OuterExtension + 5])
            cylinder(d = $MountHoleDiameter, h = 20);
        }
      }
    }
    translate([0, -$InnerExtension - 25, 40 - (42 / 2)])
    {
      translate([0, 0, 21])
      {
        rotate(-90, [1, 0, 0])
        {
          translate([($MotorSideMountSpacing / 2), 16, 0])
            cylinder(d = $MountHoleDiameter, h = 20);
          translate([($MotorSideMountSpacing / 2), -16, 0])
            cylinder(d = $MountHoleDiameter, h = 20);
          translate([-($MotorSideMountSpacing / 2), 16, 0])
            cylinder(d = $MountHoleDiameter, h = 20);
          translate([-($MotorSideMountSpacing / 2), -16, 0])
            cylinder(d = $MountHoleDiameter, h = 20);
        }
      }
    }
  }
}

module ShowInsideMountedDriveFrameSet($ShowRail = false)
{
  if ($ShowRail)
    translate([-24, 35 + 4.5, 40])
      rotate(-90, [0, 0, 1])
        ActobotixExtrusion($ShowCHoles = true, $ShowSlots = true, $ShowHoles = true, $ShowAngledHoles = true, $ShowTopBottomHoles = true, $Length = 100);
  
//      RailsTemplate($SpacingCount = 8);  
  
  //Bevel gears mounting frame
  InsideVerticalDriveMount($Length = 70, $Bearing1 = $GearboxBearingType1, $Bearing2 = $GearboxBearingType2, $Bearing3 = $GearboxBearingType3, $InnerExtension = 8, $OuterExtension = 4);
  //Motor gear
  translate([0, 0, 18.5])
//    CustomBevelGear($MotorHubDepth = 5, $HubType = 1, $Rotate = 0, $GearHubDepth = 5, $GearHubDiameter = 37);//Metal hex strengthener, outside
//    CustomBevelGear($MotorHubDepth = 5, $HubType = 2, $Rotate = 0, $GearHubDepth = 5, $GearHubDiameter = 37);//Metal hex strengthener, inside. Not applicable for side mount motor gear
//    CustomBevelGear($MotorHubDepth = 5, $HubType = 3, $Rotate = 0, $GearHubDepth = 5, $GearHubDiameter = 37);
//    CustomBevelGear($MotorHubDepth = 5, $HubType = 3, $Rotate = 0, $HubDiameter = 22, $HubHeight = 8.4, $GearHubDepth = 5, $GearHubDiameter = 37);//Plastic friction, inside mount. Not applicable for side mount motor gear
//    CustomBevelGear($MotorHubDepth = 5, $HubType = 4, $Rotate = 0, $HubDiameter = 22, $HubHeight = 8.4, $GearHubDepth = 5, $GearHubDiameter = 37);//Plastic friction, outside mount, no motor attach holes
    MotorShaftGear();
  //Wheel gear
  translate([0, 20 + 1.5, 40 - 0])
    rotate(90, [1, 0, 0])
      DriveShaftGear();
}

module CustomBevelGear($HubType = 1, $Rotate = 0, $HubDiameter = 22, $HubHeight = 8.4, $HubOffset = 0, $GrubSlot = false)
{
  difference()
  {
    union()
    {
      //Main gear
      rotate($Rotate, [0, 0, 1])
        BevelGear();
      translate([0, 0, $HubOffset]);
      {
        if ($HubType == 3)
        {
          translate([0, 0, 4.5])
            cylinder(d = $HubDiameter, h = $HubHeight);
        }
        else if (($HubType == 4) || ($HubType == 5))
        {
          translate([0, 0, -$MotorHubDepth - $HubHeight])
            cylinder(d = $HubDiameter, h = $HubHeight);
        }
      }
    }
    //Hex shaft for plastic friction fit version
    translate([0, 0, -$MotorHubDepth + .2 - 8.6]) 
      ShamferedShaft($D = $HexShaftD, $H = $HubHeight + 8.6, $DOver = 1, $HOver = 1, $fn = 6);
//      cylinder(d = $HexShaftD, h = 80, $fn = 6, center = true);
    if ($HubType == 1)
    {
#      translate([0, 0, -$MotorHubDepth + 3.24])
        rotate(180, [0, 1, 0])
          HighStrengthHexHub($fn = 60, $PinExtend1 = 10, $PinExtend2 = 1);//PinExtend1 is screw holes, PinExtend2 = pins
    }
    else if ($HubType == 2)
    {
#      translate([0, 0, 1.27])
        rotate(0, [0, 1, 0])
          HighStrengthHexHub($fn = 60, $PinExtend1 = 10, $PinExtend2 = 1);//PinExtend1 is screw holes, PinExtend2 = pins
    }
    else if ($HubType == 5)
    {
      rotate(-30, [0, 0, 1])
      translate([0, 0, -15])
        RevMountPattern($D = 3.6, $H = 30, $R = 8, $Rotate = 0, $Count = 5);
    }
    if ($GrubSlot)
    {
      translate([0, 0, -2.5])
        GrubScrewPattern($ShaftD = 2.8, $ShaftL = 20, $NutFlatD = 5.20, $NutThickness = 2.4, $SlotL = 10, $SlotOffset = 7, $Angle = 90, $Orientation = [1, 0, 0], $fn = 20);
      translate([0, -($GearHubDiameter / 2), -($GearHubDepth / 2)])
        cube([20, 3, $GearHubDepth], center = true);
    }
  }
}


module RailsTemplate($SpacingCount = 6)//NOTE : 3 results in a hole to hole gap of 1x since spacing is from outer edge of extrusion
{
  translate([-($SpacingCount * 8 / 2), 0, 0])
    ActobotixExtrusion($ShowCHoles = true, $ShowSlots = true, $ShowHoles = true, $ShowAngledHoles = true, $ShowTopBottomHoles = true, $Length = 100);
  translate([($SpacingCount * 8 / 2), 0, 0])
    rotate(180, [0, 1, 0])
      ActobotixExtrusion($ShowCHoles = true, $ShowSlots = true, $ShowHoles = true, $ShowAngledHoles = true, $ShowTopBottomHoles = true, $Length = 100);
}

module PrintInsideVerticalDriveMount()
{
  
  InsideVerticalDriveMount($Length = 70, $Bearing1 = $GearboxBearingType1, $Bearing2 = $GearboxBearingType2, $Bearing3 = $GearboxBearingType3, $InnerExtension = 8, $OuterExtension = 4);
  
//Motor drive gear
  translate([30, -45, 8.4+5 - .5])
    MotorShaftGear();
//Shaft drive gear
  translate([-30, -45, 1.5+5])
    DriveShaftGear();

//HexShaftBearingShimSpacer($SpacerHeight = 1);}
  
}

module BearingTestBlock()
{
  difference()
  {
    translate([-20, -15, 0])
      cube([40, 30, 5]);
    if ($GearboxBearingType1 == 0)
    {
      Rev5mmHexBearingBlock($BoltHeight = 10, $Cutout = 1);
    }
    else if ($GearboxBearingType1 == 1)
    {
      BearingReceptical($Type="608", $DOversize = 0.5, $HOversize = $Bearing0608HOversize, $Rotate = [0, 0, 0]);
    }
    else if ($GearboxBearingType1 == 2)
    {
      BearingReceptical($Type="625", $DOversize = 0.5,$HOversize = $Bearing0625HOversize, $Rotate = [0, 0, 0]);
    }
  }
}

module DriveShaftGear()
{
  CustomBevelGear($MotorHubDepth = 5, $HubType = 4, $Rotate = 9, $HubDiameter = 12, $HubHeight = 1.5, $GrubSlot = true, $GearHubDepth = 5, $GearHubDiameter = 37);
}

module DriveShaftGearInvolute()
{
  difference()
  {
    union()
    {
      CustomBevelGear($MotorHubDepth = 5, $HubType = 4, $Rotate = 9, $HubDiameter = 12, $HubHeight = 4.5, $GrubSlot = true, $GearHubDepth = 5, $GearHubDiameter = 37);
      //gear (number_of_teeth=15,	circular_pitch=false, diametral_pitch=false,	pressure_angle=28,	clearance = 0.2,	gear_thickness=5,	rim_thickness=8,	rim_width=5,
      //hub_thickness=10,	hub_diameter=15,	bore_diameter=5,	circles=0,	backlash=0,	twist=0,	involute_facets=0,  circle_orbit_diameter = 10,  circle_diameter = 10,	flat=false)
      translate([0, 0, -9.5])
        gear (number_of_teeth=25,	circular_pitch=500,	gear_thickness = 5,	rim_thickness = 5,	hub_thickness = 5,	circles=0, bore_diameter=6.2);
    }
    translate([0, 0, -9.5])
      ShamferedShaft($D = $HexShaftD, $H = 14.1, $DOver = 1, $HOver = 1, $fn = 6);
  }

}

module MotorShaftGear()
{
  difference()
  {
    CustomBevelGear($MotorHubDepth = 4.0, $HubType = 5, $Rotate = 0, $HubDiameter = 21, $HubHeight = 8.4, $GrubSlot = false, $GearHubDepth = 5, $GearHubDiameter = 37);//Plastic friction, outside mount, motor attach holes
    rotate(360/40, [0, 0, 1])
      translate([18.45, 0, -10])
        cylinder(d = 4., h = 30, $fn = 30);
  }
}

module TestFrame($Top = false, $Left = true, $Right = true)
{
  rotate(90, [0, 0, 1])
    translate([-$TestFrameSpacing / 2, 0, 0])
    {
      if ($Left)
        ActobotixExtrusion($ShowCHoles = true, $ShowSlots = true, $ShowHoles = true, $ShowAngledHoles = true, , $ShowTopBottomHoles = true, $Length = 100);

      if ($Right)
        translate([$TestFrameSpacing, 0, 0])
          rotate(180, [0, 1, 0])
            ActobotixExtrusion($ShowCHoles = true, $ShowSlots = true, $ShowHoles = true, $ShowAngledHoles = true, , $ShowTopBottomHoles = true, $Length = 100);

      if ($Top)
        translate([0, 24, 24])
          rotate(-90, [1, 0, 0])
            rotate(-90, [0, 0, 1])
              ActobotixExtrusion($ShowCHoles = true, $ShowSlots = true, $ShowHoles = true, $ShowAngledHoles = true, , $ShowTopBottomHoles = true, $Length = 100);
    }
}

module WheelFrame()
{
  $BaseLength = 116;
  $BaseWidth = 67;
  $BaseHeight = 42.9;
  $BaseWallThickness = 9.5;
  $WheelChannelFixDiameter = 2.8;
  $WheelChannelFixCenterOffset = ($BaseWidth / 2) - 5.5;
  
  difference()
  {
    translate([0, 0, $WheelVerticalOffset])
      cube([$BaseLength, $BaseWidth, $BaseHeight], center = true);
    translate([0, 0, $WheelVerticalOffset])
      cube([$BaseLength - 10, $BaseWidth - $BaseWallThickness - $BaseWallThickness, 72], center = true);
    //Wheel channel fixing holes
    translate([24, $WheelChannelFixCenterOffset, 0])
      cylinder(d = $WheelChannelFixDiameter, h = 80, $fn = 40, center = true);
    translate([-24, $WheelChannelFixCenterOffset, 0])
      cylinder(d = $WheelChannelFixDiameter, h = 80, $fn = 40, center = true);
    translate([24 + 16, $WheelChannelFixCenterOffset, 0])
      cylinder(d = $WheelChannelFixDiameter, h = 80, $fn = 40, center = true);
    translate([24 + 24, $WheelChannelFixCenterOffset, 0])
      cylinder(d = $WheelChannelFixDiameter, h = 80, $fn = 40, center = true);
    translate([-24 - 16, $WheelChannelFixCenterOffset, 0])
      cylinder(d = $WheelChannelFixDiameter, h = 80, $fn = 40, center = true);
    translate([-24 - 24, $WheelChannelFixCenterOffset, 0])
      cylinder(d = $WheelChannelFixDiameter, h = 80, $fn = 40, center = true);

    translate([24, -$WheelChannelFixCenterOffset, 0])
      cylinder(d = $WheelChannelFixDiameter, h = 80, $fn = 40, center = true);
    translate([-24, -$WheelChannelFixCenterOffset, 0])
      cylinder(d = $WheelChannelFixDiameter, h = 80, $fn = 40, center = true);
    translate([24 + 16, -$WheelChannelFixCenterOffset, 0])
      cylinder(d = $WheelChannelFixDiameter, h = 80, $fn = 40, center = true);
    translate([24 + 24, -$WheelChannelFixCenterOffset, 0])
      cylinder(d = $WheelChannelFixDiameter, h = 80, $fn = 40, center = true);
    translate([-24 - 16, -$WheelChannelFixCenterOffset, 0])
      cylinder(d = $WheelChannelFixDiameter, h = 80, $fn = 40, center = true);
    translate([-24 - 24, -$WheelChannelFixCenterOffset, 0])
      cylinder(d = $WheelChannelFixDiameter, h = 80, $fn = 40, center = true);

    translate([0, 0, $InvoluteNudge])
    {
      rotate(90, [1, 0, 0])
      {
        if ($WheelFrameBearingType == 0)
        {
          translate([0, 0, -2.3 + ($BaseWidth / 2)])
            Rev5mmHexBearingBlock($BoltHeight = 20, $Cutout = 1);
        }
        else if ($WheelFrameBearingType == 1)
        {
          //Shaft opening
          cylinder(d = 19, h = $BaseWidth + 2, center = true);
          //Clearance to reduce support glogging
          cube([5, 22.5, $BaseWidth + 2], center = true);
//          translate([0, 0, -7.6 + ($BaseWidth / 2)])//Outside bearing
          translate([0, 0, -9.5 + ($BaseWidth / 2)])//Inside bearing
            BearingReceptical($Type="608", $DOversize = 0.5, $HOversize = $Bearing0608HOversize, $Rotate = [0, 0, 0]);
        }
        else if ($WheelFrameBearingType == 2)
        {
          //Shaft opening
          cylinder(d = 15, h = $BaseWidth + 2, center = true);
          translate([0, 0, -5.1 + ($BaseWidth / 2)])
            BearingReceptical($Type="625", $DOversize = 0.5,$HOversize = $Bearing0625HOversize, $Rotate = [0, 0, 0]);
        }
        //Bearing holder screw holes
        translate([14, 0, 0])
          cylinder(d = 2, h = $BaseWidth + 2, center = true, $fn = 20);
        translate([-14, 0, 0])
          cylinder(d = 2, h = $BaseWidth + 2, center = true, $fn = 20);
      }
      rotate(-90, [1, 0, 0])
        if ($WheelFrameBearingType == 0)
        {
          translate([0, 0, -2.3 + ($BaseWidth / 2)])
            Rev5mmHexBearingBlock($BoltHeight = 20, $Cutout = 1);
        }
        else if ($WheelFrameBearingType == 1)
        {
//          translate([0, 0, -7.6 + ($BaseWidth / 2)])//Outside bearing
          translate([0, 0, -9.5 + ($BaseWidth / 2)])//Inside bearing
            BearingReceptical($Type="608", $DOversize = 0.5, $HOversize = $Bearing0608HOversize, $Rotate = [0, 0, 0]);
        }
        else if ($WheelFrameBearingType == 2)
        {
          translate([0, 0, -5.1 + ($BaseWidth / 2)])
            BearingReceptical($Type="625", $DOversize = 0.5,$HOversize = $Bearing0625HOversize, $Rotate = [0, 0, 0]);
        }
    }
  }

  $FrameLocator = 13;
  hull()
  {
    translate([($BaseLength - 5)/ 2, 0, -($BaseHeight / 2) + $WheelVerticalOffset])
      cube([5, $BaseWidth - $BaseWallThickness - $BaseWallThickness-1, 0.1], center = true);
    translate([(($BaseLength - 5)/ 2) - $FrameLocator, 0, -($BaseHeight / 2) -45])
      cube([5, $BaseWidth - $BaseWallThickness - $BaseWallThickness - 4, 0.1], center = true);
  }
  hull()
  {
    translate([-($BaseLength - 5)/ 2, 0, -($BaseHeight / 2) + $WheelVerticalOffset])
      cube([5, $BaseWidth - $BaseWallThickness - $BaseWallThickness - 1, 0.1], center = true);
    translate([-((($BaseLength - 5)/ 2) - $FrameLocator), 0, -($BaseHeight / 2)  - 45])
      cube([5, $BaseWidth - $BaseWallThickness - $BaseWallThickness - 4, 0.1], center = true);
  }
}

module ShowVerticalStackSet()
{
  
  translate([0, -8, -40])
  {
    InsideVerticalDriveMount($Length = 90, $Bearing1 = $GearboxBearingType1, $Bearing2 = $GearboxBearingType2, $Bearing3 = $GearboxBearingType3, $InnerExtension = 12.4, $OuterExtension = 8.4);
    //Motor gear
    translate([0, 0, 18.5])
      MotorShaftGear();
    //Wheel gear
    translate([0, 20 + 1.5, 40 - 0])
      rotate(90, [1, 0, 0])
        DriveShaftGearInvolute();
  }
  
  translate([0, -24, 0])
    rotate(-90, [1, 0,0])
      DriveSpacer();
/*
  translate([0, 0, 75])
  {
    WheelFrame();
    translate([0, -3, 0])
      rotate(90, [0, 0, 90])
          GoBildaMechWheel();
  }
  
  translate([0, 23, 75 + $InvoluteNudge])
    WheelMountInvolute();
  */
}

module DriveSpacer()
{
  $fn = 30;
  difference()
  {
    union()
    {
      cylinder(d = 11, h = 32.9);
      cylinder(d = 20, h = 10);
    }
    ShamferedShaft($D = 6.5, $H = 33, $DOver = 1, $HOver = 1);
    translate([0, -3, 5])
      GrubScrewPattern($ShaftD = 2.8, $ShaftL = 20, $NutFlatD = 5.20, $NutThickness = 2.4, $SlotL = 11, $SlotOffset = 7, $Angle = -90, $Orientation = [1, 0, 0], $fn = 20);
  }  
}

module PrintBearingShims()
{
  for ($i = [1:$ShimCount])
  {
    translate([0, ($i * 12), 0])
      HexShaftBearingShimSpacer($SpacerHeight = $ShimSpacerHeight); 
  }
}

module VerticalStackMainFrame()
{
  translate([0, -8, -40])
    InsideVerticalDriveMount($Length = 90, $Bearing1 = $GearboxBearingType1, $Bearing2 = $GearboxBearingType2, $Bearing3 = $GearboxBearingType3, $InnerExtension = 12.4, $OuterExtension = 8.4);
  translate([0, 0, 75])
    WheelFrame();
}

module PrintVerticalStackSet()
{
  translate([0, 0, 40])
    VerticalStackMainFrame();
  translate([-35, -77, 0])
    rotate(-90, [1, 0, 0])
      WheelMountInvolute();
  translate([45, -80, 9.5])
    DriveShaftGearInvolute();
  translate([78, 15, 0])
    WheelOuterMount($CountersinkType = 0, $Spacer = 0, $H = 19);
  translate([80, -25, 12.4])
    MotorShaftGear();
  
  translate([-70, -20, 0])
  DriveSpacer();
  
  for ($i = [1:$ShimCount])
  {
//    translate([90, -55 - ($i * 12), 0])
//      HexShaftBearingShimSpacer($SpacerHeight = 2); 
//    translate([-66, 27 - ($i * 12), 0])
//      HexShaftBearingShimSpacer($SpacerHeight = 1.6); 
    translate([-78, 21 - ($i * 12), 0])
      HexShaftBearingShimSpacer($SpacerHeight = 1.2); 
  }
  //Shaft aligner helper
  translate([5, -43 , 0])
    HexShaftBearingShimSpacer($Height =  15, $SpacerHeight = 0, $OuterD = 12, $Sides = 30, $InnerD = $RevHDShaftD + .2); 
//  translate([19, -43 , 0])
//    HexShaftBearingShimSpacer($Height =  15, $SpacerHeight = 0, $OuterD = 12, $Sides = 30, $InnerD = $RevHDShaftD + .2); 
}

if ($Action == 1) // Display
{
  if ($Object == 1)
    ShowInsideMountedDriveFrameSet();
  else if ($Object == 7)
    ShowVerticalStackSet();
  else if ($Object == 8)
    VerticalStackMainFrame();
  else if ($Object == 9)
    DriveShaftGearInvolute();
}
else if ($Action == 2)// Print
{
  //Valid print sets
  if ($Object == 1)
    PrintInsideVerticalDriveMount();
  else if ($Object == 2)
    InsideVerticalDriveMount($Length = 70, $Bearing1 = $GearboxBearingType1, $Bearing2 = $GearboxBearingType2, $Bearing3 = $GearboxBearingType3, $InnerExtension = 8, $OuterExtension = 4);
  else if ($Object == 3)
    MotorShaftGear();
  else if ($Object == 4)
    DriveShaftGear();
  else if ($Object == 5)
    BearingTestBlock();
  else if ($Object == 6)
    WheelOuterMount($CountersinkType = 0, $Spacer = 0, $H = 19);
  else if ($Object == 8)
    VerticalStackMainFrame();
  else if ($Object == 9)
    DriveShaftGearInvolute();    
  else if ($Object == 10)
    rotate(-90, [1, 0, 0])
      WheelMountInvolute();
  else if ($Object == 11)
    PrintVerticalStackSet();
  else if ($Object == 12)
    PrintBearingShims();
}
else if ($Action == 3) // Display Individual
{
  //Valid Individual models
}


$TestFrameSpacing = 12 * 6;

//#translate([12 * 4, 0, 68])
//  TestFrame();

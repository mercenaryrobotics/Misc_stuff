//Dimensions are in mm
$BearingMountHole = 9.5;
$BearingSpacing = 53.3;
$BearingDiameter = 31;
$BearingThickness = 11;
$RailOpening = 30;
$MountXSpacing = 95;
$MountZSpacing = 18;
$MountXSpacing2 = 85;
$MountZSpacing2 = 35;
$MountingHole = 6.3;

//Dimensions are in inches
$GripperRotation = 0;
$LifterSegmentExtention = 30;

$RotatorArmLength = 30;
$GripperLength = 9;
$GripperLeverLength = 4;
$GripperBarOffset = 4;
$GripperFrameLength = $GripperLength + $GripperBarOffset + 2;
$GripperFrameWidth = 18;
$GripperSupportLength = 5;
$GripperActuatorLength = 3;
$GripperBarLength = 4;
$MainBeamHeight = 49;
$MainBaseLength = 24;
$MainTrackSpacing = 5.5;

$Gripper3FrameWidth = 18.5;
$Gripper3WheelSpacing = 7;
$Gripper3WheelDiameter = 4;
$Gripper3Potition = 3;

$MainBaseAngle = atan($MainBeamHeight / $MainBaseLength);
$MainTrackLength = sqrt(( $MainBeamHeight * $MainBeamHeight) + ($MainBaseLength * $MainBaseLength));

$ExtrusionWidth = 1;
$ExtrusionThickness = .15;
$GripperFlexHoleDiameter = 0.25;
$GripperBarThickness = 0.1;

$GripperPositionAngle =45;
$GripperArmAngle = 142;
$GripperTrackPosition = 0;

PivotBarColor = [0.7, 0.7, 0.72];
GripperColor = [0.6, 0.6, 0.62];
FrameColor = [0.8, 0.8, 0.62];
MainSupportColor = [0.7, 0.8, 0.62];
FrameStrengthenerColor = [0.8, 0.8, 0.7];
PusherColor = [0.9, 0.8, 0.7];
SteelColor = [0.8, 0.8, 0.7];

$Gripper3ArmAngle = -20;
$Gripper3FrameWidth = 18.5;
$Gripper3WheelSpacing = 7;
$Gripper3WheelDiameter = 4;
$Gripper3Potition = 3;
$Gripper3SideLength = 7;
$Gripper3SideOffset = $ExtrusionWidth + 2;
$Gripper3SideArmLength = 12;
$Gripper3SideArmOffset = 6.5;
$Gripper3CylinderLength = 5;
$Gripper3CylinderDiameter = .7;
$Gripper3CylinderStroke = 4;
$CylinderStrokePosition = 3.5;

$LifterClearance = 0.1;
$HandSegmentExtension = 60;
$LifterSegmentLength = 48;
//$LifterInnerSpacing = 6;
$LifterInnerSpacing = $Gripper3FrameWidth + $ExtrusionWidth + $ExtrusionWidth + $ExtrusionWidth + $LifterClearance + $LifterClearance;
$LifterBearingEffectiveDiameter = 1.086;
//$LifterBearingSpacing = $LifterBearingEffectiveDiameter + $ExtrusionWidth;
$LifterBearingSpacing = $BearingSpacing / 25.4;
$LifterBearingHeight = 6;
$LifterBearingClearance = 0.25;
$LifterCarriageMaterialThickness = 0.25;
$LifterSupportThickness = .125;


//Defaults for bolts
$BoltDiameter = 0.25;
$BoltLength = 3;
$BoltHeadLength = 0.2;

module VCarriage1()
{
  difference()
  {
    //Main body
    cube([110, 50, 30], center = true);
    //Bearing bolt holes
    translate([$BearingSpacing / 2, 0, 0])
    rotate(90, [1, 0, 0])
      cylinder(d = $BearingMountHole, h = 100, $fn = 40, center = true);
    translate([-$BearingSpacing / 2, 0, 0])
      rotate(90, [1, 0, 0])
        cylinder(d = $BearingMountHole, h = 100, $fn = 40, center = true);
    //Rail opening
    cube([$RailOpening, $RailOpening, 35], center = true);
    //Bearing openings
    cube([$BearingSpacing + $BearingDiameter + 0, $BearingThickness + 3, 100], center = true);
    //Mounting holes
    translate([$MountXSpacing / 2, 0, $MountZSpacing / 2])
      rotate(90, [1, 0, 0])
        cylinder(d = $MountingHole, h = 100, $fn = 40, center = true);
    translate([-$MountXSpacing / 2, 0, $MountZSpacing / 2])
      rotate(90, [1, 0, 0])
        cylinder(d = $MountingHole, h = 100, $fn = 40, center = true);
    translate([$MountXSpacing / 2, 0, -$MountZSpacing / 2])
      rotate(90, [1, 0, 0])
        cylinder(d = $MountingHole, h = 100, $fn = 40, center = true);
    translate([-$MountXSpacing / 2, 0, -$MountZSpacing / 2])
      rotate(90, [1, 0, 0])
        cylinder(d = $MountingHole, h = 100, $fn = 40, center = true);
  }
}

module VCarriage()
{
  rotate(90, [0, 0, 1])
    rotate(90, [1, 0, 0])
    scale(1/25.4)
      VCarriage2();
}

module VCarriage2()
{
  difference()
  {
    //Main body
    union()
    {
      cube([100, 50, 20], center = true);
      translate([0, -20, 0])
        cube([100, 10, 50], center = true);
    }
    //Bearing bolt holes. Sloped to create tight region for bolt thread
    translate([$BearingSpacing / 2, 0, 0])
      rotate(90, [1, 0, 0])
        cylinder(d1 = $BearingMountHole + .5, d2 = $BearingMountHole - 0.7, h = 70, $fn = 40, center = true);
    translate([-$BearingSpacing / 2, 0, 0])
      rotate(90, [1, 0, 0])
        cylinder(d1 = $BearingMountHole + .5, d2 = $BearingMountHole - 0.7, h = 70, $fn = 40, center = true);
    //Rail opening
    cube([$RailOpening, $RailOpening, 35], center = true);
    //Bearing openings
    cube([$BearingSpacing + $BearingDiameter + 0, $BearingThickness + 3, 100], center = true);
    //Mounting holes
    translate([$MountXSpacing2 / 2, 0, $MountZSpacing2 / 2])
      rotate(90, [1, 0, 0])
        cylinder(d = $MountingHole, h = 100, $fn = 40, center = true);
    translate([-$MountXSpacing2 / 2, 0, $MountZSpacing2 / 2])
      rotate(90, [1, 0, 0])
        cylinder(d = $MountingHole, h = 100, $fn = 40, center = true);
    translate([$MountXSpacing2 / 2, 0, -$MountZSpacing2 / 2])
      rotate(90, [1, 0, 0])
        cylinder(d = $MountingHole, h = 100, $fn = 40, center = true);
    translate([-$MountXSpacing2 / 2, 0, -$MountZSpacing2 / 2])
      rotate(90, [1, 0, 0])
        cylinder(d = $MountingHole, h = 100, $fn = 40, center = true);
  }
  /*
  //Support cutaways
  translate([($RailOpening / 2) + .25, 0, 0])
    cube([1, 40, 20], center = true);
  translate([-(($RailOpening / 2) + .25), 0, 0])
    cube([1, 40, 20], center = true);
  */
}

module VCarriage3MountHoleSet()
{
  {
  translate([37 * $Scale, -13 * $Scale, 0])
    cylinder(d = $MountingHole * $Scale, h = 170 * $Scale, $fn = 40, center = true);
  translate([37 * $Scale, -28 * $Scale, 0])
    cylinder(d = $MountingHole * $Scale, h = 170 * $Scale, $fn = 40, center = true);
  translate([-37 * $Scale, -13 * $Scale, 0])
    cylinder(d = $MountingHole * $Scale, h = 170 * $Scale, $fn = 40, center = true);
  translate([-37 * $Scale, -28 * $Scale, 0])
    cylinder(d = $MountingHole * $Scale, h = 170 * $Scale, $fn = 40, center = true);
  }
}

module VCarriage3()
{
  difference()
  {
    //Main body
    union()
    {
      //Main body
      translate([0, -21, 20])
        cube([95, 28, 80], center = true);
    }
    //Rail opening
    cube([$RailOpening, $RailOpening, 200], center = true);
    
    //Bearing bolt holes
    translate([$BearingSpacing / 2, -30, 0])
      rotate(90, [1, 0, 0])
        cylinder(d1 = $BearingMountHole + .5, d2 = $BearingMountHole - 0.7, h = 70, $fn = 40, center = true);

    translate([$BearingSpacing / 2, -30, 40])
      rotate(90, [1, 0, 0])
        cylinder(d1 = $BearingMountHole + .5, d2 = $BearingMountHole - 0.7, h = 70, $fn = 40, center = true);

    translate([-$BearingSpacing / 2, -30, 0])
      rotate(90, [1, 0, 0])
        cylinder(d1 = $BearingMountHole + .5, d2 = $BearingMountHole - 0.7, h = 70, $fn = 40, center = true);
    
    translate([-$BearingSpacing / 2, -30, 40])
      rotate(90, [1, 0, 0])
        cylinder(d1 = $BearingMountHole + .5, d2 = $BearingMountHole - 0.7, h = 70, $fn = 40, center = true);

    translate([-$BearingSpacing / 2, -30, 20])
      rotate(90, [1, 0, 0])
        cylinder(d1 = $BearingMountHole + .5, d2 = $BearingMountHole - 0.7, h = 70, $fn = 40, center = true);

    translate([$BearingSpacing / 2, -30, 20])
      rotate(90, [1, 0, 0])
        cylinder(d1 = $BearingMountHole + .5, d2 = $BearingMountHole - 0.7, h = 70, $fn = 40, center = true);


  //Upper/lower plate mount holes
  VCarriage3MountHoleSet($Scale = 1);
  }
}

module PrintCarriages()
{
  //VCarriage1();
  difference()
  {
  rotate(90, [1, 0, 0])
  {
    VCarriage2();
  //  translate([0, 0, 55])
  //    VCarriage2();
  }
  translate([35, 0, 0])
    cube([100, 100, 100], center = true);
  }
}

module Extrusion()
{
  difference()
  {
    translate([0, -$ExtrusionWidth / 2, -$ExtrusionWidth / 2])
      cube([$Length, $ExtrusionWidth, $ExtrusionWidth]);
    translate([-0.005, -($ExtrusionWidth - $ExtrusionThickness) / 2, -($ExtrusionWidth - $ExtrusionThickness) / 2])
      cube([$Length + 0.01, ($ExtrusionWidth - $ExtrusionThickness), ($ExtrusionWidth - $ExtrusionThickness)]);
  }
  echo ($Length=$Length);
}

module GripperArm()
{
  difference()
  {
    //Bas L frame
    union()
    {
      Extrusion($Length = $GripperLength);
      translate([$ExtrusionWidth / 2, -($ExtrusionWidth / 2) - 0.01, 0])
        rotate(-90, [0, 0, 1])
          Extrusion($Length = $GripperLeverLength);
    }
    //Pivot fulcrums
    translate([$ExtrusionWidth / 2, 0, -($ExtrusionWidth + 0.01) / 2])
      cylinder(d = $GripperFlexHoleDiameter, h = $ExtrusionWidth + 0.01, $fn = 30);
    translate([$GripperLength - ($ExtrusionWidth / 2), 0, -($ExtrusionWidth + 0.01) / 2])
      cylinder(d = $GripperFlexHoleDiameter, h = $ExtrusionWidth + 0.01, $fn = 30);
    //Sprint mount hole
    translate([$ExtrusionWidth / 2, -$GripperLeverLength, -($ExtrusionWidth + 0.01) / 2])
      cylinder(d = $GripperFlexHoleDiameter, h = $ExtrusionWidth + 0.01, $fn = 30);
    //Retraction sprint mount hole
    translate([($GripperLength / 2), 0, -($ExtrusionWidth + 0.01) / 2])
      cylinder(d = $GripperFlexHoleDiameter, h = $ExtrusionWidth + 0.01, $fn = 30);
  }
}

module GripperBar()
{
  translate([0, 0, -$GripperBarThickness / 2])
  difference()
  {
    hull()
    {
      cylinder(d = $ExtrusionWidth, h = $GripperBarThickness, $fn = 30);
      translate([0, -$GripperBarLength, 0])
        cylinder(d = $ExtrusionWidth, h = $GripperBarThickness, $fn = 30);
    }
    translate([0, 0, -0.005])
    {
      cylinder(d = $GripperFlexHoleDiameter, h = $GripperBarThickness + 0.01, $fn = 30);
      translate([0, -$GripperBarLength, 0])
        cylinder(d = $GripperFlexHoleDiameter, h = $GripperBarThickness + 0.01, $fn = 30);
    }
  }
}

module DisplayGripperSide()
{
  //Gripper pivot bars
  color(PivotBarColor)
  {
    translate([0, 0, (($ExtrusionWidth + $GripperBarThickness)/ 2) + 0.01])
      rotate($GripperPositionAngle, [0, 0, 1])
        GripperBar();
    translate([$GripperLength - $ExtrusionWidth, 0, (($ExtrusionWidth + $GripperBarThickness)/ 2) + 0.01])
      rotate($GripperPositionAngle, [0, 0, 1])
        GripperBar();
    translate([0, 0, - (($ExtrusionWidth + $GripperBarThickness)/ 2) - 0.01])
      rotate($GripperPositionAngle, [0, 0, 1])
        GripperBar();
    translate([$GripperLength - $ExtrusionWidth, 0, - (($ExtrusionWidth + $GripperBarThickness)/ 2) - 0.01])
      rotate($GripperPositionAngle, [0, 0, 1])
        GripperBar();
  }
  
  //Gripper
  color(GripperColor)
    translate([sin($GripperPositionAngle) * $GripperBarLength, -cos($GripperPositionAngle) * $GripperBarLength, 0])
      translate([-$ExtrusionWidth / 2, 0, 0])
        GripperArm();
  
  //Support frame
  color(FrameColor)
  {
    GripperFrameSegment();
  }
  
  //Frame strengtheners
  color(FrameStrengthenerColor)
  {
    translate([($GripperSupportLength / sqrt(2)) - $ExtrusionWidth, 0, ($ExtrusionWidth / 2) + $GripperBarThickness + $GripperBarThickness])
      rotate(-45, [0, 0, 1])
        GripperBar($GripperBarLength = $GripperSupportLength);
    translate([($GripperSupportLength / sqrt(2)) - $ExtrusionWidth, 0, -(($ExtrusionWidth / 2) + $GripperBarThickness + $GripperBarThickness)])
      rotate(-45, [0, 0, 1])
        GripperBar($GripperBarLength = $GripperSupportLength);
  }
  
  //Actuator attachment bars
  color(FrameStrengthenerColor)
  {
    translate([sin($GripperPositionAngle) * $GripperBarLength, -(cos($GripperPositionAngle) * $GripperBarLength) - $GripperLeverLength, ($ExtrusionWidth / 2) + 0.01])
      rotate(- (84 - $GripperPositionAngle), [0, 0, 1])
      GripperBar($GripperBarLength = $GripperActuatorLength);
  }
}

module DisplayGripperSideV2()
{
  //Gripper pivot bars
  translate([$GripperBarOffset, 0, 0])
  {
  color(PivotBarColor)
  {
    translate([0, 0, (($ExtrusionWidth + $GripperBarThickness)/ 2) + 0.01])
      rotate(- $GripperPositionAngle , [0, 0, 1])
        GripperBar();
    translate([$GripperLength - $ExtrusionWidth, 0, (($ExtrusionWidth + $GripperBarThickness)/ 2) + 0.01])
      rotate(-$GripperPositionAngle, [0, 0, 1])
        GripperBar();
    translate([0, 0, - (($ExtrusionWidth + $GripperBarThickness)/ 2) - 0.01])
      rotate(-$GripperPositionAngle, [0, 0, 1])
        GripperBar();
    translate([$GripperLength - $ExtrusionWidth, 0, - (($ExtrusionWidth + $GripperBarThickness)/ 2) - 0.01])
      rotate(-$GripperPositionAngle, [0, 0, 1])
        GripperBar();
  }
  
  //Gripper
  color(GripperColor)
    translate([sin(-$GripperPositionAngle) * $GripperBarLength, -cos(-$GripperPositionAngle) * $GripperBarLength, 0])
      translate([-$ExtrusionWidth / 2, 0, 0])
        GripperArm();
  }
  //Support frame
  color(FrameColor)
  {
    GripperFrameSegment();
  }
  
  //Frame strengtheners
  color(FrameStrengthenerColor)
  {
    translate([($GripperSupportLength / sqrt(2)) - $ExtrusionWidth, 0, ($ExtrusionWidth / 2) + $GripperBarThickness + $GripperBarThickness])
      rotate(-45, [0, 0, 1])
        GripperBar($GripperBarLength = $GripperSupportLength);
    translate([($GripperSupportLength / sqrt(2)) - $ExtrusionWidth, 0, -(($ExtrusionWidth / 2) + $GripperBarThickness + $GripperBarThickness)])
      rotate(-45, [0, 0, 1])
        GripperBar($GripperBarLength = $GripperSupportLength);
  }
  
  //Actuator attachment bar
  color(FrameStrengthenerColor)
  {
    translate([4 - (sin($GripperPositionAngle) * $GripperBarLength), -5, 0])
      rotate(90, [1, 0, 0])
        cylinder(d = .25, h = 8, $fn = 40);
  }
}

module GripperFrameSegment()
{
  difference()
  {
    //Frame base segment
    union()
    {
      translate([-$ExtrusionWidth / 2, 0, 0])
        Extrusion($Length = $GripperFrameLength);
      translate([-$ExtrusionWidth - 0.005, $ExtrusionWidth / 2, 0])
        rotate(-90, [0, 0, 1])
          Extrusion($Length = $GripperFrameWidth);
    }
    //Gripper pivot bar mounting holes
    translate([0, 0, -($ExtrusionWidth / 2) - 0.005])
      cylinder(d = $GripperFlexHoleDiameter, h = $ExtrusionWidth + 0.01, $fn = 30);
    translate([$GripperLength - $ExtrusionWidth, 0, -($ExtrusionWidth / 2) - 0.005])
      cylinder(d = $GripperFlexHoleDiameter, h = $ExtrusionWidth + 0.01, $fn = 30);
    //Retraction spring mount hole
    translate([$GripperLength - $ExtrusionWidth - 1, 0, -($ExtrusionWidth / 2) - 0.005])
      cylinder(d = $GripperFlexHoleDiameter, h = $ExtrusionWidth + 0.01, $fn = 30);
  }
}
module RotatorArm()
{
  translate([- $ExtrusionWidth, 2*$ExtrusionWidth, -$ExtrusionWidth / 2])
    rotate(-180 + $MainBaseAngle , [0, 1, 0])
      Extrusion($Length = $RotatorArmLength);
  translate([-6.2, 1.5*$ExtrusionWidth, 0])
    rotate(-90, [1, 0, 0])
      GripperBar($GripperBarLength = 10);
}

module GripperHand()
{
  translate([$ExtrusionWidth, $GripperFrameWidth / 2, 0])
  {
    DisplayGripperSideV2();
    translate([0, -$GripperFrameWidth, 0])
      mirror([0, 1, 0])
        DisplayGripperSideV2();
  }
  //Pneumatic supports
  color(FrameColor)
  {
    translate([-7 - ($ExtrusionWidth / 2), 0, 0])
      Extrusion($Length = 7);
  }
  //Gripper pneumatic
  translate([0, 0, ($ExtrusionWidth / 2) + 0.5])
    rotate(-90, [0, 1, 0])
    {
      cylinder(d = 1, h = 8, $fn = 40);
      translate([0, 0,  (6 * $GripperPositionAngle / 75) - 6])
        cylinder(d = .25, h = 7, $fn = 40);
    }
}

module GripperHandV1()
{
  translate([$ExtrusionWidth, $GripperFrameWidth / 2, 0])
  {
    DisplayGripperSide();
    translate([0, -$GripperFrameWidth, 0])
      mirror([0, 1, 0])
        DisplayGripperSide();
  }
  //Pneumatic supports
  color(FrameColor)
  {
    translate([-7 - ($ExtrusionWidth / 2), 0, 0])
      Extrusion($Length = 7);
    translate([-7 - ($ExtrusionWidth / 2), $ExtrusionWidth, 0])
      Extrusion($Length = 7);
    translate([-7 - ($ExtrusionWidth / 2), -$ExtrusionWidth, 0])
      Extrusion($Length = 7);
  }
  //Gripper pneumatic
  translate([0, 0, ($ExtrusionWidth / 2) + 0.5])
    rotate(-90, [0, 1, 0])
    {
      cylinder(d = 1, h = 8, $fn = 40);
      translate([0, 0, 0 - (6 * $GripperPositionAngle / 75)])
        cylinder(d = .25, h = 7, $fn = 40);
    }
  //Pusher pneumatic
  color(PusherColor)
    translate([2, 0, -($ExtrusionWidth / 2) - 0.5])
      rotate(-90, [0, 1, 0])
      {
        cylinder(d = 1, h = 8, $fn = 40);
        translate([0, 0, 2 - (6 * $GripperPositionAngle / 75)])
        {
          cylinder(d = .25, h = 7, $fn = 40);
        cube([1, 3, 0.25], center = true);
        }
      }
}

module DisplayGripper()
{
  rotate(-$GripperArmAngle, [0, 1, 0])
    translate([$ExtrusionWidth - .2+ ($RotatorArmLength * cos($MainBaseAngle)), 0, $ExtrusionWidth-($RotatorArmLength * sin($MainBaseAngle))])
    {
      GripperHand();
      
      //Rotator arm
      color(FrameColor)
      {
        RotatorArm();
        mirror([0, 1, 0])
        RotatorArm();
      }
      //Powerup block
      translate([12, 0, 0])
        cube([11, 13, 13], center = true);
    }
}

module ArmMount()
{
  cube([2, 3, 1.5], center = true);
}

module DisplayCarriage()
{
  rotate(-180+$MainBaseAngle, [0, 1, 0])
  {
    //Mount for gripper arm
    ArmMount();
    //Main carriage backboard
    translate([-6, 0, .85])
      cube([14, $MainTrackSpacing + 4, 0.25], center = true);
    //Track guides
    translate([0, $MainTrackSpacing / 2, 2])
      VCarriage();
    translate([0, -$MainTrackSpacing / 2, 2])
      VCarriage();
    translate([-12, $MainTrackSpacing / 2, 2])
      VCarriage();
    translate([-12, -$MainTrackSpacing / 2, 2])
      VCarriage();
  }
}

module DisplayMainSupports()
{
  color(MainSupportColor)
  {
    //Carriage track
    translate([0, $MainTrackSpacing / 2, 0])
      rotate($MainBaseAngle, [0, 1, 0])
        Extrusion($Length = $MainTrackLength);
    translate([0, -$MainTrackSpacing / 2, 0])
      rotate($MainBaseAngle, [0, 1, 0])
        Extrusion($Length = $MainTrackLength);
    //Vertical support
    rotate(90, [0, 1, 0])
      Extrusion($Length = $MainBeamHeight);
    //Horizontal supports 
    translate([-($ExtrusionWidth / 2), $ExtrusionWidth, -$MainBeamHeight + ($ExtrusionWidth / 2)])
      Extrusion($Length = $MainBaseLength + $ExtrusionWidth);
    translate([-($ExtrusionWidth / 2), -$ExtrusionWidth, -$MainBeamHeight + ($ExtrusionWidth / 2)])
      Extrusion($Length = $MainBaseLength + $ExtrusionWidth);
  }
}

module LifterRailCarriagePlate()
{
  difference()
    {
      cube([$LifterBearingHeight + 1, $LifterBearingSpacing + 1, $LifterCarriageMaterialThickness], center = true);
      //Bolt holes
      translate([$LifterBearingHeight / 2, -$LifterBearingSpacing / 2, 0])
        cylinder(d = 3/8, h = 2, center = true, $fn = 40);
      translate([-$LifterBearingHeight / 2, -$LifterBearingSpacing / 2, 0])
        cylinder(d = 3/8, h = 2, center = true, $fn = 40);
      translate([0, $LifterBearingSpacing / 2, 0])
        cylinder(d = 3/8, h = 2, center = true, $fn = 40);
      //Remove some excess material
        translate([-4.5, 0, 0])
          rotate(35, [0, 0, 1])
            cube([10, 2, 1], center = true);
        mirror([1, 0, 0])
          translate([-4.5, 0, 0])
            rotate(35, [0, 0, 1])
              cube([10, 2, 1], center = true);
    }
}

module LifterRailCarriage()
{
  translate([0, 0, -$LifterBearingSpacing])
    mirror([0, 0, 1])
    {
      rotate(90, [1, 0, 0])
      {
        difference()
        {
          //Bearing support plates
          color([0.5, 0.5, 0.5])
          {
              translate([0, 0, ($ExtrusionWidth + $LifterCarriageMaterialThickness) / 2])
                LifterRailCarriagePlate();              
                translate([0, 0, -($ExtrusionWidth + $LifterCarriageMaterialThickness) / 2])
                  LifterRailCarriagePlate();
          }
        }
        //Riser bearings
        translate([$LifterBearingHeight / 2, -$LifterBearingSpacing / 2, 0])
          cylinder(d = $LifterBearingEffectiveDiameter, h = 0.33, center = true, $fn = 40);
        translate([-$LifterBearingHeight / 2, -$LifterBearingSpacing / 2, 0])
          cylinder(d = $LifterBearingEffectiveDiameter, h = 0.33, center = true, $fn = 40);
        translate([0, $LifterBearingSpacing / 2, 0])
          cylinder(d = $LifterBearingEffectiveDiameter, h = 0.33, center = true, $fn = 40);
          //Bolts
          translate([$LifterBearingHeight / 2, -$LifterBearingSpacing / 2, 0])
            cylinder(d = 3/8, h = 2, center = true, $fn = 40);
          translate([-$LifterBearingHeight / 2, -$LifterBearingSpacing / 2, 0])
            cylinder(d = 3/8, h = 2, center = true, $fn = 40);
          translate([0, $LifterBearingSpacing / 2, 0])
            cylinder(d = 3/8, h = 2, center = true, $fn = 40);
      }
    }
}

module LifterInnerFrame()
{
  //Main frame
  translate([0, $LifterInnerSpacing / 2, 0])
    Extrusion($Length = $LifterSegmentLength);
  translate([0, -$LifterInnerSpacing / 2, 0])
    Extrusion($Length = $LifterSegmentLength);
  
  //Lower support
  translate([$ExtrusionWidth / 2, ($LifterInnerSpacing - $ExtrusionWidth)/ 2, 0])
    rotate(-90, [0, 0, 1])
      Extrusion($Length = $LifterInnerSpacing - $ExtrusionWidth);
  //Upper support
  translate([$LifterSegmentLength - ($ExtrusionWidth / 2) + $ExtrusionWidth, ($LifterInnerSpacing + $ExtrusionWidth)/ 2, 0])
    rotate(-90, [0, 0, 1])
      Extrusion($Length = $LifterInnerSpacing + $ExtrusionWidth); 

  //Carriage couplers
  translate([2.5, 0, 0])
  {
    translate([($LifterBearingHeight / 2) + 0.5 + $ExtrusionWidth, ($LifterInnerSpacing / 2) + $LifterCarriageMaterialThickness + $ExtrusionWidth, $LifterBearingSpacing / 2])
      LifterRailCarriage();
    translate([($LifterBearingHeight / 2) + 0.5 + $ExtrusionWidth, -(($LifterInnerSpacing / 2) + $LifterCarriageMaterialThickness + $ExtrusionWidth), $LifterBearingSpacing / 2])
      LifterRailCarriage();
  }  
}

module LifterOuterFrame()
{
  //Main frame 
  translate([0, ($LifterInnerSpacing / 2) + $LifterCarriageMaterialThickness + $ExtrusionWidth, 0])
    Extrusion($Length = $LifterSegmentLength);
  translate([0, -(($LifterInnerSpacing / 2) + $LifterCarriageMaterialThickness + $ExtrusionWidth), 0])
    Extrusion($Length = $LifterSegmentLength);
//  //Lower support
//  translate([$ExtrusionWidth / 2, (($LifterInnerSpacing + $ExtrusionWidth) / 2) + $LifterCarriageMaterialThickness, 0])
//    rotate(-90, [0, 0, 1])
//      Extrusion($Length = $LifterInnerSpacing + $ExtrusionWidth + $LifterCarriageMaterialThickness + $LifterCarriageMaterialThickness);
  //Upper support
  translate([$LifterSegmentLength - ($ExtrusionWidth / 2), (($LifterInnerSpacing + $ExtrusionWidth) / 2) + $LifterCarriageMaterialThickness + $ExtrusionWidth, -$ExtrusionWidth - $ExtrusionWidth])
    rotate(-90, [0, 0, 1])
      Extrusion($Length = $LifterInnerSpacing + $ExtrusionWidth + $LifterCarriageMaterialThickness + $LifterCarriageMaterialThickness + $ExtrusionWidth + $ExtrusionWidth);
  //Upper support padding
  translate([$LifterSegmentLength - ($ExtrusionWidth / 1) - 1, (($LifterInnerSpacing) / 2) + $LifterCarriageMaterialThickness + $ExtrusionWidth, -$ExtrusionWidth])
    Extrusion($Length = 2);
  mirror([0, 1, 0])
  translate([$LifterSegmentLength - ($ExtrusionWidth / 1) - 1, (($LifterInnerSpacing) / 2) + $LifterCarriageMaterialThickness + $ExtrusionWidth, -$ExtrusionWidth])
    Extrusion($Length = 2);
}

module LifterVCarriage()
{
  scale(1/25.4)
    VCarriage3();
}

module LifterSupportPlate()
{
  difference()
  {
    cube([$LifterSupportThickness, 5.45, 3.74], center = true);
    //Frame clearance
    translate([0, $LifterInnerSpacing / 2, 0])
      cube([.126, $ExtrusionWidth + .2, $ExtrusionWidth + .2], center = true);
    translate([0, -$LifterInnerSpacing / 2, 0])
      cube([.126, $ExtrusionWidth + .2, $ExtrusionWidth + .2], center = true);
    //Mounting holes
    translate([0, $LifterInnerSpacing / 2, 0])
      rotate(90, [0, 1, 0])
        VCarriage3MountHoleSet($Scale = 1/25.4);
    translate([0, -($LifterInnerSpacing / 2) + 1.615, 0])
      rotate(90, [0, 1, 0])
        VCarriage3MountHoleSet($Scale = 1/25.4);
  }
}

module LifterGripperCarriage()
{
  //Inner rail bearing blocks
  translate([0, $LifterInnerSpacing / 2, -2.2])
    rotate(90, [0, 1, 0])
      LifterVCarriage();
  translate([0, -$LifterInnerSpacing / 2, -2.2])
    mirror([0, 1, 0])
      rotate(90, [0, 1, 0])
        LifterVCarriage();
  //Upper/lower support plates
  color([.3, .2, .1])
  {
    translate([-.85, 0, -2.2])
      LifterSupportPlate();
    translate([2.4, 0, -2.2])
      LifterSupportPlate();
  }
}

module MotorBlock()
{
  translate([0, -.5, 0])
    cube([2, .8, 1], center = true);
  cylinder(d = 1.5, h = 1, $fn = 30, center = true);
  translate([0, 0, .7])
    cylinder(d = 1.3, h = 3, $fn = 30, center = true);
  translate([0, 0, -1])
    cylinder(d = .25, h = .6, $fn = 30, center = true);
}

module MotorAndWheel()
{
  color([0.6, 0.6, 0.7])
    MotorBlock();
  color([0.7, 0.1, 0.2])
  translate([0, 0, -1.3])
    cylinder(d = $Gripper3WheelDiameter, h = .75, $fn = 50, center = true);
}

module Gripper3SideArm()
{
  rotate($Gripper3ArmAngle, [0, 0, 1])
  {
    translate([-$Gripper3SideArmOffset, 0, 0])
    difference()
    {
      Extrusion($Length = $Gripper3SideArmLength);
      translate([$Gripper3SideArmLength - 1, -2.5, -1.5])
        rotate(30, [0, 0, 1])
          cube([3, 2, 3]);
    }
    
    translate([$Gripper3SideArmLength - 1 - $Gripper3SideArmOffset, ($ExtrusionWidth / 2) + 0.9, 0])
      MotorAndWheel();
  }
  translate([0, 0, -.5])
  cylinder(d = $GripperFlexHoleDiameter, h = 3, $fn = 20, center = true);
}

module PneumaticCylinder()
{
  cylinder(d = $Gripper3CylinderDiameter, h = $Gripper3CylinderLength, $fn = 20);
  translate([0, 0, $Gripper3CylinderLength - $CylinderStrokePosition])
    cylinder(d = .2, h = $Gripper3CylinderStroke, $fn = 20);
}


module GripperHand3()
{
  //Sides
  translate([-$Gripper3SideOffset, ($Gripper3FrameWidth + $ExtrusionWidth) / 2, 0])
    Extrusion($Length = $Gripper3SideLength);
  translate([-$Gripper3SideOffset, -($Gripper3FrameWidth  + $ExtrusionWidth) / 2, 0])
    Extrusion($Length = $Gripper3SideLength);
  //Main support
  translate([0, -$Gripper3FrameWidth / 2, 0])
    rotate(90, [0, 0, 1])
      Extrusion($Length = $Gripper3FrameWidth);
  //Pneumatic support
  translate([-$Gripper3SideOffset + ($ExtrusionWidth / 2), -$Gripper3FrameWidth / 2, 0])
    rotate(90, [0, 0, 1])
      Extrusion($Length = $Gripper3FrameWidth);

  //Inner wheels
  translate([$Gripper3Potition, -($Gripper3FrameWidth / 2) + .9, 0])
    MotorAndWheel();
  translate([$Gripper3Potition, ($Gripper3FrameWidth / 2) - .9, 0])
    rotate(180, [0, 0, 1])
      MotorAndWheel();
  //Ares and wheels
  translate([$Gripper3Potition, -($Gripper3FrameWidth + $ExtrusionWidth) / 2, $ExtrusionWidth])    
    Gripper3SideArm();
  mirror([0, 1, 0])
    translate([$Gripper3Potition, -($Gripper3FrameWidth + $ExtrusionWidth) / 2, $ExtrusionWidth])    
      Gripper3SideArm();
  //Pneumatics
  translate([-$Gripper3SideOffset + ($ExtrusionWidth / 2), -.5, ($ExtrusionWidth + $Gripper3CylinderDiameter) / 2])
    rotate(90, [1, 0, 0])
      PneumaticCylinder();
  mirror([0, 1, 0])
    translate([-$Gripper3SideOffset + ($ExtrusionWidth / 2), -.5, ($ExtrusionWidth + $Gripper3CylinderDiameter) / 2])
      rotate(90, [1, 0, 0])
        PneumaticCylinder();
}

module GripperMainFrame()
{
  //Sides
  translate([-$Gripper3SideOffset - $GripperLifterSpacing, ($Gripper3FrameWidth + $ExtrusionWidth) / 2, 0])
    Extrusion($Length = $Gripper3SideLength);
  translate([-$Gripper3SideOffset - $GripperLifterSpacing, -($Gripper3FrameWidth  + $ExtrusionWidth) / 2, 0])
    Extrusion($Length = $Gripper3SideLength);
  //Main support
  translate([0, -$Gripper3FrameWidth / 2, 0])
    rotate(90, [0, 0, 1])
      Extrusion($Length = $Gripper3FrameWidth);
  //Pneumatic support
  translate([-$Gripper3SideOffset + ($ExtrusionWidth / 2), -$Gripper3FrameWidth / 2, 0])
    rotate(90, [0, 0, 1])
      Extrusion($Length = $Gripper3FrameWidth);
  //Vertical supports for lifter attach
  translate([-$Gripper3SideOffset - $GripperLifterSpacing - ($ExtrusionWidth / 2), ($Gripper3FrameWidth / 2) + ($ExtrusionWidth / 2), - ($ExtrusionWidth / 2)])
    rotate(-90, [0, 1, 0])
      Extrusion($Length = 3.5);
  mirror([0, 1, 0])
    translate([-$Gripper3SideOffset - $GripperLifterSpacing - ($ExtrusionWidth / 2), ($Gripper3FrameWidth / 2) + ($ExtrusionWidth / 2), - ($ExtrusionWidth / 2)])
      rotate(-90, [0, 1, 0])
        Extrusion($Length = 3.5);
}

module GripperHand4()
{
  //Parameters to change as necessary...
  //Gripper3FrameWidth   = Spacing between sides. Note, this is the inside opening size
  //Gripper3SideOffset   = 'box' depth. Note, 1.5 gives touching rails i.e. no gap
  //Gripper3SideLength   = Length of each side rail
  //GripperLifterSpacing = Length of rear extension to attach to lifter

  $Gripper3FrameWidth = 18.5;
  $Gripper3SideOffset = 3;
  $Gripper3SideLength = 10;
  $GripperLifterSpacing = 4;

  //Translate so rotation point is about the lifter mount
translate([$Gripper3SideOffset + $GripperLifterSpacing - ($ExtrusionWidth / 2) - (($LifterBearingEffectiveDiameter - $ExtrusionWidth) / 2), 0, -1])
  {

  //Main frame
  GripperMainFrame();

  //Lifter attachments
  translate([-$Gripper3SideOffset - $GripperLifterSpacing + ($ExtrusionWidth / 2), +($Gripper3FrameWidth / 2) + $ExtrusionWidth + ($ExtrusionWidth / 2) + $LifterClearance, $ExtrusionWidth / 2])
    LifterHandAttach();

  mirror([0, 1, 0])
  translate([-$Gripper3SideOffset - $GripperLifterSpacing + ($ExtrusionWidth / 2), +($Gripper3FrameWidth / 2) + $ExtrusionWidth + ($ExtrusionWidth / 2) + $LifterClearance, $ExtrusionWidth / 2])
      LifterHandAttach();

  //Inner wheels
  translate([$Gripper3Potition, -($Gripper3FrameWidth / 2) + .9, 0])
    MotorAndWheel();
  translate([$Gripper3Potition, ($Gripper3FrameWidth / 2) - .9, 0])
    rotate(180, [0, 0, 1])
      MotorAndWheel();

  //Arms and wheels
  translate([$Gripper3Potition, -($Gripper3FrameWidth + $ExtrusionWidth) / 2, $ExtrusionWidth])    
    Gripper3SideArm();
  mirror([0, 1, 0])
    translate([$Gripper3Potition, -($Gripper3FrameWidth + $ExtrusionWidth) / 2, $ExtrusionWidth])    
      Gripper3SideArm();

  //Pneumatics
  translate([-$Gripper3SideOffset + ($ExtrusionWidth / 2), -.5, ($ExtrusionWidth + $Gripper3CylinderDiameter) / 2])
    rotate(90, [1, 0, 0])
      PneumaticCylinder();
  mirror([0, 1, 0])
    translate([-$Gripper3SideOffset + ($ExtrusionWidth / 2), -.5, ($ExtrusionWidth + $Gripper3CylinderDiameter) / 2])
      rotate(90, [1, 0, 0])
        PneumaticCylinder();
  }

}

module Lifter()
{
  rotate(-90, [0, 1, 0])
  {
    echo ("Lifter outer frame pieces");
    translate([0, 0, -$ExtrusionWidth])
      LifterOuterFrame();
    echo ("Lifter inner frame pieces");
    translate([$LifterSegmentExtention, 0, 0])
      LifterInnerFrame();
    echo ("Gripper pieces");
    translate([2.8 + $LifterSegmentExtention * 2, 0, 0])
      rotate(180, [0, 0, 1])
        rotate(-90 - $GripperRotation, [0, 1, 0])
          GripperHand4();
  }
}

module DisplayAllMech1()
{
  translate([$GripperTrackPosition * cos($MainBaseAngle), 0, -$GripperTrackPosition * sin ($MainBaseAngle)])
  translate([1.8, 0, .9])
  {
    DisplayGripper();
    DisplayCarriage();
  }
  DisplayMainSupports();

  //Max extension check
  translate([33, 0, -6])
  #  cube([16, 16, 16], center = true);
  //Max height check
  #translate([-10, -3, -55])
    cube([6, 6, 85]);
  
}

module GenerateDXF()
{
    projection(cut = false)
    LifterRailCarriagePlate();
}

module VBearingSpacer()
{
  $BearingSpacerThickness = .05;
  $BearingClearance = 0.03;
  $BearingThickness = 0.4365;
  
  $BlockThickness = ($ExtrusionWidth + $BearingClearance - $BearingThickness - $BearingSpacerThickness) / 2;
  difference()
  {
    union()
    {
        cylinder(d = 1, h = $BlockThickness, $fn = 80);
      cylinder(d = 0.75, h = $BlockThickness + $BearingSpacerThickness, $fn = 80);
    }
    cylinder(d = 0.391, h = 10, $fn = 80, center = true);
  }
}

module BearingSpacerSet()
{
  scale(25.4)
  for ( i = [0 : 3] )
    translate([i * 1.1, 0, 0])
    for ( j = [0 : 3] )
      translate([0, j * 1.1, 0])
    {
    VBearingSpacer();
    }
}

module CornerBracket()
{
  color(SteelColor)
  {
    cube([$BracketLength, 0.1, 0.5]);
    cube([0.1, $BracketLength, 0.5]);
    linear_extrude(height = 0.1)
      polygon(points=[[0,0],[0,$BracketLength],[$BracketLength,0],[0,0]]);
  }
  
}

module Bolt()
{
  cylinder(d = $BoltDiameter, h = $BoltLength, $fn = 20);
  cylinder(d = $BoltDiameter * 2, h = $BoltHeadLength, $fn = 6);
}

module LifterHandAttach()
{
  $BracketLength = 2;
  mirror([0, 1, 0])
  rotate(90, [0, 0, 1])
  rotate(180, [1, 0, 0])
  rotate(90, [0, 1, 0])
  {
    translate([0, -$ExtrusionWidth / 2, ($ExtrusionWidth / 2) + $LifterClearance])
    {
      //Bracket does not need to be right on the edge
      translate([0, 0, 0.25])
        CornerBracket();
      //Bearings, bolts and spacers
      translate([$BracketLength, -$LifterBearingEffectiveDiameter / 2,-($ExtrusionWidth / 2) - $LifterClearance])
      {
        //Bearing
        cylinder(d = $LifterBearingEffectiveDiameter, h = 0.33, center = true, $fn = 40);
        //Bolt
        translate([0, 0, -$ExtrusionWidth + $LifterClearance + $LifterClearance])
          Bolt($BoltDiameter = 0.25, $BoltLength = 3, $BoltHeadLength = 0.2);
        //Spacers
        cylinder(d = .75, h = 1.2, center = true, $fn = 40);
      }
      translate([-$ExtrusionWidth / 2, $ExtrusionWidth + ($LifterBearingEffectiveDiameter / 2), -($ExtrusionWidth / 2) - $LifterClearance])
      {
        //Bearing
        cylinder(d = $LifterBearingEffectiveDiameter, h = 0.33, center = true, $fn = 40);
        //Bolt
        translate([0, 0, -$ExtrusionWidth + $LifterClearance + $LifterClearance])
          Bolt($BoltDiameter = 0.25, $BoltLength = 3, $BoltHeadLength = 0.2);
        //Spacers
        cylinder(d = .75, h = 1.2, center = true, $fn = 40);
      }
    }
    //Support straps
    color(SteelColor)
    {
      translate([2.13, -1.8, -($ExtrusionWidth / 2) - $LifterClearance - ($GripperBarThickness / 2)])
        rotate(50, [0, 0, 1])
          cube([1, 4.4, $GripperBarThickness]);
      translate([2.13, -1.8,$ExtrusionWidth + $GripperBarThickness + ($ExtrusionWidth / 2)])
        rotate(50, [0, 0, 1])
          cube([1, 4.4, $GripperBarThickness]);
    }
  }
}

//PrintCarriages();

//DisplayAllMech1();

Lifter();
//GripperHand();
//rotate(90, [1, 0, 0])
//    VCarriage3();

//LifterOuterFrame();

//GripperHand3();

//LifterHandAttach();

//LifterOuterFrame();

//LifterRailCarriage();
//LifterRailCarriagePlate();
//GenerateDXF();

//BearingSpacerSet();

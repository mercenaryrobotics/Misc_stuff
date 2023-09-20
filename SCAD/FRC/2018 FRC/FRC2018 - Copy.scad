//Dimensions are in mm
$BearingMountHole = 9.5;
$BearingSpacing = 53;
$BearingDiameter = 31;
$BearingThickness = 11;
$RailOpening = 30;
$MountXSpacing = 95;
$MountZSpacing = 18;
$MountXSpacing2 = 85;
$MountZSpacing2 = 35;
$MountingHole = 6.3;

//Dimensions are in inches
$RotatorArmLength = 30;
$GripperLength = 9;
$GripperLeverLength = 4;
$GripperFrameLength = $GripperLength;
$GripperFrameWidth = 18;
$GripperSupportLength = 5;
$GripperActuatorLength = 3;
$GripperBarLength = 4;
$MainBeamHeight = 49;
$MainBaseLength = 24;
$MainTrackSpacing = 5.5;

$MainBaseAngle = atan($MainBeamHeight / $MainBaseLength);
$MainTrackLength = sqrt(( $MainBeamHeight * $MainBeamHeight) + ($MainBaseLength * $MainBaseLength));
echo ("Angle = %f", $MainBaseAngle);
echo ("Track length = %d", $MainTrackLength);

$ExtrusionWidth = 1;
$ExtrusionThickness = .15;
$GripperFlexHoleDiameter = 0.25;
$GripperBarThickness = 0.1;

$GripperPositionAngle = 65;
$GripperArmAngle = 142;
$GripperTrackPosition = 0;
PivotBarColor = [0.7, 0.7, 0.72];
GripperColor = [0.6, 0.6, 0.62];
FrameColor = [0.8, 0.8, 0.62];
MainSupportColor = [0.7, 0.8, 0.62];
FrameStrengthenerColor = [0.8, 0.8, 0.7];
PusherColor = [0.9, 0.8, 0.7];

$LifterSegmentExtention = 30;
$HandSegmentExtension = 30;
$LifterSegmentLength = 50;
$LifterInnerSpacing = 6;
$LifterBearingEffectiveDiameter = 1.086;
$LifterBearingSpacing = $LifterBearingEffectiveDiameter + $ExtrusionWidth;
$LifterBearingHeight = 6;
$LifterBearingClearance = 0.25;
$LifterCarriageMaterialThickness = 0.25;

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
  #cube([100, 100, 100], center = true);
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

module LifterRailCarriage()
{
  rotate(90, [1, 0, 0])
  {
    //Riser bearings
    translate([$LifterBearingHeight / 2, -$LifterBearingSpacing / 2, 0])
      cylinder(d = $LifterBearingEffectiveDiameter, h = 0.33, center = true, $fn = 40);
    translate([-$LifterBearingHeight / 2, -$LifterBearingSpacing / 2, 0])
      cylinder(d = $LifterBearingEffectiveDiameter, h = 0.33, center = true, $fn = 40);
    translate([0, $LifterBearingSpacing / 2, 0])
      cylinder(d = $LifterBearingEffectiveDiameter, h = 0.33, center = true, $fn = 40);
    //Bolts
    translate([$LifterBearingHeight / 2, -$LifterBearingSpacing / 2, 0])
      cylinder(d = 3/8, h = 1.5, center = true, $fn = 40);
    translate([-$LifterBearingHeight / 2, -$LifterBearingSpacing / 2, 0])
      cylinder(d = 3/8, h = 1.5, center = true, $fn = 40);
    translate([0, $LifterBearingSpacing / 2, 0])
      cylinder(d = 3/8, h = 1.5, center = true, $fn = 40);
    
    //Bearing support plates
    color([0.5, 0.5, 0.5, 0.3])
    {
      translate([0, 0, ($ExtrusionWidth + $LifterCarriageMaterialThickness) / 2])
        cube([$LifterBearingHeight + 1, $LifterBearingSpacing + 1, $LifterCarriageMaterialThickness], center = true);
      translate([0, 0, -($ExtrusionWidth + $LifterCarriageMaterialThickness) / 2])
        cube([$LifterBearingHeight + 1, $LifterBearingSpacing + 1, $LifterCarriageMaterialThickness], center = true);
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
  translate([$LifterSegmentLength - ($ExtrusionWidth / 2), ($LifterInnerSpacing - $ExtrusionWidth)/ 2, 0])
    rotate(-90, [0, 0, 1])
      Extrusion($Length = $LifterInnerSpacing - $ExtrusionWidth); 

  //Carriage couplers
  translate([2.5, 0, 0])
  {
    translate([($LifterBearingHeight / 2) + 0.5 + $ExtrusionWidth, ($LifterInnerSpacing / 2) + $LifterCarriageMaterialThickness + $ExtrusionWidth, $LifterBearingSpacing / 2])
      LifterRailCarriage();
    translate([($LifterBearingHeight / 2) + 0.5 + $ExtrusionWidth, -(($LifterInnerSpacing / 2) + $LifterCarriageMaterialThickness + $ExtrusionWidth), $LifterBearingSpacing / 2])
      LifterRailCarriage();
  }
  
  translate([2.8 + $HandSegmentExtension, 0, 2.2])
    rotate(180, [0, 0, 1])
      rotate(-90, [0, 1, 0])
        GripperHand();
}

module LifterOuterFrame()
{
  //Main frame 
  translate([0, ($LifterInnerSpacing / 2) + $LifterCarriageMaterialThickness + $ExtrusionWidth, $LifterBearingSpacing / 2])
    Extrusion($Length = $LifterSegmentLength);
  translate([0, -(($LifterInnerSpacing / 2) + $LifterCarriageMaterialThickness + $ExtrusionWidth), $LifterBearingSpacing / 2])
    Extrusion($Length = $LifterSegmentLength);
  //Lower support
  translate([$ExtrusionWidth / 2, (($LifterInnerSpacing + $ExtrusionWidth) / 2) + $LifterCarriageMaterialThickness, $LifterBearingSpacing / 2])
    rotate(-90, [0, 0, 1])
      Extrusion($Length = $LifterInnerSpacing + $ExtrusionWidth + $LifterCarriageMaterialThickness + $LifterCarriageMaterialThickness);
//  //Upper support
//  translate([$LifterSegmentLength - ($ExtrusionWidth / 2), (($LifterInnerSpacing + $ExtrusionWidth) / 2) + $LifterCarriageMaterialThickness, $LifterBearingSpacing / 2])
//    rotate(-90, [0, 0, 1])
//      Extrusion($Length = $LifterInnerSpacing + $ExtrusionWidth + $LifterCarriageMaterialThickness + $LifterCarriageMaterialThickness);
}

module Lifter()
{
  rotate(-90, [0, 1, 0])
  {
    LifterOuterFrame();
    translate([$LifterSegmentExtention, 0, 0])
      LifterInnerFrame();
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

  /*
  //Max extension check
  translate([33, 0, -6])
  #  cube([16, 16, 16], center = true);
  //Max height check
  #translate([-10, -3, -55])
    cube([6, 6, 85]);
  */
}

//PrintCarriages();

//DisplayAllMech1();

Lifter();

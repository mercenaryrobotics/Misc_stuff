$fn = 50;
$Hex2Circle = 1/(sin(60));
$Inch2mm = 25.5;
 
$BearingDiameter = 12;
$PlateThickness = 5;
 
$RollerDiameter = 15;
$RearRollerSpacing = $RollerDiameter + (0.5 * $Inch2mm) + 5;
$RearRollerAdder = 4;
$PixelFloorPickerO1UpperPlateSpacing = 150;
$PixelFloorPickerO1UpperRollerLength = $PixelFloorPickerO1UpperPlateSpacing - $PlateThickness - 1;
$PixelFloorPickerO1LowerPlateSpacing = $PixelFloorPickerO1UpperPlateSpacing + $PlateThickness + $PlateThickness + 1;
$PixelFloorPickerO1LowerRollerLength = $PixelFloorPickerO1LowerPlateSpacing - $PlateThickness - 1;
$PixelFloorPickerO1RearLength = 150;
$PixelFloorPickerO1MidOffset  = 95;
$RotationHOffset = 80;
 
$ArmLength = 18 * $Inch2mm;
$ArmAngleIdle = 43.5;
$ArmAngle = 0;
$GrabberAngle = 20;
 
$SliderGuideAngle = 45;
$SliderGuideRotateAngle = 0;
 
$Slider1Position = 12 * $Inch2mm;
$Slider2Position = 12 * $Inch2mm;
$Slider3Position = 10 * $Inch2mm;
 
module BoundingBox()
{
  color([0.9, 0.9, 0.9, 0.3])
    translate([-9 * $Inch2mm, -9 * $Inch2mm, 0])
      cube([18 * $Inch2mm, 18 * $Inch2mm, 13.7 * $Inch2mm]);
}
 
module Pixel($Color)
{
  color($Color)
    difference()
    {
      cylinder(d = $Hex2Circle * $Inch2mm * 3, h = $Inch2mm * .5, $fn = 6);
      translate([0, 0, -.1])
          cylinder(d = $Hex2Circle * $Inch2mm * 1.25, h = $Inch2mm * .51, $fn = 6);
    }
}
 
module CylinderOffset(d, h)
{
  translate([0, 0, d/2])
    rotate(90, [0, 1, 0])
      cylinder(d = d, h = h, center = true);
}
 
 
module PixelFloorPickerO1UpperRollers()
{
  //Leading top roller
  translate([0, 22, 4 + 40])//Band offset from ground
    CylinderOffset($RollerDiameter, $PixelFloorPickerO1UpperRollerLength);
  //Second top roller
  translate([0, $PixelFloorPickerO1MidOffset, $RearRollerSpacing])//Band offset from ground
    CylinderOffset($RollerDiameter, $PixelFloorPickerO1UpperRollerLength);
  //Trailing top roller
  translate([0, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, $RearRollerSpacing + $RearRollerAdder])
    CylinderOffset($RollerDiameter, $PixelFloorPickerO1UpperRollerLength);
}
 
 
module PixelFloorPickerO1LowerRollers()
{
  //Leading lower roller
  translate([0, $PixelFloorPickerO1MidOffset, 0])//Band offset from ground
    CylinderOffset($RollerDiameter, $PixelFloorPickerO1LowerPlateSpacing);
  //Trailing lower roller
  translate([0, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0])//Band offset from ground
    CylinderOffset($RollerDiameter, $PixelFloorPickerO1LowerPlateSpacing);
}
 
module PixelFloorPickerO1Upper()
{
  //Upper side plates
  translate([$PixelFloorPickerO1UpperPlateSpacing / 2, 0, 0])
    PixelFloorPickerO1UpperPlate(m = 0);
  translate([-$PixelFloorPickerO1UpperPlateSpacing / 2, 0, 0])
    PixelFloorPickerO1UpperPlate(m = 1);
 
  //Upper rollers
  PixelFloorPickerO1UpperRollers();
}
 
module PixelFloorPickerO1Lower()
{
  //Lower side plates
  translate([$PixelFloorPickerO1LowerPlateSpacing / 2, 0, 0])
    PixelFloorPickerO1LowerPlate(m = 0);
  translate([-$PixelFloorPickerO1LowerPlateSpacing / 2, 0, 0])
    PixelFloorPickerO1LowerPlate(m = 1);
 
  //Lower rollers
  PixelFloorPickerO1LowerRollers();
}
 
module PixelFloorPickerO1()
{ 
  //Upper components
  color("Red", 0.7)
    PixelFloorPickerO1Upper();
  //Lower components
  color("Blue", 0.7)
    PixelFloorPickerO1Lower();
}
 
module PixelFloorPickerO1Subsystem1()
{ 
  RotateAbout(0, (16 * $Inch2mm) + 10, ((12 + 1) * $Inch2mm) - 10, -$ArmAngle)
  {
    RotateAbout(0, $PixelFloorPickerO1MidOffset + $RotationHOffset, ($RollerDiameter / 2), $GrabberAngle + $ArmAngle + ($ArmAngle / 10))
    {
      PixelFloorPickerO1();
    }
  }
  //Arm
  translate([($PixelFloorPickerO1LowerPlateSpacing / 2) + 10 + ($PlateThickness / 2), 0, 0])
  {
    //Rear support
    translate([-10 - 20, 16 * $Inch2mm, 1 * $Inch2mm])
      cube([20, 20, 12 * $Inch2mm]);
    //Connecting arm
    translate([0, 10 + (16 * $Inch2mm), ((12 + 1) * $Inch2mm) - 10])
      rotate(180 - $ArmAngleIdle - $ArmAngle, [1, 0, 0])
        translate([-10, -10, -10])
          cube([20, 20, $ArmLength]);
  }
}
 
module PixelFloorPickerO1UpperPlateHoles(d, h, offset1 = 0, offset2 = 0)
{
  translate([($RollerDiameter / 2) + $PlateThickness + offset1 + 40, offset2 + 22, 0])
    cylinder(d = d, h = h, center = true);
  translate([$RearRollerSpacing + ($RollerDiameter / 2), $PixelFloorPickerO1MidOffset, 0])
    cylinder(d = d, h = h, center = true);
  translate([$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0])
    cylinder(d = d, h = h, center = true);
}
 
module PixelFloorPickerO1LowerPlateHoles(d, h, offset1 = 0, offset2 = 0)
{
  //Primary rollers/Outer bounds
  translate([$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0])
    cylinder(d = d, h = h, center = true);
  translate([($RollerDiameter / 2), $PixelFloorPickerO1MidOffset, 0])
   cylinder(d = d, h = h, center = true);
  translate([($RollerDiameter / 2), $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0])
    cylinder(d = d, h = h, center = true);
  //Rotation axis shaft
  translate([($RollerDiameter / 2), $PixelFloorPickerO1MidOffset + $RotationHOffset, 0])
    cylinder(d = d, h = h, center = true);
 
}
 
module PixelFloorPickerO1LowerPlate(m)
{
  mirror([m, 0, 0])
    rotate(-90, [0, 1, 0])
      difference()
      {
        hull()
          PixelFloorPickerO1LowerPlateHoles(26, $PlateThickness, 3, 3);
        translate([0, 0, 1])
          PixelFloorPickerO1LowerPlateHoles($BearingDiameter, $PlateThickness);
        //Shaft opening
        PixelFloorPickerO1LowerPlateHoles($BearingDiameter - $PlateThickness, $PlateThickness + 1);
      }
}
 
module RotateAbout(x, y, z, a)
{
  translate([x, y, z])
    rotate(a, [1, 0, 0])
      translate([-x, -y, -z])
        children();
}
 
module PixelFloorPickerO1UpperPlate(m)
{
  mirror([m, 0, 0])
    rotate(-90, [0, 1, 0])
      difference()
      {
        hull()
          PixelFloorPickerO1UpperPlateHoles(26, $PlateThickness, 3, 3);
        translate([0, 0, 1])
          PixelFloorPickerO1UpperPlateHoles($BearingDiameter, $PlateThickness);
        //Shaft opening
        PixelFloorPickerO1UpperPlateHoles($BearingDiameter - $PlateThickness, $PlateThickness + 1);
      }
}
 
module TSlot(Length = 0)
{
  linear_extrude(height = Length, center = true, convexity = 10, twist = 0)
  {
  }
}
 
module CChannelTRail(Holes)
{
  CChannel(Holes = Holes, Depth = 12, Rx = -1, Ry = -1);
  translate([-12.5, 0, -5])
    cube([10, (Holes + 1)*24, 10]);
}
 
module SliderRailSubSystem()
{
  //Back support
  translate([144 , 62, 26.2])
    rotate(-23, [1, 0, 0])
      rotate(180, [0, 0, 1])
        CChannel(Holes = 13, Depth = 12, Rx = 0, Ry = -1, Rz = 0);
  //Slider rails
  RotateAbout(0, 183.5, 313, -$SliderGuideRotateAngle)
    translate([(24*4) + 45, -(24 * 7) + 80, 48 - 5])
    {
      rotate($SliderGuideAngle, [1, 0, 0])
      {
        translate([0, 48, 0])
        {
          CChannelTRail(Holes = 14);
          translate([-15, $Slider1Position, 0])
          {
            CChannelTRail(Holes = 14);
            translate([-15, $Slider2Position, 0])
                CChannelTRail(Holes = 14);
          }
        }
      }
    }
}
 
module PixelFloorPickerO1Subsystem2()
{ 
  //Left slider rail
  SliderRailSubSystem();
  //Right slider rail
  mirror([1, 0, 0])
    SliderRailSubSystem();
  //Intake
  RotateAbout(0, 183.5, 313, -$SliderGuideRotateAngle)
    translate([0, -40 , 80])
      rotate($SliderGuideAngle, [1, 0, 0])
        translate([0, $Slider1Position + $Slider2Position + $Slider3Position,0]) 
          rotate(-$SliderGuideAngle, [1, 0, 0])
            translate([0, 40, -80])
              translate([0, -270, 39])
                RotateAbout(0, $PixelFloorPickerO1MidOffset + $RotationHOffset, ($RollerDiameter / 2), 25)
                  PixelFloorPickerO1();
 
}
 
module CChannel(Holes, Depth, Rx = 0, Ry = 0, Rz = 0)//Depth = 48 or 12
{
  $Length = (Holes + 1) * 24;
  rotate(90, [Rx, 0, 0])
  rotate(90, [0, Ry, 0])
  rotate(90, [0, 0, Rz])
    difference()
    {
      translate([0, -24, 0])
        cube([$Length, 48, Depth]);
      translate([-1, -21.5, 2.5])
        cube([$Length + 2, 43, Depth]);
      for (i = [1:Holes])
      {
        translate([i * 24, 0, -1])
          cylinder(d = 17, h = 50);
        translate([i * 24, 0, 24])
        rotate(90, [1, 0, 0])
          cylinder(d = 17, h = 50, center = true);
      }
    }
}
 
module MecanumWheel(ShaftD = 14)
{
  rotate(90, [1, 0, 0])
  {
    color("Yellow")
      cylinder(d = 96, h = 38, center = true);
    color("Black")
      cylinder(d = ShaftD, h = 44, center = true);
  }
}
 
module DriveBase(FrontOffset = 0, BackOffset = 0)
{
  $VHoles = 17;
  $HHoles = 7;
 
  translate([-($VHoles * 12) - 12, -($HHoles * 12) - 36, 24 + 48])
  {
    //Left channel
    rotate(180, [1, 0, 0])
      CChannel(Holes = $VHoles, Depth = 48);
    //Right channel
    translate([0, 48 + (($HHoles + 1) * 24), 0])
      rotate(180, [1, 0, 0])
        CChannel(Holes = 17, Depth = 48);
    //Front channel
    translate([24 + (FrontOffset * 24), 24, 0])
      rotate(180, [1, 0, 0])
        CChannel(Holes = $HHoles, Depth = 48, Rz = -1);
    //Back channel
    translate([(($VHoles - BackOffset) * 24), 24, 0])
      rotate(180, [1, 0, 0])
       CChannel(Holes = $HHoles, Depth = 48, Rz = -1);
    //Wheels, left
    translate([48, -(48 + 40) / 2, -24])
      MecanumWheel();
    translate([(($VHoles - 1) * 24), -(48 + 40) / 2, -24])
      MecanumWheel();
    //Wheels, right
    translate([48,(($HHoles + 3) * 24) + (48 + 40) / 2, -24])
      MecanumWheel();
    translate([(($VHoles - 1) * 24), (($HHoles + 3) * 24) + (48 + 40) / 2, -24])
      MecanumWheel();
  }
}
 
module Backdrop()
{
  scale(25.4)
  {
    color("green", 0.7)
    {
      translate([-20.125 / 2, 0, 0])
      {
        difference()
        {
          cube([20.125, 25.625, 35]);
          rotate(-30, [1, 0, 0])
            translate([-0.5, -26, 0])
              cube([21, 26, 45]);
        }
      }
    }
    color("white")
    {
      translate([0, 7.2, 12.4])
        rotate(-30, [1, 0, 0])
          cube([20, .1, 1], center = true);
      translate([0, 10.95, 19])
        rotate(-30, [1, 0, 0])
          cube([20, .1, 1], center = true);
      translate([0, 14.85, 25.75])
        rotate(-30, [1, 0, 0])
          cube([20, .1, 1], center = true);
    }
    color("purple")
      translate([0, 17.15, 29.75])
        rotate(-30, [1, 0, 0])
          cube([20, .1, 1], center = true);
  }
}
 
//translate([0, 40, 0])
//  Pixel("GREEN");
 
//PixelFloorPickerO1Subsystem1();
//PixelFloorPickerO1Subsystem2();
 
module FullRobot()
{
  rotate(90, [0, 0, 1])
    DriveBase(FrontOffset = 8);
  PixelFloorPickerO1Subsystem2();
}
 
FullRobot();
 
BoundingBox();
translate([0, (9*$Inch2mm), 0])
  Backdrop();

 
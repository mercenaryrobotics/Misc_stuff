

/* [Action] */
$Action = 1; //[0:Nothing, 1:Render Wheel, 2:Render Side, 3:Render Base, 4:Render Roller]
/* [Parameters] */
$fn = 100;
$RollerCount = 3;
$RollerSegments = 20;
$RollerSections = 30;
$WheelDiameter = 40;
$RollerDiameter = 11;
$RollerLength = 14;
$WheelBaseThickness = 11;
$RollerShaftDiameter = 3;
$ShaftSupportThickness = 1.3;
$ShaftClearance = .7;
$ShaftMountDiameter = 7;
$RollerBearingDiameter = 6.2;
$RollerBearingThickness = 3;
$RollerOffset = 7;
$RollerClearance = 1;
$AxleDiameter = 6;
$JoinHoleSpacing = 5.5;
$JoinHoleDiameter = 2.7;
$JoinHoleHead = 5;
$HoleRotateAdjust = 30;
$ExtraCutoutDepth = 3.4;
$ExtraCutoutLength = 18.5;

$WheelBaseDiameter = $WheelDiameter - 2;
$WheelBaseFormDiameter = $WheelBaseDiameter; 

if ($Action == 1)
  DisplayWheel();
else if ($Action == 2)
  RenderWheelSide();
else if ($Action == 3)
  PrintWheelBase();
else if ($Action == 4)
  Roller();

module PrintWheelBase()
{
    rotate(-90, [0, 1, 0])
      WheelBase();
}
 
module RenderWheelSide()
{
  WheelSet();
  WheelBase();
}

module DisplayWheel()
{
  translate([$RollerOffset, 0, 0])
    RenderWheelSide();
  rotate(180 / $RollerCount, [1, 0, 0])
    rotate(180, [0, 1, 0])
      translate([$RollerOffset, 0, 0])
        RenderWheelSide();
}

module BaseRollerCutoutCube()
{
  rotate(-90, [1, 0, 0])
  {
    intersection()
    {
      translate([-($RollerDiameter + $RollerClearance) / 2, -($RollerLength + $RollerClearance) / 2, -($RollerDiameter + $RollerClearance + $RollerClearance) / 2])
        cube([$RollerDiameter + $RollerClearance , $RollerLength + $RollerClearance, $RollerDiameter + $RollerClearance]);
      translate([-($RollerDiameter + $RollerClearance) / 2, 0, ($WheelDiameter - $RollerDiameter - $RollerClearance) / 2])
        rotate(90, [0, 1, 0])
          cylinder(d = $WheelDiameter + $RollerClearance, h = $RollerDiameter + $RollerClearance);   
    }
  }
  cylinder(d = $RollerShaftDiameter + $ShaftClearance, h = $WheelDiameter, center = true);
  translate([0, 0, (($RollerLength + $RollerClearance) / 2) + $ShaftSupportThickness])
    cylinder(d = $ShaftMountDiameter, h = $WheelDiameter / 4);
  rotate(180, [1, 0, 0])
    translate([0, 0, (($RollerLength + $RollerClearance) / 2) + $ShaftSupportThickness])
      cylinder(d = $ShaftMountDiameter, h = $WheelDiameter / 4);
}

module ExtraCutout()
{
//  translate([-($RollerDiameter + $RollerClearance) / 2, -($RollerLength + $RollerClearance) / 2, -($RollerDiameter + $RollerClearance + $RollerClearance) / 2])
  translate([-$RollerOffset, -$ExtraCutoutDepth, -$ExtraCutoutLength / 2])
      cube([$RollerOffset * 2, $RollerDiameter, $ExtraCutoutLength]);
}

module BaseWheelCutoutCube()
{
  $DoExtraCutout = true;
  for (i = [0 : $RollerCount - 1])
  {
    rotate(360 * i / $RollerCount, [1, 0, 0])
      translate([0, -(-$WheelDiameter + $RollerDiameter) / 2, 0])
        BaseRollerCutoutCube();
    if ($DoExtraCutout == true)
    {
      rotate(360 * (i + 0.5) / $RollerCount, [1, 0, 0])
        translate([0, ($WheelBaseDiameter) / 2, 0])
          ExtraCutout();
    }
  }
}

module BaseWheelCutout()
{
  BaseWheelCutoutCube();
}

$SubstrateSegments = 50;
$SubstrateSections = 20;

module WheelSubstrate()
{
  rotate(90, [0, 1, 0])
  {
  //    cylinder(d = $WheelBaseDiameter, h = $WheelBaseThickness);
    translate([0, 0, -$RollerOffset])
    intersection()
    {
      rotate_extrude($fn = $SubstrateSegments)
      {
        $FrameWidth = $RollerOffset * 2;
        $FrameLength = ($WheelBaseFormDiameter - $FrameWidth) / 2;
        square([$FrameLength, $FrameWidth]);
        translate([$FrameLength, $FrameWidth / 2])
          circle(d = $FrameWidth, $fn = $SubstrateSections);
      }
      translate([-$WheelBaseFormDiameter / 2, -$WheelBaseFormDiameter / 2, 0])
        cube([$WheelBaseFormDiameter, $WheelBaseFormDiameter, $WheelBaseThickness]);
    }
  }
}

module WheelBase()
{
  difference()
  {
    WheelSubstrate();
    BaseWheelCutout();
    rotate(90, [0, 1, 0])
      cylinder(d = $AxleDiameter, h = $WheelBaseThickness * 3, center = true);
    HolePattern();
  }
}

module JoinBoltHole()
{
    rotate(90, [0, 1, 0])
    {
      cylinder(d = $JoinHoleDiameter, h = $WheelBaseThickness * 3, center = true);
      translate([0, 0, $WheelBaseThickness - 3 + 0.01 - $RollerOffset])
        cylinder(d = $JoinHoleHead, h = 3);
    }
}

module HolePattern()
{
  rotate($HoleRotateAdjust, [1, 0, 0])
  {
    translate([0, $JoinHoleSpacing, 0])
      JoinBoltHole();
    translate([0, -$JoinHoleSpacing, 0])
      JoinBoltHole();

    rotate((180 / $RollerCount), [1, 0, 0])
    {
      translate([0, $JoinHoleSpacing, 0])
        JoinBoltHole();
      translate([0, -$JoinHoleSpacing, 0])
        JoinBoltHole();
    }
  }
}

module WheelSet()
{
  for (i = [0 : $RollerCount - 1])
    rotate(360 * i / $RollerCount, [1, 0, 0])
      translate([0, -(-$WheelDiameter + $RollerDiameter) / 2, 0])
        Roller();
}

module Roller()
{
  difference()
  {
    rotate_extrude($fn = $RollerSegments)
    {
      intersection()
      {
        intersection()
        {
          translate([(-$WheelDiameter + $RollerDiameter) / 2, 0, 0])
            circle (d = $WheelDiameter, $fn = $RollerSections);
        }
        translate([0, -$RollerLength / 2, 0])
          square([$RollerDiameter, $RollerLength]);
      }
    }
    cylinder(d = $RollerShaftDiameter, h = $RollerLength + 1, center = true);
    translate([0, 0, ($RollerLength - $RollerBearingThickness + 0.01) / 2])
      cylinder(d = $RollerBearingDiameter, h = $RollerBearingThickness, center = true);
    translate([0, 0, -($RollerLength - $RollerBearingThickness + 0.01) / 2])
      cylinder(d = $RollerBearingDiameter, h = $RollerBearingThickness, center = true);
  }
}
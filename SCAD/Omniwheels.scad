$Action = 0;//[0:Full Wheel, 1:Segment1, 2:Segment 2, 3:Print segment 1 base, 4:Print segment 2 base, 5:Print Roller]
$WheelDiameter = 40;
$RollerDiameter = 10;
$RollerLength = 14;
$WheelBaseThickness = 11;
$WheelClearance = 3.5;
$RollerCount = 4;
$JoinHoleCount = 3;
$JoinOffset = 7;
$DraftAccuracy = 20;
$FinalAccuracy = 100;
$RollerBearingDiameter = 6;
$RollerBearingThickness = 0;
$RollerShaftDiameter = 1.77;
$RollerShaftHeadDiameter = 0.0;
$RollerShaftMountOpening = 1.5;
$RollerOffset = 14;
$RollerHClearance = 0.5;
$RollerVClearance = 0.5;
$RollerZClearance = 0.5;
$ShaftWireD = 2.5;
$HexShaftDiameter = 5.7;
 /* [Hidden] */

$fn = $preview ? $DraftAccuracy : $FinalAccuracy;  
$WheelBaseDiameter = $WheelDiameter - $WheelClearance;

if      ($Action == 0) {Wheel();}
else if ($Action == 1) {WheelSection($Section = 0);}
else if ($Action == 2) {WheelSection($Section = 1);}
else if ($Action == 3) {WheelSection($Section = 0, $ShowRollers = false);}
else if ($Action == 4) {WheelSection($Section = 1, $ShowRollers = false);}
else if ($Action == 5) {Roller();}

 
module Wheel()
{
  WheelSection($Section = 0);
  WheelSection($Section = 1);
}
 
module WheelSection($ShowRollers = true)
{
  if ($Section == 0)
  {
    if ($ShowRollers)
    {
      WheelRollers();
    }
    WheelBase($HeadDiameter = 6, $ScrewDiameter = 2.8);
  }
  else
  {
    mirror([1, 0, 0])
    {
      rotate(180 / $RollerCount, [1, 0,0])
      {
        if ($ShowRollers)
        {
          WheelRollers();
        }
        WheelBase($ShaftRotation = -(180 / $RollerCount), $HeadDiameter = 0, $ScrewDiameter = 2.6);
      }
    }
  }
}

module ShaftAndJoinerHoles($D1 = 2.2, $D2 = 4, $JoinOffsetAngle = 45, $MountRotation = 0)
{
  rotate($MountRotation, [1, 0, 0])
  {
    rotate(90, [0, 1, 0])
    {
      cylinder(d = $HexShaftDiameter, h = 50, $fn = 6, center = true);
      for (i = [0:$JoinHoleCount - 1])
      {
        rotate(((360 / $JoinHoleCount) * i) + $JoinOffsetAngle, [0, 0, 1])
        translate([$JoinOffset, 0, 0])
        {
          //Center hole for screw shaft. Make small for self tap side, larger for head side
          cylinder(d = $D1, h = 50, center = true);
          if ($D2 != 0)
            translate([0, 0, 3])
              cylinder(d = $D2, h = 50);
        }
      }
    }
  }
}

module BaseRollerCutoutCube()
{
  
  rotate(-90, [1, 0, 0])
  {
    //Wheel opening
    intersection()
    {
      translate([-($RollerDiameter + $RollerZClearance) / 2, -($RollerLength + $RollerHClearance) / 2, -($RollerDiameter + $RollerHClearance + $RollerHClearance) / 2])
      {
        cube([$RollerDiameter + $RollerHClearance , $RollerLength + $RollerHClearance, $RollerDiameter + $RollerHClearance]);
      }
      translate([-($RollerDiameter + $RollerZClearance) / 2, 0, ($WheelDiameter - $RollerDiameter - $RollerVClearance) / 2])
        rotate(90, [0, 1, 0])
          cylinder(d = $WheelDiameter + $RollerVClearance, h = $RollerDiameter + $RollerHClearance);
      
    }
    translate([$RollerHClearance / 2, 0, 0])
    {
      //Roller shaft opening
        rotate(90, [1, 0, 0])
          cylinder(d = $RollerShaftMountOpening, h = 120, center = true);
      //Roller shaft screw head 1
      translate([0, -(($RollerLength + $RollerHClearance) / 2) - 1.2, 0])
        rotate(90, [1, 0, 0])
          cylinder(d = $RollerShaftHeadDiameter, h = 20);
      //Roller shaft screw head 2
      mirror([0, 1, 0])
      translate([0, -(($RollerLength + $RollerHClearance) / 2) - 1.2, 0])
        rotate(90, [1, 0, 0])
          cylinder(d = $RollerShaftHeadDiameter, h = 20);
    }
  }
  
  translate([$RollerHClearance / 2, ((-$WheelDiameter + $RollerDiameter) / 2), 0])
    rotate(180 / $RollerCount, [1, 0, 0])
      translate([0, -((-$WheelBaseDiameter) / 2) - .5, 0])
        cylinder(d = $ShaftWireD, h = 3.141 * $WheelBaseDiameter/(5.2 * $RollerCount), center = true);
}

module BaseWheelCutoutCube()
{
  for (i = [0 : $RollerCount - 1])
  {
    rotate(360 * i / $RollerCount, [1, 0, 0])
      translate([($RollerOffset - $RollerHClearance) / 2, -(-$WheelDiameter + $RollerDiameter) / 2, 0])
    {
        BaseRollerCutoutCube();
    }

  }
}

module BaseWheelCutout()
{
  BaseWheelCutoutCube();
}

module WheelBase($ShaftRotation = 0, $HeadDiameter = 6, $ScrewDiameter = 2.6)
{
  difference()
  {
    rotate(90, [0, 1, 0])
//      cylinder(d = $WheelBaseDiameter, h = $RollerDiameter);
      cylinder(d = $WheelBaseDiameter, h = $WheelBaseThickness);
    BaseWheelCutout();
    ShaftAndJoinerHoles($MountRotation = $ShaftRotation, $D1 = $ScrewDiameter, $D2 = $HeadDiameter);
  }
}

module WheelRollers()
{
  translate([$RollerOffset / 2, 0, 0])
    WheelSet();
//  rotate(360 / ($RollerCount * 2), [1, 0, 0])
//    translate([-$RollerOffset / 2, 0, 0])
//      WheelSet();
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
//  //Roller profile accuracy
//  $RollerAccuracy = $preview ? 25 : 100;  
//  //Other circular accuracy
//  $fn = $preview ? 10 : 100;  
  
  difference()
  {
    rotate_extrude(convexity = 10)
    {
      intersection()
      {
        intersection()
        {
          translate([(-$WheelDiameter + $RollerDiameter) / 2, 0, 0])
            circle (d = $WheelDiameter);
        }
        translate([0, -$RollerLength / 2, 0])
          square([$RollerDiameter, $RollerLength]);
      }
    }
    //Shaft opening
    cylinder(d = $RollerShaftDiameter, h = $RollerLength + 1, center = true);
    //Bearing inserts
    if ($RollerBearingDiameter != 0)
    {
      translate([0, 0, ($RollerLength - $RollerBearingThickness + 0.01) / 2])
        cylinder(d = $RollerBearingDiameter, h = $RollerBearingThickness, center = true);
      translate([0, 0, -($RollerLength - $RollerBearingThickness + 0.01) / 2])
        cylinder(d = $RollerBearingDiameter, h = $RollerBearingThickness, center = true);
    }
  }
}
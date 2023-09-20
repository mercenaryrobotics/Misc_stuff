//Diameter of the top 'handle' of the relic
$RelicHandleDiameter = 40;
$RelicHeadDiameter = 65;
$GripperDepth = 30;
$GripperThickness = 15;
$GripperLength = 105;
$PivotSpacing = 30;
$PivotLength = 70;
$M3Tight = 3;
$M3Slack = 3.3;

$ArmDiameter = 12;
$PivotArmThickness = ($GripperThickness / 3) -0.5;

$ServoLength = 40.5;
$ServoWidth = 20;
$ServoDepth = 36.1;
$ServoTabLength = 55.5;
$ServoMountHSpacing = 50.5;
$ServoMountVSpacing = 10;
$ServoMountHoleDiameter = 4.5;
$ServoTabOffset = 26.6;
$ServoShaftOffset = 10.4;
$ServoXOffset = 80;
$ServoYOffset = 15;
$PivotLength1 = 62;
$PivotLength2 = 37;

//Gripper V2 parameters
$PivotLength3 = 24;
$V2PivotXOffset = 23;
$V2PivotYOffset = 25;
$V2LinkageXOffset = 22;
$V2LinkageYOffset = 20;
$ServoRadius = 20;

//$GripperAngle = $t * 120;
$GripperAngle = 0;

module Grip1()
{
  translate([-$RelicHandleDiameter / 2, 0, 0])
    difference()
    {
      cube([$GripperLength, $GripperDepth, $GripperThickness]);
      translate([$RelicHandleDiameter / 2, 0, 0])
      {
        translate([0, 0, -1])
          cylinder(d = $RelicHandleDiameter, h = $GripperThickness + 2);
        translate([50, 0, $GripperThickness / 2])
          sphere(d = $RelicHeadDiameter, $fn = 50);
      }
    }
}

module Grip2()
{
  translate([$GripperDepth, 0, 0])
  rotate(90, [0, 0, 1])
//    translate([-70, -7.5, 0])
      difference()
      {
        union()
        {
          cube([$GripperLength, $GripperDepth, $GripperThickness]);
//          translate([-$HeadHolder, $GripperDepth - 12.68, 0])
//            cube([$HeadHolder, 12.68, $GripperThickness]);
          translate([-$HeadHolder, 0, 0])
            cube([$HeadHolder, $GripperDepth, $GripperThickness]);
        }
        translate([($RelicHandleDiameter / 2) + 5, $GripperDepth, -1])
          cylinder(d = $RelicHandleDiameter, h = $GripperThickness + 2);
//        translate([6.15, -53.15, -1])
//          rotate(50, [0, 0, 1])
//            cube([50, 50, $GripperThickness + 2]);
        //Remove head opening
        translate([25 - 50,$GripperDepth, $GripperThickness / 2])
        sphere(d = $RelicHeadDiameter, $fn = 50);
        if ($DoPivot == 1)
        {
          //Pivot holes
          translate([70, 7.5, -1])
            cylinder(d = 3.3, h = $GripperThickness + 2, $fn = 40);
          translate([70 + $PivotSpacing, 7.5, 0])
            cylinder(d = 3.3, h = $GripperThickness + 2, $fn = 40);
          //Inside pivot opening
          translate([40, -1, $GripperThickness / 3])
            cube([80, 50, $GripperThickness / 3]);
        }
      }
}

module StandardServo()
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
              cylinder(d = $ServoMountHoleDiameter, h = 20, $fn = 40);
            translate([$ServoMountHSpacing / 2, -$ServoMountVSpacing / 2, -9])
              cylinder(d = $ServoMountHoleDiameter, h = 20, $fn = 40);
            translate([-$ServoMountHSpacing / 2, $ServoMountVSpacing / 2, -9])
              cylinder(d = $ServoMountHoleDiameter, h = 20, $fn = 40);
            translate([-$ServoMountHSpacing / 2, -$ServoMountVSpacing / 2, -9])
              cylinder(d = $ServoMountHoleDiameter, h = 20, $fn = 40);
          }
        }
      }
    //Mounting holes. Note, positive so that can be 'diffrenced'
    if ($DoPillars == 1)
    {
      color([0.6, 0.2, 0.2, 0.3])
      {
        translate([$ServoMountHSpacing / 2, $ServoMountVSpacing / 2, -9])
          cylinder(d = $ServoMountHoleDiameter, h = 20, $fn = 40);
        translate([$ServoMountHSpacing / 2, -$ServoMountVSpacing / 2, -9])
          cylinder(d = $ServoMountHoleDiameter, h = 20, $fn = 40);
        translate([-$ServoMountHSpacing / 2, $ServoMountVSpacing / 2, -9])
          cylinder(d = $ServoMountHoleDiameter, h = 20, $fn = 40);
        translate([-$ServoMountHSpacing / 2, -$ServoMountVSpacing / 2, -9])
          cylinder(d = $ServoMountHoleDiameter, h = 20, $fn = 40);
      }
    }
  }
  //Horn shaft
  color([0.6, 0.6, 0.6])
    translate([0, 0, $ServoDepth - $ServoTabOffset - 2.5])
      difference()
      {
        cylinder(d = $ShaftDiameter, h = 8, $fn = 40);
        cylinder(d = $M3Tight, h = 8, $fn = 40);
      }
}

module ServoBase()
{
  //Relic front support
    mirror([1, 0, 0])
      Grip1($DoPivot = 0, $GripperThickness = 30, $GripperLength = 70, $GripperDepth = 35);

    difference()
    {
      union()
      {
        translate([100, 15, 0])
          cylinder(d = 15, h = 15, $fn = 20);
        translate([$RelicHandleDiameter / 2, 0, 0])
          cube([90, 80, 7]);
        translate([$RelicHandleDiameter / 2, 0, 0])
          cube([35, 150, 7]);
      }
      translate([80, 30, 0])
        rotate(-90, [0, 0, 1])
          StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 5);
      translate([100, 15, 0])
        cylinder(d = 3.2, h = 20, $fn = 20);
    }    
  }

module PivotArm()
{
  difference()
  {
    linear_extrude(height = $PivotArmThickness)
    difference()
    {
      hull()
      {
        circle(d = $ArmDiameter, $fn = 40);
        translate([$PivotLength, 0, 0])
          circle(d = $ArmDiameter, $fn = 40);
      }

      circle(d = $M3Slack, $fn = 40);

      translate([$PivotLength, 0, 0])
        circle(d = $M3Slack, $fn = 40);
      
    }
    if ($Pocket == 1)
    {
        cylinder(d = $M3Slack + 3, h = 2, $fn = 20);
      translate([$PivotLength, 0, $PivotArmThickness - 2])
        cylinder(d = $M3Slack + 3, h = 2, $fn = 20);
    }
  }
}

module Grip2()
{
  translate([30, -6, 0])
  {
    Grip1($DoPivot = $DoPivot, $GripperThickness = $GripperThickness, $GripperLength = $GripperLength, $GripperDepth = $GripperDepth);
    difference()
    {
      translate([-($RelicHandleDiameter / 2) - $CouplerLength, 0, 0])
      {
        difference()
        {
          cube([$CouplerLength, $GripperDepth, $GripperThickness]);
          translate([0, 0, $GripperThickness / 3])
            cube([$CouplerLength, $GripperDepth, $GripperThickness / 3]);
        }
      }
      translate([-30, 6, -1])
        cylinder(d = $M3Tight, h = $GripperThickness + 2, $fn = 20);
      translate([-70, 6, -1])
        cylinder(d = $M3Tight, h = $GripperThickness + 2, $fn = 20);
      translate([-$CouplerLength - ($RelicHandleDiameter / 2), 10, -1])
        rotate(20, [0, 0, 1])
          cube([70, 50, $GripperThickness + 2]);
    }
  }
}

module DisplayFullGripperV1()
{
  translate([-80, -30, 0])
    ServoBase();

    rotate(-90, [0, 0, 1])
      StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 5);
  
  translate([0, 0, 15])
    rotate($GripperAngle, [0, 0, 1])
      PivotArm($PivotLength = $PivotLength1, $Pocket = 0);

  translate([20,-15, 15])
    rotate($GripperAngle, [0, 0, 1])
      PivotArm($PivotLength = $PivotLength2, $Pocket = 0);

  translate([cos($GripperAngle) * $PivotLength1, sin($GripperAngle) * $PivotLength1, 10])
    rotate(180, [0, 0, 1])
      Grip2($DoPivot = 1, $GripperThickness = 15, $GripperLength = 40, $GripperDepth = 30, $CouplerLength = 55);
}

module PrintFullGripperV1()
{
  ServoBase();
  rotate(90, [0, 0, 1])
    translate([90, -15, 24])
      rotate(-90, [1, 0, 0])
        Grip2($DoPivot = 1, $GripperThickness = 15, $GripperLength = 40, $GripperDepth = 30, $CouplerLength = 55);
  rotate(90, [0, 0, 1])
    translate([50, 20, 0])
      PivotArm($PivotLength = $PivotLength1, $Pocket = 0);
  rotate(90, [0, 0, 1])
    translate([50, 40, 0])
      PivotArm($PivotLength = $PivotLength2, $Pocket = 0);
}

module GripV2()
{
  mirror([1, 0, 0])
  {
    difference()
    {
      linear_extrude(height = $GripperThickness)
      difference()
      {
        polygon(points=[[10, 0],[10, -10],[0, -20],[0, -60], [10, -70], [10, -80], [-12.5, -90], [-12.5, -120], [-35, -120], [-35, 28], [-20, 27]]);
        circle(d = $M3Slack, $fn = 20);
        translate([-$V2LinkageXOffset, $V2LinkageYOffset])
          circle(d = $M3Slack, $fn = 20);
      }
      translate([-$V2LinkageXOffset, $V2LinkageYOffset])
        cylinder(d = $M3Slack + 3, h = 2, $fn = 20);
      if ($Clip == 1)
      {
        translate([-35, -125, 0])
        cube([50, 50, $GripperThickness]);
      }
    }
  }
}

module ServoConnector1()
{
  difference()
  {
    cylinder(r = $ServoRadius + 5, h = 2);
    cylinder(d = $M3Slack, h = 4, $fn = 20);
    translate([$ServoRadius, 0, -1])
      cylinder(d = $M3Slack, h = 4, $fn = 20);
    translate([-$ServoRadius, 0, -1])
      cylinder(d = $M3Slack, h = 4, $fn = 20);
  }
}

module ServoConnector()
{
  difference()
  {
    union()
    {
    translate([-$ServoRadius, 0, 0])
      PivotArm($PivotLength = $ServoRadius * 2, $ArmDiameter = 15, $PivotArmThickness = 4);
    translate([0, 0, -$PivotArmThickness - 4])
      cylinder(d = 6, h = $PivotArmThickness + 4, $fn = 20);
    }
    translate([0, 0, -14])
      cylinder(d = 5, h = $PivotArmThickness + 16, $fn = 20);
  }
}

module ServoBaseV2()
{
  difference()
  {
    translate([-28, -30, -7])
      cube([56, 70, 6]);
    translate([-$V2PivotXOffset, -$V2PivotYOffset, -8])
      cylinder(d = $M3Slack, h = 20, $fn = 20);
    translate([$V2PivotXOffset, -$V2PivotYOffset, -8])
      cylinder(d = $M3Slack, h = 20, $fn = 20);
    translate([0, 0, -7])
      rotate(-90, [0, 0, 1])
        StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 5);
  }
  translate([28, -10, -7])
    cube([100, 50, 6]);
}

//Calculate the opposite angle given adjacent &2 and opposite lengths
function GetAngle(A1, A2, Op) = acos(((A1 * A1) + (A2 * A2) - (Op * Op))/(2 * A1 * A2));

module DisplayFullGripperV2()
{
  $LinkX = cos($GripperAngle) * $ServoRadius;
  $LinkY = sin($GripperAngle) * $ServoRadius;
  $LinkX2 = cos($GripperAngle + 180) * $ServoRadius;
  $LinkY2 = sin($GripperAngle + 180) * $ServoRadius;
  $T1X   = ($V2PivotXOffset - $LinkX);
  $T1Y   = ($V2PivotYOffset + $LinkY);
  $T1X2   = ($V2PivotXOffset + $LinkX2);
  $T1Y2   = ($V2PivotYOffset + $LinkY2);
  $T1H   = sqrt(($T1X * $T1X) + ($T1Y * $T1Y));
  $T1H2   = sqrt(($T1X2 * $T1X2) + ($T1Y2 * $T1Y2));
  $T2L1  = sqrt(($V2LinkageXOffset * $V2LinkageXOffset) + ($V2LinkageYOffset * $V2LinkageYOffset));
  $T2L2  = $PivotLength3;
  $T2L3  = $T1H;
  
  $GripPivotDelta  = sqrt(($V2PivotXOffset * $V2PivotXOffset) + ($V2PivotYOffset * $V2PivotYOffset));
  $AngleA = GetAngle($T2L2, $T2L3, $T2L1);
  $AngleAp = acos($T1Y/$T1H);
  $AngleC = GetAngle($T2L1, $T2L3, $T2L2);
  $AngleCp = 90 - $AngleAp;
  
  $A1 = GetAngle($GripPivotDelta, $V2PivotXOffset, $V2PivotYOffset);
  $A2 = GetAngle($GripPivotDelta, $T1H2, $ServoRadius);
  $A3 = GetAngle($T2L1, $T1H2, $PivotLength3);
  $Beta = 180 - $A1 - $A2 - $A3;
  $A4 = GetAngle($PivotLength3, $T2L1, $T1H2);
  
  $T1UpperA = GetAngle($T1H, $ServoRadius, $GripPivotDelta);
  $T2UpperA = GetAngle($PivotLength3, $T1H, $T2L1);
  
  $PivotAngle = -(180 - $GripperAngle - $T1UpperA - $T2UpperA);
  $PivotAngle2 = 180 + ($A4 - $Beta);
  
  $GripOffsetAngle = atan($V2LinkageXOffset / $V2LinkageYOffset);
  $GripAngle = 90 - $AngleC - $AngleCp + $GripOffsetAngle;
  $GripAngle2 = $Beta - $GripOffsetAngle;
  
  ServoBaseV2();
  
  translate([0, 0, 9])
    rotate($GripperAngle, [0, 0, 1])
      ServoConnector();
  
  translate([$LinkX, $LinkY, 5])
    rotate($PivotAngle, [0, 0, 1])
      PivotArm($PivotLength = $PivotLength3, $PivotArmThickness = 4, $Pocket = 1);

  translate([$LinkX2, $LinkY2, 5])
    rotate($PivotAngle2, [0, 0, 1])
      PivotArm($PivotLength = $PivotLength3, $PivotArmThickness = 4, $Pocket = 1);

  translate([$V2PivotXOffset, -$V2PivotYOffset, 0])
    rotate($GripAngle, [0, 0, 1])
      GripV2($GripperThickness = 5);
  
  translate([-$V2PivotXOffset, -$V2PivotYOffset, 0])
    rotate(-$GripAngle2 - 5.5, [0, 0, 1])
      mirror([1, 0, 0])
        GripV2($GripperThickness = 5, $Clip = 1);
        
  translate([0, 0, -8])
    rotate(-90, [0, 0, 1])
      StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 5);
}

module PrintFullGripperV2()
{
  translate([0, 0, 7])
    ServoBaseV2();

  translate([50, -25, 5])
    rotate(180, [1, 0, 0])
      rotate(90, [0, 0, 1])
        GripV2($GripperThickness = 5, $Clip = 1);

  translate([95, -100, 5])
    rotate(180, [1, 0, 0])
      rotate(-90, [0, 0, 1])
        GripV2($GripperThickness = 5, $Clip = 0);

  translate([-15, -40, 0])
    PivotArm($PivotLength = $PivotLength3, $PivotArmThickness = 4, $Pocket = 1);

  translate([-15, -55, 0])
    PivotArm($PivotLength = $PivotLength3, $PivotArmThickness = 4, $Pocket = 1);

  translate([55, -115, 4])
    rotate(180, [1, 0, 0])
      ServoConnector();

}

//DisplayFullGripperV1();
//PrintFullGripperV1();
//DisplayFullGripperV2();
//PrintFullGripperV2();



      StandardServo($DoPillars = 0, $Gap = 0, $ShaftDiameter = 4, $ServoDepth = 9.5, $ServoTabOffset = 0, $M3Tight = 2.0);

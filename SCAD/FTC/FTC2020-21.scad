use <involute_gears.scad>
use <D:\3D Printer & Laser Cutter\3D models\Robotics\Library\Sprockets.scad>
//"Include" so that variables are imported too
include  <D:\3D Printer & Laser Cutter\3D models\Robotics\Library\RobotPrimitives.scad>

//Diameter of the top 'handle' of the relic
/* [Hidden] */
$RelicHandleDiameter = 40;
$RelicHeadDiameter = 65;
$GripperDepth = 30;
$GripperThickness = 15;
$GripperLength = 105;
$PivotSpacing = 30;
$PivotLength = 70;

$ArmDiameter = 12;
$PivotArmThickness = ($GripperThickness / 3) -0.5;

//Gripper V2 parameters
$PivotLength3 = 24;
$V2PivotXOffset = 21;
$V2PivotYOffset = 25;
$V2LinkageXOffset = 23;
$V2LinkageYOffset = 20;
$ServoRadius = 20;

$GripperAngle = $t * 120;
//$GripperAngle = 0;

//Ring launcher parameters
$SliderClearance = 1.3;
//$SpinnerD = 47;
$SpinnerD = 70;
$SpinnerHeight = 20;
$SpinnerPlateClearance = 4.5 + 2;
$ArcThickness = 2;
$ArcHeight = 23 + $SliderClearance + $SliderClearance + $ArcThickness + $ArcThickness;
$ExpansionGap = 10;
$ArcSupportClearance = 35;
$ArcMotorClearanceUpper = 65;
$ArcMotorClearanceLower = 80;
$TensionChannelSpacing = 50;
$TensionChannelWidth = 10;
$TensionChannelLength = 20;
$TensionChannelGuideLength = 40;
$TensionChannelOffset = 70;
$BearingSupportAdder = 10;
$SpinnersGap = 20;
$SpinnerSpacing = $SpinnerD + $SpinnersGap;
$YLaunchLength = $SpinnersGap + $SpinnerD + ($SpinnerD / 2) -10;
$XIntakeWidth = 35;
$InnerArcD = ((125 + ($SpinnerD / 2)) * 2);
$OuterArcD = $InnerArcD + $ArcThickness + $ArcThickness;

$TetrixShaftHoleDiameter = 8;
$TetrixMountHoleDiameter = 3.7;
$Height = 5;
$TetrixShaftHoleSpacing = 16;
$TetrixAdjust = 0.2;

function bit_set(b, n) = floor(n / pow(2, b)) % 2;
function and(a,b) = (a<1 || b<1) ? 0 : ((a%2>=1) && (b%2>=1) ? 1 : 0) + 2*and(a/2, b/2);

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
        circle(d = $Hole, $fn = 40);
      
    }
    if ($Pocket == 1)
    {
        cylinder(d = $Hole + 4, h = 2, $fn = 20);
      translate([$PivotLength, 0, $PivotArmThickness - 2.5])
        cylinder(d = $Hole + 4, h = 5, $fn = 20);
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
      PivotArm($PivotLength = $PivotLength1, $Pocket = 0, $Hole = $M3Slack);

  translate([20,-15, 15])
    rotate($GripperAngle, [0, 0, 1])
      PivotArm($PivotLength = $PivotLength2, $Pocket = 0, $Hole = $M3Slack);

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
      PivotArm($PivotLength = $PivotLength1, $Pocket = 0, $Hole = $M3Slack);
  rotate(90, [0, 0, 1])
    translate([50, 40, 0])
      PivotArm($PivotLength = $PivotLength2, $Pocket = 0, $Hole = $M3Slack);
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
        polygon(points=[[5, 3],[5, -10],[0, -20],[0, -60], [15, -70], [-12.5, -90], [-12.5, -120], [-25, -120], [-30, 27], [-20, 27], [-10, 10]]);
        circle(d = $M3Slack, $fn = 20);
        translate([-$V2LinkageXOffset, $V2LinkageYOffset])
          circle(d = $M3Slack, $fn = 20);
      }
      translate([-$V2LinkageXOffset, $V2LinkageYOffset])
        cylinder(d = $M3Slack + 4, h = 2.5, $fn = 20);
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
      PivotArm($PivotLength = $ServoRadius * 2, $ArmDiameter = 15, $PivotArmThickness = 4, $Hole = $M3Tight);
    translate([0, 0, -$PivotArmThickness - 5.5])
      cylinder(d = 10, h = 10, $fn = 40);
    }
    translate([0, 0, -14])
      cylinder(d = 3.1, h = $PivotArmThickness + 16, $fn = 20);
    translate([0, 0, -10])
      cylinder(d1 = 5.8, d2 = 5.65, h = 3.2, $fn = 24);
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
      PivotArm($PivotLength = $PivotLength3, $PivotArmThickness = 4, $Pocket = 1, $Hole = $M3Slack);

  translate([$LinkX2, $LinkY2, 5])
    rotate($PivotAngle2, [0, 0, 1])
      PivotArm($PivotLength = $PivotLength3, $PivotArmThickness = 4, $Pocket = 1, $Hole = $M3Slack);

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

  translate([60, -45, 5])
    mirror([0, 1, 0])
      rotate(180, [1, 0, 0])
        rotate(90, [0, 0, 1])
          GripV2($GripperThickness = 5, $Clip = 1);

  translate([95, -90, 5])
    rotate(180, [1, 0, 0])
      rotate(-90, [0, 0, 1])
        GripV2($GripperThickness = 5, $Clip = 0);

  translate([-15, -40, 0])
    PivotArm($PivotLength = $PivotLength3, $PivotArmThickness = 4, $Pocket = 1, $Hole = $M3Slack);

  translate([-15, -55, 0])
    PivotArm($PivotLength = $PivotLength3, $PivotArmThickness = 4, $Pocket = 1, $Hole = $M3Slack);

  translate([60, -105, 4])
    rotate(180, [1, 0, 0])
      ServoConnector();

}

module Ring()
{
  color("Orange")
    difference()
    {
      cylinder(d = 125, h = 20, $fn = 50, center = false);
      translate([0, 0, -0.1])
        cylinder(d = 75, h = 20.2, $fn = 50, center = false);
    }
}

module LauncherWheel($Weights = 2, $XStipple = 0, $YStipple = 0, $Rim = 2)
{
  difference()
  {
    cylinder(d = $SpinnerD, h = $SpinnerHeight);
    cylinder(d = $RevHDShaftD + .25, h = $SpinnerHeight + .01, $fn = 6);
    if ($Weights != 0)
    {
      for ($i = [0:$Weights - 1])
      {
        rotate((360 / $Weights) * $i, [0, 0, 1])
        translate([0, 18, 3])
          cylinder(d = 19.45, h = $SpinnerHeight, $fn = 50);
      }
    }
  }
    if ($XStipple != 0)
    {
      $Rotation = 360 / $XStipple;
      $YStippleSpacing = ($SpinnerHeight - ($Rim * 2)) / ($YStipple - 1);
      for ($j = [0:$YStipple - 1])
      {
        for ($i = [0:$XStipple - 1])
        {
          rotate($Rotation * $i, [0, 0, 1])
            translate([0, ($SpinnerD / 2) - 0.35, ($j * $YStippleSpacing) + $Rim])
              rotate(35, [1, 0, 0])
              rotate(45, [0, 0, 1])
              cube([1.2, 1.2, 1.2], center = true);
        }
      }
    }
}


module LauncherUpperBearingSupport()
{
  $ClearanceHeight = $SpinnerHeight + $ArcThickness + $ArcThickness + 3;
  difference()
  {
    //Main body
    translate([-($SpinnerD - 10) / 2, -15, 0])
      cube([$SpinnerD - 10, ($SpinnerD / 2) + 15 + $BearingSupportAdder, 35]);
    //Spinner wheel clearance
    cylinder(d = $SpinnerD + 8, h = $ClearanceHeight, $fn = 30);
    //Frisbee opening
    translate([-20, -50, 0])
      cube([40, 50, $ClearanceHeight]);
    //Bearing
    translate([0, 0, 35 - $Bearing606Height])
      Bearing606();
    //Bearing lip
      cylinder(d = $Bearing606Diameter - 1.2, h = 40, $fn = 50);
    //Plate bolt holes
    translate([($SpinnerD / 2) - 13, ($SpinnerD / 2) + 2, 0])
      cylinder(d = 3, h = 40, $fn = 20);
    translate([-(($SpinnerD / 2) - 13), ($SpinnerD / 2) + 2, 0])
      cylinder(d = 3, h = 40, $fn = 20);
  }
}

module LauncherSpinnerPair($WC = 0, $XS = 0, $YS = 0, $R = 0)
{
  //Launcher wheel 1
  LauncherWheel($Weights = $WC, $XStipple = $XS, $YStipple = $YS, $Rim = $R);
  //Launcher wheel 2
  translate([0, $SpinnerSpacing, 0])
    LauncherWheel($Weights = $WC, $XStipple = $XS, $YStipple = $YS, $Rim = $R);
}

module RingLauncherV2()
{
  
  translate([-(125 + $SpinnerD) / 2, 0, 0])
    Ring();

  translate([0, 0, 4.5])
    LauncherSpinnerPair();
  
  //Double bearing support
  DoubleBearingSupport();
  
  //Lower plate
  translate([0, 0, -$ArcThickness])
  {
    LowerPlate();
  }
  LauncherOuterCap();
  LauncherInnerCap();
  
  //RPM sensor set
  translate([61, 0, 5])
    rotate(90, [0, 0, 1])
      FTCDualOpticalHolder();

}

module LowerPlate()
{
  difference()
  {
    LowerPlateFrame();
    RevHDHoleSet();
    translate([0, $SpinnersGap + $SpinnerD, 0])
      RevHDHoleSet();
    SpinnersMountHoles();
  }
}

module LowerPlateFrame()
{
    //Arc
    difference()
    {
      intersection()
      {
        cylinder(d = $OuterArcD, h = $SpinnerHeight + 4, $fn = 40);
        translate([-200, -200, 0])
          cube([200, 200, 40]);
      }
      translate([0, 0, $ArcThickness])
        cylinder(d = $InnerArcD, h = $SpinnerHeight + 4, $fn = 40);
    }
    //Intake channel
    translate([0, -($OuterArcD / 2), 0])
      difference()
      {
        cube([$XIntakeWidth, ($OuterArcD / 2) + $YLaunchLength, $SpinnerHeight + 4]);
        translate([-1, $ArcThickness , $ArcThickness])
          cube([$XIntakeWidth + 2, ($OuterArcD / 2) + $SpinnersGap + $SpinnerD + ($SpinnerD / 2) + 20, $SpinnerHeight + 4]);
      }
    //Launch channel
    translate([-$OuterArcD / 2, 0, 0])
    {
      difference()
      {
        cube([$OuterArcD / 2, $YLaunchLength, $SpinnerHeight + 4]);
        translate([$ArcThickness, -1, $ArcThickness])
          cube([$OuterArcD / 2, $YLaunchLength + 2, $SpinnerHeight + 4]);
        //Exit clearance
        translate([-3, $SpinnerSpacing + 10, $ArcThickness])
          cube([10, 100, $SpinnerHeight + 4]);
      }
    }
    
}

module SpinnerSupportFrame()
{
  translate([0, (-($SpinnerD + $SpinnersGap) / 2), 0])
    intersection()
    {
      //Main support
      translate([-($SpinnerD - 20) / 2, -($SpinnerD - $SpinnersGap) / 2, 0] )
        cube([$SpinnerD - 20, ($SpinnerD * 2), 35]);
      translate([0, $SpinnerSpacing / 2, 0])
        scale([0.75, 2.0, 1.0])
          cylinder(d = $SpinnerD, h = $SpinnerHeight + 20, $fn = 100);
    }
}
module DoubleBearingSupport()
{
    difference()
    {
      translate([0, (($SpinnerD + $SpinnersGap) / 2), 0])
      SpinnerSupportFrame();
      //Spinner clearance
      LauncherSpinnerPair($SpinnerD = $SpinnerD + 12, $SpinnerHeight = $SpinnerHeight + $SpinnerPlateClearance);
      //Bearing mounts
      translate([0, 0, 35 - $Bearing606Height])
      {
        Bearing606();
        translate([0, $SpinnerSpacing, 0])
          Bearing606();
      }
      //Bearing mounts, shaft opening/lip
        cylinder(d = $Bearing606Diameter - 2, h = 36);
        translate([0, $SpinnerSpacing, 0])
          cylinder(d = $Bearing606Diameter - 2, h = 36);
      //Mount holes
      SpinnersMountHoles();
    }
}

module SpinnersMountHoles()
{
  $fn = 20;
  translate([0, 0, 0])
  {
    translate([20, $SpinnerSpacing / 2, 0])
      cylinder(d = 3, h = 36);
    translate([0, $SpinnerSpacing / 2, 0])
      cylinder(d = 3, h = 36);
    translate([-20, $SpinnerSpacing / 2, 0])
      cylinder(d = 3, h = 36);
  }
}

module RingLauncherV1()
{
  //Launcher wheel
  translate([0, 0, $ArcThickness + $ArcThickness + $ArcThickness + $SliderClearance + 1])
    LauncherWheel();
  
  //Upper bearing support
  translate([0, 0, $ArcThickness + $ArcThickness])
  LauncherUpperBearingSupport();

  color("LightGray")
  {
    OuterCompressor();
  mirror([1, 0, 0])
      OuterCompressor();
  }
  color("DarkGray")
    CompressorFrame();
  
  CompressorUpperPlate();
  mirror([1, 0, 0])
    CompressorUpperPlate();
  
  translate([(125 + $SpinnerD) / 2, 0, $ArcThickness * 4])
    Ring();
}

module CompressorFrame()
{
  $FrameDiameter = (125 + ($SpinnerD / 2) - $ArcSupportClearance) * 2;
  difference()
  {
    translate([0, 0, $ArcThickness])
      union()
      {
        cylinder(d = $FrameDiameter , h = $ArcThickness, $fn = 50);
        translate([-$FrameDiameter / 2, 0, 0])
          cube([$FrameDiameter, ($SpinnerD /2) + $BearingSupportAdder, $ArcThickness]);
      }
    //Motor mount/opening holes
    RevHDHoleSet();
    //Tensioner channels
    $SlotHeight = 20;
    rotate(-45, [0, 0, 1])
      TensionChannelSlotSet();
    rotate(-45 - 90, [0, 0, 1])
      TensionChannelSlotSet();
    //Plate bolt holes
    translate([($SpinnerD / 2) - 13, ($SpinnerD / 2) + 2, 0])
      cylinder(d = 3, h = 40, $fn = 20);
    translate([-(($SpinnerD / 2) - 13), ($SpinnerD / 2) + 2, 0])
      cylinder(d = 3, h = 40, $fn = 20);
    
    //Remove excess material
    translate([-150, ($SpinnerD /2) + $BearingSupportAdder, -1])
      cube([300, 200, 10]);
  }
}

module CompressorUpperPlate()
{

  $TensionChannelWidth = 9;
  $TensionChannelLength = 0;
  $TensionChannelGuideLength = 20;
  $TensionChannelGuideOffset = 20;
  $TensionChannelOffset = 80;
  $SlotHeight = $ArcThickness + $SliderClearance;

  difference()
  {
    union()
    {
      //Channel guides
      translate([0, 0, (($ArcThickness + $SliderClearance)/ 2) + $ArcThickness])
      {
        rotate(-45 - 90, [0, 0, 1])
          TensionChannelSlotSet();
      }
      //Support plate
      translate([0, 0, $ArcThickness + $ArcThickness + $SliderClearance])
        CircleQuadrant($Inner = $ArcMotorClearanceUpper, $Outer = (125 + ($SpinnerD / 2) - $ArcSupportClearance) * 2, $Height = $ArcThickness, $fn = 40);
    }
    //Sandwich screw holes
    translate([0, 0, (($ArcThickness + $SliderClearance)/ 2) + $ArcThickness])
      rotate(-45 - 90, [0, 0, 1])
        TensionChannelHoleSet($SlotHeight = 20, $Width = 3);
    //Sandwich screw head holes
    translate([0, 0, (1 + 1.751 + ($ArcThickness / 2) + $ArcThickness)])
      rotate(-45 - 90, [0, 0, 1])
        TensionChannelHoleSet($SlotHeight = 2.5, $Width = 5.5);
    //Expansion gap
    rotate(180, [0, 0, 1])
      cube([$ExpansionGap / 2, 150, 10]);
  }
}

module CircleQuadrant()
{
  rotate(-180, [0, 0, 1])
  intersection()
  {
    difference()
    {
      cylinder(d = $Outer, h = $Height);
      cylinder(d = $Inner, h = $Height);
    }
    cube([$Outer, $Outer, $Height]);
  }
}

module TensionChannelSlotSet()
{
  translate([$TensionChannelOffset + (($TensionChannelLength - $TensionChannelGuideLength) / 2), 0, 0])
    Slot($Width = $TensionChannelWidth, $Length = $TensionChannelGuideLength, $Height = $SlotHeight);
  translate([$TensionChannelOffset, $TensionChannelSpacing / 2, 0])
    Slot($Width = $TensionChannelWidth, $Length = $TensionChannelLength, $Height = $SlotHeight);
  translate([$TensionChannelOffset, -$TensionChannelSpacing / 2, 0])
    Slot($Width = $TensionChannelWidth, $Length = $TensionChannelLength, $Height = $SlotHeight);
}

module TensionChannelHoleSet()
{
  translate([$TensionChannelOffset + (($TensionChannelLength - $TensionChannelGuideLength) / 2), 0, 0])
    ChannelHoles($Length = $TensionChannelGuideLength, $Height = $SlotHeight);
  translate([$TensionChannelOffset, $TensionChannelSpacing / 2, 0])
    ChannelHoles($Length = $TensionChannelLength, $Height = $SlotHeight);
  translate([$TensionChannelOffset, -$TensionChannelSpacing / 2, 0])
    ChannelHoles($Length = $TensionChannelLength, $Height = $SlotHeight);
}

module ChannelHoles()
{
    cylinder(d = $Width, h = $Height, $fn = 30, center = true);
    translate([$Length, 0, 0])
      cylinder(d = $Width, h = $Height, $fn = 30, center = true);
}

module OuterCompressor()
{
  //Throw arc
  intersection()
  {
    difference()
    {
      //Base arc outline
      cylinder(r = (125 + ($SpinnerD / 2)) + $ArcThickness, h = $ArcHeight, $fn = 50);
      //Base arc travel
      translate([0, 0, $ArcThickness])
        cylinder(r = (125 + ($SpinnerD / 2)) , h = $ArcHeight, $fn = 50);
      //Base arc tension clearing
      translate([0, 0, -0.1])
        cylinder(d = $ArcMotorClearanceLower , h = $ArcHeight, $fn = 50);
      //Expansion gap
      translate([-$ExpansionGap / 2, -160, -0.1])
        cube([$ExpansionGap, 130, 50]);
      
      //Tensioner mount holes
      $TensionChannelWidth = 8;
      $TensionChannelLength = 0;
      $TensionChannelGuideLength = 20;
      $TensionChannelGuideOffset = 20;
      $TensionChannelOffset = 80;
      $SlotHeight = 10;
      $Width = 2;
      
      rotate(-45 - 90, [0, 0, 1])
        TensionChannelHoleSet();
        
      //Mounting clearance opening
      translate([-20, -110, -5])
        cube([20, 110, 30]);
    }
    rotate(180, [0, 0, 1])
      cube([200, 200, 100]);
  }
}

module HexShaftBearingShims()
{
  for ( x = [0 : 3])
    for ( y = [0 : 3])
      translate([x * 10, y * 10, 0])
        HexShaftBearingShim();
}

module HexShaftBearingShimSpacers()
{
  for ( x = [0 : 3])
    for ( y = [0 : 3])
      translate([x * 20, y * 20, 0])
        HexShaftBearingShimSpacer();
}

module LauncherOuterCap()
{
  $GuideWidth = 35;
  
  //Quadrant
  $OuterD = ((125 + ($SpinnerD / 2)) * 2) + ($ArcThickness * 5);
  {
    //Lip
  translate([0, 0, $SpinnerHeight + ($ArcThickness * 1.5)])
    CircleQuadrant($Outer = $OuterD, $Inner = $OuterD - $GuideWidth, $Height = $ArcThickness, $fn = 50);
    //Groove
    difference()
    {
      CircleQuadrant($Outer = $OuterD, $Inner = $OuterD - ($ArcThickness * 8), $Height = 25, $fn = 50);
      CircleQuadrant($Outer = $OuterD - ($ArcThickness * 2), $Inner = $OuterD - ($ArcThickness * 5.5), $Height = 25, $fn = 50);
    }
  }
  //Feed lip
  translate([0, -($OuterD / 2) + ($ArcThickness * .162), 0])
  {
    difference()
    {
      //Main block
      cube([$XIntakeWidth, $GuideWidth / 2, $SpinnerHeight + ($ArcThickness * 2.5)]);
      //Mount groove
      translate([0, ($ArcThickness * 1), 0])
        cube([$XIntakeWidth, ($ArcThickness * 1.75), $SpinnerHeight + ($ArcThickness * 1.5)]);
      //Channel
      translate([0, ($ArcThickness * 4.0), 0])
        cube([$XIntakeWidth, $GuideWidth, $SpinnerHeight + ($ArcThickness * 1.5)]);
    }
  }
  //Exit lip
  translate([-($OuterD / 2), 0, 0])
  {
    difference()
    {
      cube([$GuideWidth / 2, $YLaunchLength - 15, $SpinnerHeight + ($ArcThickness * 2.5)]);
      //Mount groove
      translate([($ArcThickness * 1), 0, 0])
        cube([($ArcThickness * 1.75), $YLaunchLength, $SpinnerHeight + ($ArcThickness * 1.5)]);
      //Channel
      translate([($ArcThickness * 4.0), 0, 0])
        cube([$XIntakeWidth, $YLaunchLength, $SpinnerHeight + ($ArcThickness * 1.5)]);
    }
  }
}

module LauncherInnerCap()
{
  $Overlap = 15;
  translate([0, 0, $SpinnerHeight + ($ArcThickness * 3.0)])
  {
    difference()
    {
      union()
      {
        hull()
        {
          cylinder(d = $SpinnerD + $Overlap, h = $ArcThickness, $fn = 50);
          translate([0, $SpinnerSpacing, $ArcThickness / 2])
            cube([$SpinnerD + $Overlap, $SpinnerD - 20, $ArcThickness], center = true);
        }
        translate([0, (($SpinnerD + $SpinnersGap) / 2), 0])
          intersection()
          {
            scale([1.04, 1.04, 1.0])
              SpinnerSupportFrame();
            cube([100, 200, 22], center = true);
          }
      }
      translate([0, (($SpinnerD + $SpinnersGap) / 2), 0])
        intersection()
        {
          scale([1.02, 1.02, 1.0])
            SpinnerSupportFrame();
          cube([100, 200, 20], center = true);
        }
      cylinder(d = 30, h = 40, center = true);
      translate([0, $SpinnerD + $SpinnersGap, 0])
        cylinder(d = 30, h = 40, center = true);
      SpinnersMountHoles();
    }
  }
}

module FTCDualOpticalHolder()
{
  OpticalHolder();
  translate([38 + 38 + 15, 0, 18])
    rotate(180, [0, 1, 0])
      OpticalHolder();
  difference()
  {
    translate([38, 0, 0])
      cube([15, 20, 18]);
    translate([45, 25, 10])
      rotate(90, [1, 0, 0])
      {
        translate([0, 0, 10])
          cylinder(d = 10, h = 30, $fn = 40);
        cylinder(d = 3, h = 30, $fn = 40);
      }
  }
  translate([18, 13, 18])
    difference()
    {
      cube([55, 10, 8]);
      translate([0, 5, 2.5])
        cube([55, 10, 3]);
    }
}

module RingFeeder()
{
  difference()
  {
    union()
    {
      Washer($Outer = 140, $Inner = 135, $Thickness = 60, $fn = 80);
      translate([-30, -70, -$ArcThickness])
        cube([30 + 70 + 20, 140, $ArcThickness]);
    }
    translate([-135, -135 / 2, 0])
      cube([135, 135, 30]);
    translate([70, -30, 0])
    {
      cylinder(d = 90, h = 15);
      rotate(7, [0, 0, 1])
        HexMotorMountHoles();
    }
  }
}

module FeederArm($Style = 0)
{
  $ArmThickness = 10;
  $ArmWidth = 7.5;
  $ArmLength = 51;
  $ArmCenterHeight = 3 + ($ArmThickness / 2);
  $BearingSlot = 10;
  $ClipLength = 0.8;
  
  difference()
  {
    union()
    {
      //Main stem
      cylinder(d = 13, h = $ArmThickness + 3, $fn = 50);
      //Main arm
      translate([-$ArmWidth/2, 0, 3])
        cube([$ArmWidth, $ArmLength, $ArmThickness]);
    }
    if ($Style == 0)//Hex motor mount
    {
      //Hex shaft
      rotate(180 / 6, [0, 0, 1])
        cylinder(d = $RevHDShaftD + .15, h = $SpinnerHeight + .01, $fn = 6);
      //Mount screws clearance
      Washer($Outer = 25, $Inner = 9, $Thickness = 4, $fn = 30);
    }
    else
    {
      //Chop off bottom of stem
      cylinder(d = 30, h = 3);
      translate([0, 0, 3])
      {
        //Shaft mount
#        cylinder(d1 = 5.9, d2 = 5.6, h = 3, $fn = 50);
        //Screw hole
        cylinder(d = 3.6, h = 30, $fn = 50);
      }
    }
    
    //Bearing opening
    hull()
    {
      translate([0, $ArmLength, $ArmThickness / 2])
        cylinder(d = 14, h = 6, $fn = 30);
      translate([0, $ArmLength - 5 - $BearingSlot, $ArmThickness / 2])
        cylinder(d = 14, h = 6, $fn = 30);
    }
  }
  //Bearing supports
  translate([0, 46, $ArmCenterHeight - (6 / 2)])
  {
    //Clearance spacer
    cylinder(d = 7.5, h = .5, $fn = 40);
    //Inner support
    cylinder(d = 5.7, h = 0.5 + $ClipLength, $fn = 40);
  }
  translate([0, 46,$ArmCenterHeight + (6 / 2) - 0.5])
  {
    //Clearance spacer
    cylinder(d = 7.5, h = .5, $fn = 40);
    //Inner support
    translate([0, 0, -$ClipLength])
      cylinder(d = 5.7, h = $ClipLength, $fn = 40);
  }
}

module FeederArmV1()
{
  difference()
  {
    union()
    {
      cylinder(d = 9, h = 3, $fn = 50);
      translate([0, 0, 3])
      {
        cylinder(d = 13, h = 9, $fn = 50);
        translate([-1.5/2, 0,0])
          cube([1.5, 52, 9]);
      }
    }
    cylinder(d = $RevHDShaftD + .15, h = $SpinnerHeight + .01, $fn = 6);
    translate([-2.5, 33, 3 + 9])
      rotate(-12, [1, 0,0])
    cube([5, 20, 10]);
  }
}

module LifterInsert($Diameter = 15.4)
{
  difference()
  {
    cylinder(d1 = $Diameter + .75, d2 = $Diameter - 2, h = 30, $fn = 50);
    cylinder(d = $RevHDShaftD + .25, h = 30, $fn = 6);
  }
}

module ModifiedGear()
{
//gear (number_of_teeth=15, circular_pitch=false, diametral_pitch=false, pressure_angle=28, clearance = 0.2, gear_thickness=5, rim_thickness=8, 
//      rim_width=5, hub_thickness=10, hub_diameter=15, bore_diameter=5, circles=0, backlash=0, twist=0, involute_facets=0, flat=false)
  gear (number_of_teeth=$NTeeth,circular_pitch=$CPitch,circles=6,bore_diameter=10, gear_thickness=$GThickness, rim_thickness=$GThickness, rim_width=0, 
        hub_thickness=$GThickness, hub_diameter=10, circle_orbit_diameter = 44, circle_diameter = 0);
  difference()
  {
    cylinder(d = 11, h = $GThickness);
    rotate(360 / 12, [0, 0, 1])
      cylinder(d = $RevHDShaftD + .2, h = $GThickness, $fn = 6);
  }
}

module LifterShaftBlock()
{
  difference()
  {
    translate([0, 0, -$BlockHeight / 2])
      cube([$BlockWidth, $BlockDepth, $BlockHeight], center = true);
    translate([-$ShaftSpacing / 2, -1, -$BlockHeight + $ShaftOffset])
      cylinder(d = $ShaftDiameter, h = $BlockHeight + 2);
    translate([+$ShaftSpacing / 2, -1, -$BlockHeight + $ShaftOffset])
      cylinder(d = $ShaftDiameter, h = $BlockHeight + 2);


    translate([-$InnerShaftSpacing / 2, -1, -$BlockHeight + $ShaftOffset])
      cylinder(d = $ShaftDiameter, h = $BlockHeight + 2);
    translate([+$InnerShaftSpacing / 2, -1, -$BlockHeight + $ShaftOffset])
      cylinder(d = $ShaftDiameter, h = $BlockHeight + 2);



    rotate(90, [1, 0, 0])
    {
      translate([-$ShaftSpacing / 2, -$BlockHeight / 2, -$BlockHeight + $ShaftOffset])
        cylinder(d = 3, h = $BlockHeight);
      translate([+$ShaftSpacing / 2, -$BlockHeight / 2, -$BlockHeight + $ShaftOffset])
        cylinder(d = 3, h = $BlockHeight);
    }    
  }
}


module UpperOuterLifterShaftBlock()
{
  difference()
  {
    union()
    {
      LifterShaftBlock($BlockWidth = $OuterBlockWidth, $ShaftSpacing = $OuterShaftSpacing);
      translate([0, -(30 + $BlockDepth) / 2, -($BlockHeight / 2)])
        cube([$OuterBlockWidth, 30, $BlockHeight], center = true);
    }
      translate([0, -(40 - $BlockDepth) / 2, -($BlockHeight / 2)])
    cube([$OuterShaftSpacing - 15, 40, $BlockHeight + 5], center = true);
    translate([-20, -35, -$BlockHeight / 2])
      rotate(90, [1, 0,0])
        cylinder(d = 4, h = 40, center = true);
    translate([20, -35, -$BlockHeight / 2])
      rotate(90, [1, 0,0])
        cylinder(d = 4, h = 40, center = true);

  }
}

module UpperOuterLifterCarriage()
{
  difference()
  {
    cube([$OuterBlockWidth, $BlockDepth, $BlockHeight], center = true);
    translate([$OuterShaftSpacing / 2, 0, 0])
      cylinder(d = $BearingDiameter, h = $BlockHeight + 2, center = true);
    translate([-$OuterShaftSpacing / 2, 0, 0])
      cylinder(d = $BearingDiameter, h = $BlockHeight + 2, center = true);
    translate([$InnerShaftSpacing / 2, 0, $ShaftOffset])
      cylinder(d = $ShaftDiameter, h = $BlockHeight + 2, center = true);
    translate([-$InnerShaftSpacing / 2, 0, $ShaftOffset])
      cylinder(d = $ShaftDiameter, h = $BlockHeight + 2, center = true);
  }
}

module UpperInnerLifterCarriage()
{
  difference()
  {
    LifterShaftBlock($BlockWidth = $InnerBlockWidth, $ShaftSpacing = $InnerShaftSpacing, $ShaftDiameter = $BearingDiameter, $ShaftOffset = 0);
    translate([0, 0, -$BlockHeight / 2])
      rotate(90, [1, 0,0])
        cylinder(d = 4, h = 40, center = true);
  }
}

module LowerOuterCarriage()
{
  difference()
  {
    UpperOuterLifterCarriage();
    translate([10, 0, 0])
      rotate(90, [1, 0,0])
        cylinder(d = 4, h = 40, center = true);
    translate([-10, 0, 0])
      rotate(90, [1, 0,0])
        cylinder(d = 4, h = 40, center = true);
    
    rotate(90, [1, 0, 0])
    {
      translate([-$InnerShaftSpacing / 2, 0, 0])
        cylinder(d = 3, h = $BlockHeight + 2, center = true);
      translate([+$InnerShaftSpacing / 2, 0, 0])
        cylinder(d = 3, h = $BlockHeight + 2, center = true);
      translate([-$OuterShaftSpacing / 2, 0, 0])
        cylinder(d = 3, h = $BlockHeight + 2, center = true);
      translate([+$OuterShaftSpacing / 2, 0, 0])
        cylinder(d = 3, h = $BlockHeight + 2, center = true);
    }    
    
  }
}

module UpperInnerShaftBlock()
{
  difference()
  {
    LifterShaftBlock($BlockWidth = $InnerBlockWidth, $ShaftSpacing = $InnerShaftSpacing);
    translate([5, 0, -$BlockHeight / 2])
      rotate(90, [1, 0,0])
        cylinder(d = 4, h = 40, center = true);
    translate([-5, 0, -$BlockHeight / 2])
      rotate(90, [1, 0,0])
        cylinder(d = 4, h = 40, center = true);
  }
}

module LUULifterPrint($ShaftDiameter = 8, $OuterShaftSpacing = 100, $InnerShaftSpacing = 40, $BlockHeight = 30, $BlockDepth = 30, $OuterTravel = 12 * 25.4, $InnerTravel = 12 * 25.4, $ShaftOffset = 0, $BearingDiameter = 15)
{
  $fn = 100;
  $InnerBlockWidth = $InnerShaftSpacing + $BlockDepth;
  $OuterBlockWidth = $OuterShaftSpacing + $BlockDepth;
  translate([0, 40, $BlockDepth])
    UpperInnerShaftBlock();
  translate([0, 40, $BlockDepth])
    UpperOuterLifterShaftBlock();
  translate([0, 80, $BlockDepth/ 2])
    LowerOuterCarriage();
  translate([0, -30, $BlockDepth])
    UpperInnerLifterCarriage();
  translate([0, -70, $BlockDepth]) 
    LowerOuterShaftBlock();
}

module LowerOuterShaftBlock()
{
  difference()
  {
    LifterShaftBlock($BlockWidth = $OuterBlockWidth, $ShaftSpacing = $OuterShaftSpacing);
    translate([$InnerShaftSpacing / 2, 0, -$BlockHeight])
      cylinder(d = $BearingDiameter, h = $BlockHeight + 2);
    translate([-$InnerShaftSpacing / 2, 0, -$BlockHeight])
      cylinder(d = $BearingDiameter, h = $BlockHeight + 2);
  }
}

module LUULifter($ShaftDiameter = 8, $OuterShaftSpacing = 100, $InnerShaftSpacing = 40, $BlockHeight = 30, $BlockDepth = 30, $OuterTravel = 12 * 25.4, $InnerTravel = 12 * 25.4, $ShaftOffset = 0, $BearingDiameter = 15)
{
  $InnerBlockWidth = $InnerShaftSpacing + $BlockDepth;
  $OuterBlockWidth = $OuterShaftSpacing + $BlockDepth;
  //Outer lower rail block 
  LowerOuterShaftBlock();
  //Outer rails
  color("silver")
  {
    translate([-$OuterShaftSpacing / 2, 0, 0])
      cylinder(d = $ShaftDiameter, h = $OuterTravel);
    translate([+$OuterShaftSpacing / 2, 0, 0])
      cylinder(d = $ShaftDiameter, h = $OuterTravel);
  }
  translate([0, 0, $OuterTravel])
    rotate(180, [0, 1, 0])
      UpperOuterLifterShaftBlock();
  translate([0, 0, $OuterTravelHeight + $BlockHeight])
  {
    LowerOuterCarriage();
    //Inner rails
    color("silver")
    {
      translate([-$InnerShaftSpacing / 2, 0, 0])
        cylinder(d = $ShaftDiameter, h = $InnerTravel);
      translate([+$InnerShaftSpacing / 2, 0, 0])
        cylinder(d = $ShaftDiameter, h = $InnerTravel);
    }
    translate([0, 0, $InnerTravel])
      rotate(180, [0, 1, 0])
        UpperInnerShaftBlock();
    translate([0, 0, $InnerTravelHeight])
      UpperInnerLifterCarriage();
  }
}

module SingleBearingSupport()
{
  difference()
  {
    DoubleBearingSupport();
    translate([-50, 49, -2])
      cube([100, 100, 50]);
  }
}

module LowerPlateShort()
{
  difference()
  {
    LowerPlate();
    translate([-200, 49, -2])
      cube([250, 100, 50]);
    translate([-163, 25, -2])
      rotate(10, [0, 0, 1])
        cube([250, 100, 50]);
  }
}

module ShooterCompleteShort()
{
  SingleBearingSupport();
  LowerPlateShort();
  translate([65, -90, 2])
    RingFeeder();
}

module PrintShooterCompleteShort()
{
  translate([90, 10, 35])
    rotate(180, [0, 1, 0])
      rotate(-90, [0, 0, 1])
        SingleBearingSupport();
  difference()
  {
    union()
    {
      LowerPlateShort();
      translate([65, -90, 2])
        RingFeederV2();
    }
    /*
    translate([-20, -138, -5])
    for ($x = [0:4])
    {
      for ($y = [0:3])
      {
        translate([$x * 30, $y * 30, 0])
        cylinder(d = 22, h = 22);
      }
    }
    translate([-140, -90, -5])
    for ($x = [0:3])
    {
      for ($y = [0:3])
      {
        if ((($x == 0) && ($y == 0)) || (($x == 0) && ($y == 1)))
        {
        }
        else
        {
          translate([$x * 30, $y * 30, 0])
          cylinder(d = 22, h = 22);
        }
      }
    }
    */
  }
}

module RingFeederV2()
{
  difference()
  {
    union()
    {
      Washer($Outer = 140, $Inner = 135, $Thickness = 60, $fn = 80);
      translate([-30, -70, -$ArcThickness])
        cube([30 + 70 + 20, 140, $ArcThickness]);
    }
    translate([-135, -135 / 2, 0])
      cube([135, 135, 30]);
    translate([10, -135 / 2, 0])
      cube([135, 135, 61]);
    translate([120, -40 / 2, -5])
      rotate(45, [0, 0, 1])
      cube([135, 135, 30]);
    translate([70, -30, 0])
    {
//      cylinder(d = 90, h = 15);
      rotate(7, [0, 0, 1])
        HexMotorMountHoles();
    }
  }
}

$InnerTravelHeight = 10 * 25.4;
$OuterTravelHeight = 7 * 25.4;
//translate([0, 130, 0])
//LUULifterPrint();
//LUULifter();
//GoBildaMecanumMount($DoSprocket = 1);
//SmallPulleyCap();

//Paul, these are the used items...
//FeederArm($Style = 1);
//RingFeeder();
//RingLauncherV2();
//LauncherWheel($fn = 100, $Weights = 5, $XStipple = 0, $YStipple = 8);
//DoubleBearingSupport();
//LowerPlate();
//LauncherOuterCap();
//LauncherInnerCap();


//SingleBearingSupport();
//LowerPlateShort();
//ShooterCompleteShort();
//PrintShooterCompleteShort();

/////////////////////////////////////////////////////////////////////////////////////////

//$ChainSize = 25;
//$SprocketTeethCount = 16;
//$ChainGuideAngle = 25;
//sprocket($ChainSize, $SprocketTeethCount, 0, 0, 0, $ChainGuideAngle);

//TetrixNarrowBearingMount($fn = 50); // Also good for GoBilda mounting
//TetrixWideBearingMount($fn = 50);
//TetrixEdgeBearingMount($fn = 50);

//ModifiedGear ($CPitch = 400, $NTeeth = 17, $GThickness = 5, $fn = 30);//Spacing = 2 primary holes on Actobotics frame
//ModifiedGear ($CPitch = 400, $NTeeth = 17 * 2, $GThickness = 5, $fn = 30);//Spacing = 4 primary holes on Actobotics frame
//LifterInsert($Diameter = 15);
//LifterInsert($Diameter = 16.5);
//translate([70, -30, 0])
//  FeederArm($Style = 1);
//RingFeeder();

//ActoBearingMount($BlockWidth = 25, $Inset = 1, $Outer = 0);//Actobotics .  or 34 seem reasonable
//ActoBearingMountCap($BlockWidth = 25, $Outer = 0);
//ActoBearingMount($BlockWidth = 25, $Inset = 1, $Outer = 0);//Actobotics .  or 34 seem reasonable
//ActoBearingMountCap($BlockWidth = 25, $Outer = 0);
//HexShaftBearingShimSpacer();
//HexShaftBearingShims();
//HexShaftBearingShimSpacers();
//RingLauncherV1();
//OuterCompressor();
//CompressorFrame();
//CompressorUpperPlate();
//LauncherWheel($fn = 100, $Weights = 5, $XStipple = 0, $YStipple = 8);  
//LauncherUpperBearingSupport();

//FTCDualOpticalHolder();

//translate([-$XIntakeWidth - 30, ($OuterArcD / 2) - 70, 0])
//  RingLauncherV2();
//LauncherSpinnerPair($fn = 100, $WC = 5);
//DoubleBearingSupport();
//LowerPlate();
//LauncherOuterCap();
//LauncherInnerCap();

//DisplayFullGripperV1();
//PrintFullGripperV1();
//DisplayFullGripperV2();
//PrintFullGripperV2();
//rotate(180, [1, 0, 0])
//ServoConnector();
//StandardServo($DoPillars = 0, $Gap = 0, $ShaftDiameter = 5.6, $ServoDepth = 9.5, $ServoTabOffset = 0, $M3Tight = 2.0);

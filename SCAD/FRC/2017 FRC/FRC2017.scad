//Thickness of the material used for the frame
$FrameMaterialThickness = .194;
$RampMaterialThickness = .066;

//Spacing between gearbox mounting holes
$GBMHSpacingX1 = 2.5;
$GBMHSpacingX2 = 3.043;
$GBMHSpacingY = 3.5;
//Gearbox mounting hole diameter
$GBMHDiameter = .264;

//Flywheel parameters
$FlywheelDiameter = 6.0;
$FlywheelThickness = 1.5;

//Ball size
$BallDiameter = 5.0;
//How much do we want to compress the ball?
$BallCompression = 0.2;
//Gap to allow ball to move freely
$ChannelClearance = .2;
//Resultant channel size
$ChannelSize = $BallDiameter + $ChannelClearance;
//Height if the guide channel
$ChannelGuideHeight = 5.5;
//Amount of support for the ball guide
$GuideSupportHeight = 0.75;

//Control over gap for feeder pusher
$PusherHeight = 3;

//Height of the support frame
$FrameHeight = 18;
//Distance from flywheel center to base of support frame
$FrameLowerHeight = 4;

//Frame hole diameter for snug wood screw
$WoodScrewDiameter = .1;

$CIMDiameter = 2.53;
$CIMLength = 3.355;
$CIMSlotLength = 0.4;
$CIMShaftDiameter = 0.315;
$CIMShaftLength = 1.402;
$ShooterWheel2Diameter = 2.85;
$ShooterWheel2Width = 0.812;
$RampCutoutRadius = ($ShooterWheel2Diameter / 2) + $BallDiameter - $BallCompression;
$BallSideClearance = 0.2;
$SupportGap = (($BallDiameter + $BallSideClearance) - (5 * $FrameMaterialThickness)) / 4;
$PlateMountHoleDiameter = .193;
$Length1 = 0.2;
$Length2 = 0.2;

echo("Ramp spacer size = ", $SupportGap);

//Display colors
$FrameColor = [0.4, 0.8, 0.7, 0.9];
$GuideColor = [0.2, 0.5, 0.5, 0.9];
$MotorColor = [0.2, 0.2, 0.2, 0.9];
$ShaftColor = [0.7, 0.7, 0.8, 0.9];
$WheelColor = [0.3, 0.2, 0.7, 0.9];
$BallColor  = [0.6, 0.6, 0.8, 0.9];

module ShaftMounts()
{
  //Internal shaft
  translate([0, 0.573, -$FrameMaterialThickness - 0.2])
    cylinder(d = .5, h = $FrameMaterialThickness + 0.2, $fn = 50);
  //Bearing collar
  translate([0, 0.573, -$FrameMaterialThickness - 0.05])
    cylinder(d = 1, h = $FrameMaterialThickness + 0.05, $fn = 50);
  //Drive shaft
  translate([0, -1.029, -1.89])
    cylinder(d = .5, h = 1.89, $fn = 50);
  //Bearing collar
  translate([0,-1.029, -$FrameMaterialThickness - 0.05])
    cylinder(d = 1.3, h = $FrameMaterialThickness + 0.05, $fn = 50);
}

module GearboxMountHoles()
{
  translate([-$GBMHSpacingX2 / 2, -$GBMHSpacingY / 2, -.5])
    cylinder(d = $GBMHDiameter, h = 0.5, $fn = 40);
  translate([$GBMHSpacingX2 / 2, -$GBMHSpacingY / 2, -.5])
    cylinder(d = $GBMHDiameter, h = 0.5, $fn = 40);
  translate([-$GBMHSpacingX1 / 2, $GBMHSpacingY / 2, -.5])
    cylinder(d = $GBMHDiameter, h = 0.5, $fn = 40);
  translate([$GBMHSpacingX1 / 2, $GBMHSpacingY / 2, -.5])
    cylinder(d = $GBMHDiameter, h = 0.5, $fn = 40);
}

module GearboxMounts()
{
  ShaftMounts();
  GearboxMountHoles();
}

module GearBox()
{
  translate([0, 1.029, 0])
  {
    //Gearbox
    translate([-6.125/2, -2.2,0])
      cube([6.125, 4.4, .875]); 
    //Motors
    translate([1.7, 0, 0])
      cylinder(d = 2.536, h = 4.315, $fn = 40);
    translate([-1.7, 0, 0])
      cylinder(d = 2.536, h = 4.315, $fn = 40);
    //Mounting shafts/openings
    GearboxMounts();
  }
}

module FlyWheel()
{
  translate([0, 0, -($ChannelSize / 2) - $FrameMaterialThickness])
    cylinder(d = $FlywheelDiameter, h = $FlywheelThickness, center = true, $fn = 80);
}

module FlyWheelDriveSet()
{
  rotate(90, [0, 0, 1])
    GearBox();
  FlyWheel();
}

module WoodBlock()
{
  translate([-0.25, -0.25, -$FrameMaterialThickness - $ChannelSize])
  cube([($Spacing * ($Count -1)) + 0.5, .5, $ChannelSize]);
}

module HoleSet()
{
//$Size = $WoodScrewDiameter, $Count = 3, $Spacing = 1
  for (a = [0:$Count-1])
  {
    translate([a * $Spacing, 0, -$FrameMaterialThickness - 0.05])
      cylinder(d = $Size, h = $FrameMaterialThickness + .1, $fn = 30);
  }
}

module SidePlate()
{
  color($FrameColor)
  difference()
  {
    translate([-$FrameLowerHeight, -$FlywheelDiameter / 2, -$FrameMaterialThickness])
      cube([$FrameHeight, $FlywheelDiameter + $FlywheelDiameter + $BallDiameter - $BallCompression, $FrameMaterialThickness]);
    translate([0, 0, .01])
      rotate(90, [0, 0, 1])
        GearBox();
    translate([0, $FlywheelDiameter + $BallDiameter - $BallCompression, 0.01])
      rotate(90, [0, 0, 1])
        GearBox();
    //Slots for channel guides
    translate([$FrameHeight - $FrameLowerHeight - $ChannelGuideHeight - $GuideSupportHeight, (($FlywheelDiameter + $BallDiameter - $BallCompression) / 2) - ($ChannelSize / 2) - $FrameMaterialThickness, - $FrameMaterialThickness - 0.1])
      cube([$ChannelGuideHeight, $FrameMaterialThickness, $FrameMaterialThickness + .2]);
    translate([$FrameHeight - $FrameLowerHeight - $ChannelGuideHeight - $GuideSupportHeight, (($FlywheelDiameter + $BallDiameter - $BallCompression) / 2) + ($ChannelSize / 2), - $FrameMaterialThickness - 0.1])
      cube([$ChannelGuideHeight, $FrameMaterialThickness, $FrameMaterialThickness + .2]);
    //Remove excess corners
    translate([11, -9.5, -($FrameMaterialThickness / 2) - .01])
      rotate(38, [0, 0, 1])
        cube([30, 20, $FrameMaterialThickness + .2], center = true);
    translate([11, 9.5 + $FlywheelDiameter + $BallDiameter - $BallCompression, -($FrameMaterialThickness / 2) - .01])
      rotate(-38, [0, 0, 1])
        cube([30, 20, $FrameMaterialThickness + .2], center = true);
    //Support mounting holes
    translate([2.8, -2.7, 0])
      rotate(38, [0, 0, 1])
        HoleSet($Size = $WoodScrewDiameter, $Count = 4, $Spacing = 2);
    translate([2.8, 2.7 + $FlywheelDiameter + $BallDiameter - $BallCompression, 0])
      rotate(-38, [0, 0, 1])
        HoleSet($Size = $WoodScrewDiameter, $Count = 4, $Spacing = 2);
    translate([-$FrameLowerHeight + 0.4, -2.7, 0])
      rotate(90, [0, 0, 1])
        HoleSet($Size = $WoodScrewDiameter, $Count = 4, $Spacing = 1.6);
    translate([-$FrameLowerHeight + 0.4, 2.7 + $FlywheelDiameter + $BallDiameter - $BallCompression, 0])
      rotate(-90, [0, 0, 1])
        HoleSet($Size = $WoodScrewDiameter, $Count = 4, $Spacing = 1.6);
    }
}

module ChannelGuidePlate()
{
    cube([$ChannelGuideHeight, $FrameMaterialThickness, $ChannelSize + ($FrameMaterialThickness * 4)]);
}

module ChannelGuides()
{
  color($GuideColor)
  {
  translate([$FrameHeight - $FrameLowerHeight - $ChannelGuideHeight - $GuideSupportHeight, (($FlywheelDiameter + $BallDiameter - $BallCompression) / 2) - ($ChannelSize / 2) - $FrameMaterialThickness, -$ChannelSize - ($FrameMaterialThickness * 3)])
    ChannelGuidePlate();
  translate([$FrameHeight - $FrameLowerHeight - $ChannelGuideHeight - $GuideSupportHeight, (($FlywheelDiameter + $BallDiameter - $BallCompression) / 2) + ($ChannelSize / 2), -$ChannelSize - ($FrameMaterialThickness * 3)])
    ChannelGuidePlate();
  }
}

module SidePlate2()
{
  difference()
  {
    SidePlate();
    translate([-$FrameLowerHeight, ($FlywheelDiameter + $BallDiameter - $BallCompression) / 2, -$FrameMaterialThickness - 0.01])
      cylinder(d = $BallDiameter + 0.5, h = $FrameMaterialThickness + .1, $fn = 60);
    translate([0, ($FlywheelDiameter + $BallDiameter - $BallCompression) / 2, -($FrameMaterialThickness / 2) - 0.01])
    cube([$PusherHeight, 1, $FrameMaterialThickness + .1], center = true);
  }
}

module DisplayShooter()
{
  FlyWheelDriveSet();
  translate([0, $FlywheelDiameter + $BallDiameter - $BallCompression, 0])
    FlyWheelDriveSet();
  SidePlate();
  translate([0, 0, -$ChannelSize - $FrameMaterialThickness])
    SidePlate2();
  ChannelGuides();
  //Supports
  translate([2.8, -2.7, 0])
    rotate(38, [0, 0, 1])
      WoodBlock($Count = 4, $Spacing = 2);
  translate([2.8, 2.7 + $FlywheelDiameter + $BallDiameter - $BallCompression, 0])
    rotate(-38, [0, 0, 1])
      WoodBlock($Count = 4, $Spacing = 2);
  translate([-$FrameLowerHeight + 0.4, -2.7, 0])
    rotate(90, [0, 0, 1])
      WoodBlock($Count = 4, $Spacing = 1.6);
  translate([-$FrameLowerHeight + 0.4, 2.7 + $FlywheelDiameter + $BallDiameter - $BallCompression, 0])
    rotate(-90, [0, 0, 1])
      WoodBlock($Count = 4, $Spacing = 1.6);

}

module CutShooterTemplates()
{
  projection(cut = true) 
  SidePlate();
//    SidePlate2();
//  rotate(90, [1, 0, 0])
//      ChannelGuidePlate();
}

module CameraLightRing()
{
  $LightRingDepth = 10;
  $LightSupportDepth = 8;
  $LightRingWall = 3;
  $LightReflectorDelta = 15;
  $LightOuterDiameter = 61;
  $LightInnerDiameter = 43;
  $LightRingDiameter = $LightOuterDiameter + $LightReflectorDelta + $LightRingWall;
  $CameraEnclosureFixDepth = 3;
  $MountPlateDepth = $LightRingDepth + $LightSupportDepth;
  $MountSpacing = 100;
  
  difference()
  {
    union()
    {
      difference()
      {
        cylinder(d = $LightRingDiameter, h = $LightRingDepth, $fn = 50);
        translate([0, 0, 0.1])
          cylinder(d2 = $LightOuterDiameter + $LightReflectorDelta, d1 = $LightOuterDiameter, h = $LightRingDepth + 0.1, $fn = 50);
      }
      cylinder(d2 = $LightInnerDiameter - $LightReflectorDelta, d1 = $LightInnerDiameter, h = $LightRingDepth, $fn = 50);
      translate([0, 0, -$LightSupportDepth])
        cylinder(d = $LightRingDiameter, h = $LightSupportDepth, $fn = 50);
      //Mounting brackets
      translate([($LightRingDiameter + 17) / 2, 0, +($MountPlateDepth / 2) - $LightSupportDepth])
        cube([20, 20, $MountPlateDepth], center = true);
      translate([-($LightRingDiameter + 17) / 2, 0, +($MountPlateDepth / 2) - $LightSupportDepth])
        cube([20, 20, $MountPlateDepth], center = true);
    }
    //Mounting bracket holes
    translate([$MountSpacing / 2, 0, -25])
      cylinder(d = 3.3, h = 50, $fn = 30);
    translate([-$MountSpacing / 2, 0, -25])
      cylinder(d = 3.3, h = 50, $fn = 30);
    //Cut out for power cord
    translate([0, 30, 0])
      cube([8, 19, 3], center = true);
    //Cutout for lense
    translate([0, 0, -$LightSupportDepth - 0.1])
    cylinder( d = 24, h = $LightRingDepth + $LightSupportDepth + 0.2, $fn = 50);
    //Cutout for camera enclosure
    translate([0, -2.5, -$LightSupportDepth + ($CameraEnclosureFixDepth / 2) - 0.1])
    {
      cube([46, 37, $CameraEnclosureFixDepth], center = true);
      translate([33.5/2, 24.5/2, $LightSupportDepth - ($CameraEnclosureFixDepth / 2) - 50.8])
        cylinder(d = 2, h = 50, $fn = 20);
      translate([-33.5/2, 24.5/2, $LightSupportDepth - ($CameraEnclosureFixDepth / 2) - 50.8])
        cylinder(d = 2, h = 50, $fn = 20);
      translate([33.5/2, -24.5/2, $LightSupportDepth - ($CameraEnclosureFixDepth / 2) - 50.8])
        cylinder(d = 2, h = 50, $fn = 20);
      translate([-33.5/2, -24.5/2, $LightSupportDepth - ($CameraEnclosureFixDepth / 2) - 50.8])
        cylinder(d = 2, h = 50, $fn = 20);
    }
  }
}


module Hub1()
{
    difference()
    {
        cylinder(d1 = 12.6, d2 = 12.62, h = 21, $fn = 50); 
        cylinder(d1 = 8.2, d2 = 8.35, h = 21, $fn = 50); 
        translate([0, 0, 18])
        {
            cube([3, 20, 6], center = true);
            cube([20, 3, 6], center = true);
        }
    }
}

module Hub2()
{
    difference()
    {
        cylinder(d1 = 14.6, d2 = 14.4, h = 21, $fn = 6); 
        cylinder(d1 = 8.1, d2 = 8.25, h = 21, $fn = 50); 
        rotate(45, [0, 0, 1])
        translate([0, 0, 18])
        {
            cube([3, 20, 6], center = true);
            cube([20, 3, 6], center = true);
        }
    }
}

module CIMMotor()
{
  translate([0, 0.95, 0])
  {
    rotate(-90, [1, 0, 0])
    {
      color($MotorColor)
        cylinder(d = $CIMDiameter, h = $CIMLength, $fn = 50);
      translate([0, 0, -$CIMShaftLength])
        color($ShaftColor)
          cylinder(d = $CIMShaftDiameter, h = $CIMShaftLength, $fn = 50);
    }
  }
}

module CutoutRadius()
{
  rotate(90, [1, 0 , 0])
    cylinder(r = $Radius, h = 1, $fn = 100, center = true);
  translate([$Radius - 10, -.2, -10])
    cube([10, 1, 10]);
  translate([-10, -.2, $Radius - 10])
    cube([10, 1, 10]);
}

module GuideLocatorHoles()
{
  //Cut out bolting holes
  translate([-2.2, 0, -2.2])
  for (XLoop = [0 : 6])
    for (YLoop = [0 : $FrameHeight / 1.8])
      translate([XLoop * 1.8, 0, (YLoop - (floor($FrameHeight / 1.8) - 6)) * 1.8])
//      translate([XLoop * 1.8, 0, (YLoop * 1.8)])
        rotate(90, [1, 0, 0])
          cylinder(d = $PlateMountHoleDiameter, h = 1, center = true, $fn = 40);
}

module GuideLocatorSlots()
{
  //Cut out bolting holes
  translate([-2.2, 0, -2.2])
  for (XLoop = [0 : 6])
    for (YLoop = [0 : 6])
      translate([XLoop * 1.8, 0, YLoop * 1.8])
        hull()
        {
          translate([$Length1, 0, $Length1])
            rotate(90, [1, 0, 0])
              cylinder(d = $PlateMountHoleDiameter, h = 1, center = true, $fn = 40);
          translate([-$Length2, 0, -$Length2])
            rotate(90, [1, 0, 0])
              cylinder(d = $PlateMountHoleDiameter, h = 1, center = true, $fn = 40);
        }
}

module RampPlate()
{
  difference()
  {
    translate([-3, -($FrameMaterialThickness / 2), -3 + (12 - $FrameHeight)])
      cube([12, $FrameMaterialThickness, $FrameHeight]);
    CutoutRadius($Radius = $RampCutoutRadius + $RampMaterialThickness);
    GuideLocatorHoles();
  }  
  //Add lips to keep ramp material in place
  translate([-3 + 0.5, 0, $RampCutoutRadius + ($RampMaterialThickness / 2)])
    cube([1, $FrameMaterialThickness, $RampMaterialThickness], center = true);
  translate([$RampCutoutRadius + ($RampMaterialThickness / 2),0,  -2.5 + (12 - $FrameHeight)])
    cube([$RampMaterialThickness, $FrameMaterialThickness, 1], center = true);
}

module RampEndPlate()
{
  difference()
  {
    translate([-3, -($FrameMaterialThickness / 2), -3 + (12 - $FrameHeight)])
      cube([12, $FrameMaterialThickness, $FrameHeight]);
    GuideLocatorHoles();
    //Lower motor opening slot
    rotate (90, [1, 0, 0])
    hull()
    {
      translate([$CIMSlotLength, $CIMSlotLength, 0])
        cylinder(d = $CIMDiameter, h = 1, center = true, $fn = 40);
      translate([-$CIMSlotLength, -$CIMSlotLength, 0])
        cylinder(d = $CIMDiameter, h = 1, center = true, $fn = 40);
    }
    //Upper motor opening slot
    translate([0, 0, -(3 * 1.8)])
    rotate (90, [1, 0, 0])
    hull()
    {
      translate([$CIMSlotLength, $CIMSlotLength, 0])
        cylinder(d = $CIMDiameter, h = 1, center = true, $fn = 40);
      translate([-$CIMSlotLength, -$CIMSlotLength, 0])
        cylinder(d = $CIMDiameter, h = 1, center = true, $fn = 40);
    }
  }
}


module ShooterWheel()
{
  rotate(-90, [1, 0, 0])
  {
    color($WheelColor)
      cylinder(d = $ShooterWheel2Diameter, h = $ShooterWheel2Width, $fn = 50, center = true);
  }
}

module Shooter2WheelMotor()
{
  
  CIMMotor();
  ShooterWheel();
}

module Shooter2()
{
  Shooter2WheelMotor();
  RampPlate();
  translate([0, $SupportGap + $FrameMaterialThickness, 0])
    RampPlate();
  translate([0, -$SupportGap - $FrameMaterialThickness, 0])
    RampPlate();
  translate([0, $SupportGap + $FrameMaterialThickness + $SupportGap + $FrameMaterialThickness, 0])
    RampPlate();
  translate([0, -$SupportGap - $FrameMaterialThickness - $SupportGap - $FrameMaterialThickness, 0])
    RampPlate();

  translate([0, $SupportGap + $FrameMaterialThickness + $SupportGap + $FrameMaterialThickness + $FrameMaterialThickness + $SupportGap + $FrameMaterialThickness, 0])
    RampEndPlate();
  translate([0, $SupportGap + $FrameMaterialThickness + $SupportGap + $FrameMaterialThickness + $FrameMaterialThickness, 0])
    RampEndPlate();
  translate([0, -$SupportGap - $FrameMaterialThickness -$SupportGap - $FrameMaterialThickness - $FrameMaterialThickness, 0])
    RampEndPlate();
  
  translate([0, 0, $RampCutoutRadius - ($BallDiameter / 2)])
  color($BallColor)
    sphere(d = $BallDiameter, $fn = 100);
    
  //Lower adjustable motor supports
  translate([0, $SupportGap + $FrameMaterialThickness + $SupportGap + $FrameMaterialThickness, 0])
    CIMMount();
  translate([0, $SupportGap + $FrameMaterialThickness + $SupportGap + $SupportGap + $FrameMaterialThickness + $FrameMaterialThickness + $FrameMaterialThickness + $FrameMaterialThickness, 0])
    CIMMount();

  //Upper adjustable motor supports
  translate([0, $SupportGap + $FrameMaterialThickness + $SupportGap + $FrameMaterialThickness, -(3 * 1.8)])
    CIMMount();
  translate([0, $SupportGap + $FrameMaterialThickness + $SupportGap + $SupportGap + $FrameMaterialThickness + $FrameMaterialThickness + $FrameMaterialThickness + $FrameMaterialThickness, -(3 * 1.8)])
    CIMMount();
}

module Shooter2SmallSupport()
{
  difference()
  {
    cylinder(d = $PlateMountHoleDiameter + .3, h = $SupportGap, $fn = 40);
    translate([0, 0, -0.05])
      cylinder(d = $PlateMountHoleDiameter + 0.007, h = $SupportGap + 0.1, $fn = 40);
  }
}

module Shooter2LargeSupport()
{
  difference()
  {
    cylinder(d = $PlateMountHoleDiameter + .3, h = ($SupportGap * 4) + ($FrameMaterialThickness * 4), $fn = 40);
    translate([0, 0, -0.05])
      cylinder(d = $PlateMountHoleDiameter + 0.007, h = ($SupportGap * 4) + ($FrameMaterialThickness * 4) + 0.1, $fn = 40);
  }
}

module Shooter2SupportSet()
{
  $Spacing = 0.6;
  for (XLoop = [0 : 7])
  {
    translate([-$Spacing, $Spacing * XLoop, 0])
      Shooter2LargeSupport();
    for (YLoop = [0 : 8])
      translate([XLoop * $Spacing, YLoop * $Spacing], 0)
        Shooter2SmallSupport();
  }
}

module Shooter2RampPlate()
{
  square([$BallSideClearance + $BallDiameter, (($RampCutoutRadius * 2 * 3.141) / 4) + 4 + ($FrameHeight - 12)]);
}

module CIMMount()
{
  $SlotDelta = 0.1;
  difference()
  {
    translate([0, 0, -0.5])
    cube([6, $FrameMaterialThickness, 5], center = true); 
    GuideLocatorSlots();
    rotate(90, [1, 0, 0])
    cylinder(d = $CIMDiameter, h = 1, center = true, $fn = 40);
  }
}

module GenerateDXF()
{
  //1x plastic ramp plate
  //5x ramp plate
  //4x motor mount
  //2x end plates

  //Shooter2RampPlate();
  
//  projection(cut = true)
    rotate(90, [1, 0, 0])
      RampPlate();
//      CIMMount();
//      RampEndPlate();
}

//DisplayShooter();
//CutShooterTemplates();

//rotate(180, [1, 0, 0])
//  CameraLightRing();

//Hub2();
//translate([15, 0, 0])
//  Hub1();

scale([25.4, 25.4, 25.4])
Shooter2SupportSet();
//scale([25.4, 25.4, 25.4])
//  Shooter2SmallSupport($SupportGap = .5);

//Shooter2();
//CIMMount();
//GenerateDXF();

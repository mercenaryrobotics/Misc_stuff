//Make sure the system variable OPENSCADPATH  points to the Robotics\Library location

//use     <D:\3D Printer & Laser Cutter\3D models\Robotics\Library\Getriebe.scad>
//use <D:\3D Printer & Laser Cutter\3D models\Robotics\Library\RobotPrimitives.scad>
//use     <D:\3D Printer & Laser Cutter\3D models\Robotics\Library\Sprockets.scad>

//Included so global parameters are defined
//include <RobotPrimitives.scad>
use <Getriebe.scad>
//use <Sprockets.scad>
//use <threads.scad>

// sprocket(size, teeth, bore, hub_diameter, hub_height, guideangle);

/* [Display selection] */
$DisplaySelection = -1;//[-1:Nothing, 0:Robot, 1:Return Pulley, 2:Regular Pulley, 3:Tieof Plate, 4:Coupler Plate(N/U), 5:Motor Mount(N/U), 6:8mm Double Spacer, 7:16mm Double Spacer, 8:8mm 5x Spacer, 9:8mm 3x Spacer, 10:Slide Pulley Guide, 11:Rail Support, 12:Hopper Base, 13:Roller plug, 14:Conveyor Gear, 15:Upper Conveyor Plate, 16:Lower Conveyor Plate, 17:Conveyor Gear Small Hex, 18:Conveyor Gear Small Bearing, 19:Lifter Spindle, 20:Spacer, 21:Rev Hub Mount, 22:Drone Launcher, 23:Lifter Hook, 24:Conveyor Guide, 25:Hopper Pixel Funnel, 26:Dual Hopper, 27:Roller Flipper]
/* [Robot display] */
RobotShowLifterSlide = true;//Lifter side slide
RobotShowConveyorSlide = true;//Conveyor side slide
RobotShowDroneLauncher = true;//Drone launcher
RobotShowHopper = true;//Pixel hopper
RobotShowDrivebase = true;//Drive base
RobotShowLowerConveyor = true;//Lower conveyor
RobotShowUpperConveyor = true;//Upper conveyor
RobotShowConveyorBands = true;
RobotShowBoundingBoxSmall = false;
RobotLifterSpindleStyle = 3;
ReturnPulleyStyle = 2;

/* [CChannel display] */
$ChannelDoCorners = false;
$ChannelDoCenter = true;
$ChannelDoSlots = false;
/* [Misc] */
FlangeBearingDiameterCorrection = 0.0;//-0.41;
LifterSpindleCord = false;
LifterSpindleCenter = false;
/* [Spacer settings] */
SpacerOuter = 13.5;
SpacerInner = 8.35;
SpacerSides = 6;
SpacerThickness = 2.5;
/* [Conveyor settings] */
$ConveyorGuideWidth = 203.1;
$ConveyorGuideSpacing = 15;
$ConveyorGuideThickness = 3;
$ConveyorGuideDiameter = 12;

/* [Rev Mount setting] */
RevMountOrientation = 0;
RevMountDual = 0;
/* [Subsystem Positions] */
SliderPosition = 0;
HopperArmAngle = 0;

module _block_customizer(){}

$fn = 100;
$Hex2Circle = 1/(sin(60));
$Inch2mm = 25.5;

$M4ThreadlockNutDiameterFlat = 6.4;
$M4ThreadlockNutDiameterRound = 7.9;
$M4ThreadlockNutHeight = 4.8;
$M4NonThreadedD = 4.3;
$M4ThreadedD = 4.00 - 0.05;

$M3NonThreadedD = 3.2;
$M3ThreadedD = 3.00;

$FlangeBearingDiameter = 14 + FlangeBearingDiameterCorrection;
$FlangeBearingClearance = 16;

$HexShaft8mmDSnug = 8.330;//8mm shaft

$CChannelThickness = 2.4;
$ChannelInsertBlockWidth = 43;

$ChannelSpacing = 40;

//FTC 2023-2024 components
$DrivebaseInnerSpacing = ((9 + 1) * 24);
//$PixelFloorPickerO1ShaftDSnug = 6.1;//Aluminum 6mm shaft
//$BearingDiameter = 10.06;
//$BearingDiameter = 16.09;
$BearingDiameter = 14.09;
$BearingDepth = 5.3;
$PlateThickness = 5;
$RollerDiameter = 22;
$RearRollerAdder = 5;
$RearRollerSpacing = $RollerDiameter + (0.5 * $Inch2mm) + $RearRollerAdder;
$PixelFloorPickerO1UpperPlateSpacing = 110;
$PixelFloorPickerO1UpperRollerLength = $PixelFloorPickerO1UpperPlateSpacing - $PlateThickness - 1;
$PixelFloorPickerO1LowerPlateSpacing = $PixelFloorPickerO1UpperPlateSpacing + $PlateThickness + $PlateThickness + 1;
$PixelFloorPickerO1LowerRollerLength = $PixelFloorPickerO1LowerPlateSpacing - $PlateThickness - 1;
$PixelFloorPickerO1RearLength = 150;
$PixelFloorPickerO1MidOffset  = 95;
$PixelFloorPickerO1GuideBaseThickness = 20;
$PixelFloorPickerO1GuideVOffset = -4;
$PixelFloorPickerO1SpindleHeight = 12;
$PixelFloorPickerO1DriveGearThickness = 5;
$PixelFloorPickerO1BeltGuideCenters = 24;//Centers of the mounting holes
$PixelFloorPickerO1BeltGuideWidth =  $PixelFloorPickerO1BeltGuideCenters + $PixelFloorPickerO1GuideBaseThickness;//OUTER width of the spacer mount

$RotationHOffset = 20;
$RotationVOffset = 3;

$ArmLength = 17.9 * $Inch2mm;
$ArmAngleIdle = 44.7;
$ArmAngle = 0;
$GrabberAngle = 25;

$PixelFloorPickerO1MountBlockRotation = 20;
$FrontRollerDistanceLower = 360;
$FrontRollerDistanceUpper = 390;
$PixelConveyorAngle = -46.4;

//Drone launcher common
$DroneLauncherRailW = 12.1;
$DroneLauncherRailL = 300;
$DroneLauncherRailThickness = 1.5;
$DroneLauncherRailClearance = .4;
$DroneLauncherCarriageClearance = .6;
//Drone launcher V1
$DroneLauncherV1L = 170;
$DroneLauncherV1ExtensionCutout = 110;
//Drone launcher V2
$DroneLauncherV2L = 150;
$DroneLauncherV2ExtensionCutout = 110;
  
//Pixel hopper 
hopperlowerwidth = 20;
hopperupperwidth = 30;
hopperheight = 120;
hopperwallthickness = 2;
hopperhingeblocksize = 10;
hoppersinglewidth = 90;
DualHopperWidth = (hoppersinglewidth * 2) + 3 + 5;
hopperlinkagethickness = 6;
hopperlinkagebasespacing = 77;
hopperlinkagehopperspacing = 71;
hopperlinkagetoplength = 118;
hopperlinkagebottomlength = 130;
hopperbaseplatethickness = 5;
hopperbaseplateheight = 160;
hopperbaseplatewidth = $DrivebaseInnerSpacing - 5;//Fit between vertical pillars
hopperrotationxoffset = 15;
hopperrotationyoffset = 59.85;//54.85;

//Short version
$PixelFloorPickerO1UpperHullLocations = [[($RollerDiameter / 2) + $PlateThickness + 40, 22, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2), $PixelFloorPickerO1MidOffset, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0]
                                           ];


$PixelFloorPickerO1UpperHullLocationsDrive = [[($RollerDiameter / 2) + $PlateThickness + 40, 22, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2), $PixelFloorPickerO1MidOffset, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0],
                                            [$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder + $PixelFloorPickerO1BeltGuideWidth, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength - 30, 0],
                                            [$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder + $PixelFloorPickerO1BeltGuideWidth, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength - 46, 0]
                                           ];

$PixelFloorPickerO1UpperBearingLocations = [[($RollerDiameter / 2) + $PlateThickness + 40, 22, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2), $PixelFloorPickerO1MidOffset, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0]
                                           ];
                                        
$PixelFloorPickerO1UpperRollerLocations = [[($RollerDiameter / 2) + $PlateThickness + 40, 22, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2), $PixelFloorPickerO1MidOffset, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0]
                                           ];

$PixelFloorPickerO1UpperHoleLocations = [[($RollerDiameter / 2) + $PlateThickness + 37 + $PixelFloorPickerO1GuideVOffset + ($PixelFloorPickerO1GuideBaseThickness / 2), 36 + ($PixelFloorPickerO1GuideBaseThickness / 2), 0], 
                                         [($RollerDiameter / 2) + $PlateThickness + 37 + $PixelFloorPickerO1GuideVOffset + ($PixelFloorPickerO1GuideBaseThickness / 2), 36 + ($PixelFloorPickerO1GuideBaseThickness / 2) + $PixelFloorPickerO1BeltGuideWidth - $PixelFloorPickerO1GuideBaseThickness, 0],
                                         
                                         [($RollerDiameter / 2) + $PlateThickness + 37 + $PixelFloorPickerO1GuideVOffset + ($PixelFloorPickerO1GuideBaseThickness / 2), 36 + 80 + ($PixelFloorPickerO1GuideBaseThickness / 2), 0], 
                                         [($RollerDiameter / 2) + $PlateThickness + 37 + $PixelFloorPickerO1GuideVOffset + ($PixelFloorPickerO1GuideBaseThickness / 2), 36 + 80 + ($PixelFloorPickerO1GuideBaseThickness / 2) + $PixelFloorPickerO1BeltGuideWidth - $PixelFloorPickerO1GuideBaseThickness, 0],
                                         
                                         [($RollerDiameter / 2) + $PlateThickness + 37 + $PixelFloorPickerO1GuideVOffset + ($PixelFloorPickerO1GuideBaseThickness / 2), 36 + 140 + ($PixelFloorPickerO1GuideBaseThickness / 2), 0], 
                                         [($RollerDiameter / 2) + $PlateThickness + 37 + $PixelFloorPickerO1GuideVOffset + ($PixelFloorPickerO1GuideBaseThickness / 2), 36 + 140 + ($PixelFloorPickerO1GuideBaseThickness / 2) + $PixelFloorPickerO1BeltGuideWidth - $PixelFloorPickerO1GuideBaseThickness, 0]
                                        ];

                                        
//Short version                                        
$PixelFloorPickerO1LowerRollerLocations = [[$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0],
                                              [($RollerDiameter / 2), $PixelFloorPickerO1MidOffset, 0],
                                              [($RollerDiameter / 2), $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0]
                                             ];

$PixelFloorPickerO1LowerBearingLocations =[$PixelFloorPickerO1LowerRollerLocations[0],
                                           $PixelFloorPickerO1LowerRollerLocations[1],
                                           $PixelFloorPickerO1LowerRollerLocations[2]
                                          ];

$PixelFloorPickerO1LowerHoleLocations = [//Bottom front guide
                                         [$PixelFloorPickerO1LowerBearingLocations[1][0] - 1, ($RollerDiameter / 2) + 30 + $PixelFloorPickerO1LowerBearingLocations[1][1], 0],
                                         [$PixelFloorPickerO1LowerBearingLocations[1][0] - 1, ($RollerDiameter / 2) + 30 + $PixelFloorPickerO1LowerBearingLocations[1][1] + $PixelFloorPickerO1BeltGuideCenters, 0],
                                         //Bottom rear guide
                                         [$PixelFloorPickerO1LowerBearingLocations[1][0] - 1, ($RollerDiameter / 2) + 30 + $PixelFloorPickerO1LowerBearingLocations[1][1] + 63, 0],
                                         [$PixelFloorPickerO1LowerBearingLocations[1][0] - 1, ($RollerDiameter / 2) + 30 + $PixelFloorPickerO1LowerBearingLocations[1][1] + $PixelFloorPickerO1BeltGuideWidth + 63 - $PixelFloorPickerO1GuideBaseThickness, 0],
                                         //Upper rear guide
//                                         //Rotation shaft
//                                         [($RollerDiameter / 2) + $RotationVOffset, $PixelFloorPickerO1MidOffset + $RotationHOffset, 0]

                                        ];

                                        
//Long version                          
$PixelFloorPickerO2LowerExtension = 50;
$PixelFloorPickerO2UpperExtension = 30;

//Short version
$PixelFloorPickerO2UpperHullLocations = [[($RollerDiameter / 2) + $PlateThickness + 40, 22 - $PixelFloorPickerO2UpperExtension, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2), $PixelFloorPickerO1MidOffset, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0]
                                           ];


$PixelFloorPickerO2UpperHullLocationsDrive = [[($RollerDiameter / 2) + $PlateThickness + 40, 22 - $PixelFloorPickerO2UpperExtension, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2), $PixelFloorPickerO1MidOffset, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0],
                                            [$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder + 43, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength - 30, 0],
                                            [$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder + 43, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength - 46, 0]
                                           ];

$PixelFloorPickerO2UpperBearingLocations = [[($RollerDiameter / 2) + $PlateThickness + 40, 22 - $PixelFloorPickerO2UpperExtension, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2), $PixelFloorPickerO1MidOffset, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0]
                                           ];
                                        
$PixelFloorPickerO2UpperRollerLocations = [[($RollerDiameter / 2) + $PlateThickness + 40, 22 - $PixelFloorPickerO2UpperExtension, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2), $PixelFloorPickerO1MidOffset, 0], 
                                            [$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0]
                                           ];

$PixelFloorPickerO2UpperHoleLocations = [[($RollerDiameter / 2) + $PlateThickness + 37 + $PixelFloorPickerO1GuideVOffset + ($PixelFloorPickerO1GuideBaseThickness / 2), 36 - $PixelFloorPickerO2UpperExtension + ($PixelFloorPickerO1GuideBaseThickness / 2), 0], 
                                         [($RollerDiameter / 2) + $PlateThickness + 37 + $PixelFloorPickerO1GuideVOffset + ($PixelFloorPickerO1GuideBaseThickness / 2), 36 - $PixelFloorPickerO2UpperExtension + ($PixelFloorPickerO1GuideBaseThickness / 2) + $PixelFloorPickerO1BeltGuideCenters, 0],
                                         
                                         [($RollerDiameter / 2) + $PlateThickness + 37 + $PixelFloorPickerO1GuideVOffset + ($PixelFloorPickerO1GuideBaseThickness / 2), 36 + 80 + ($PixelFloorPickerO1GuideBaseThickness / 2), 0], 
                                         [($RollerDiameter / 2) + $PlateThickness + 37 + $PixelFloorPickerO1GuideVOffset + ($PixelFloorPickerO1GuideBaseThickness / 2), 36 + 80 + ($PixelFloorPickerO1GuideBaseThickness / 2) + $PixelFloorPickerO1BeltGuideCenters, 0],
                                         
                                         [($RollerDiameter / 2) + $PlateThickness + 37 + $PixelFloorPickerO1GuideVOffset + ($PixelFloorPickerO1GuideBaseThickness / 2), 36 + 140 + ($PixelFloorPickerO1GuideBaseThickness / 2), 0], 
                                         [($RollerDiameter / 2) + $PlateThickness + 37 + $PixelFloorPickerO1GuideVOffset + ($PixelFloorPickerO1GuideBaseThickness / 2), 36 + 140 + ($PixelFloorPickerO1GuideBaseThickness / 2) + $PixelFloorPickerO1BeltGuideCenters, 0]
                                        ];


$PixelFloorPickerO2LowerRollerLocations = [[$RearRollerSpacing + ($RollerDiameter / 2) + $RearRollerAdder, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0],
                                              [($RollerDiameter / 2), $PixelFloorPickerO1MidOffset - $PixelFloorPickerO2LowerExtension, 0],
                                              [($RollerDiameter / 2), $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, 0]
                                             ];

$PixelFloorPickerO2LowerBearingLocations =[$PixelFloorPickerO2LowerRollerLocations[0],
                                           $PixelFloorPickerO2LowerRollerLocations[1],
                                           $PixelFloorPickerO2LowerRollerLocations[2]
                                          ];

$PixelFloorPickerO2LowerHoleLocations = [//Bottom front guide
                                         [$PixelFloorPickerO2LowerBearingLocations[1][0] - 1, ($RollerDiameter / 2) + 30 + $PixelFloorPickerO2LowerBearingLocations[1][1], 0],
                                         [$PixelFloorPickerO2LowerBearingLocations[1][0] - 1, ($RollerDiameter / 2) + 30 + $PixelFloorPickerO2LowerBearingLocations[1][1] + $PixelFloorPickerO1BeltGuideWidth - $PixelFloorPickerO1GuideBaseThickness, 0],
                                         //Bottom rear guide
                                         [$PixelFloorPickerO2LowerBearingLocations[1][0] - 1, ($RollerDiameter / 2) + 30 + $PixelFloorPickerO2LowerBearingLocations[1][1] + 63 + $PixelFloorPickerO2LowerExtension, 0],
                                         [$PixelFloorPickerO2LowerBearingLocations[1][0] - 1, ($RollerDiameter / 2) + 30 + $PixelFloorPickerO2LowerBearingLocations[1][1] + $PixelFloorPickerO1BeltGuideWidth + 63 + $PixelFloorPickerO2LowerExtension - $PixelFloorPickerO1GuideBaseThickness, 0],
                                         //Upper rear guide
//                                         //Rotation shaft
//                                         [($RollerDiameter / 2) + $RotationVOffset, $PixelFloorPickerO1MidOffset + $RotationHOffset, 0]

                                        ];
                                        

//Odometry pod 
$OdometryPodWheelOffset = 40;
$OdometryPodWheelCenterOffset = 6;
$OdometryPodWheelDiameter = 35;
$OdometryPodWheelWidth = 19;
$OdometryPodWidth = 42;
$OdometryPodCountersinkDepth = 8;

function and(a,b) = (a<1 || b<1) ? 0 : ((a%2>=1) && (b%2>=1) ? 1 : 0) + 2*and(a/2, b/2);

function bitset(num, bit) = (and(num, (2^bit)) != 0);

module RotateAbout(x, y, z, a)
{
  translate([x, y, z])
    rotate(a, [1, 0, 0])
      translate([-x, -y, -z])
        children();
}

module PrintCamerMountLogitec()
{
  translate([0, 0, 28])
    difference()
    {
      CamerMountLogitec();
      translate([0, 0, 50])
        cube([100, 100, 100], center = true);
    }

  translate([40, 0, -2.5])
    difference()
    {
      CamerMountLogitec();
      translate([0, 0, -50])
        cube([100, 100, 100], center = true);
    }

}

module CamerMountLogitec()
{
  difference()
  {
    union()
    {
      intersection()
      {
        union()
        {
          cube([52, 70, 14], center = true);
          sphere(d = 54, $fn = 100);
        }
        scale([0.5, 1.0, 1.0])
          cylinder(d = 70, h = 100, $fn = 10, center = true);
      }
      translate([0, 0, -25])
        cube([30, 72, 6], center = true);
    }
    rotate(90, [0, 1, 0])
      cylinder(d1 = 35, d2 = 60, h = 20);
    sphere(d = 49, $fn = 100);
    cube([53, 73, 5], center = true);
    translate([25, 0, 0])
      cube([20, 73, 53], center = true);
    translate([-25, 0, 0])
      cube([20, 73, 53], center = true);
    translate([0, 29.5, 0])
      cylinder(d = 3, h = 100, $fn = 100, center = true);
    translate([0, -29.5, 0])
      cylinder(d = 3, h = 100, $fn = 100, center = true);
  }
}

 
module SpindleCore(InnerD, OuterD, Height, RimHeight, SlopeSpan, ShaftD, ShaftFaces, ThreadD, Center, Cord)
{
  difference()
  {
    union()
    {
      //Central core
      cylinder(d = InnerD, h = Height);
      //Bottom rim
      cylinder(d = OuterD, h = RimHeight);
      translate([0, 0, RimHeight])
        cylinder(d1 = OuterD, d2 = InnerD, h = SlopeSpan);

      //Top rim
      translate([0, 0, Height - RimHeight])
        cylinder(d = OuterD, h = RimHeight);
      translate([0, 0, Height - RimHeight - SlopeSpan])
        cylinder(d2 = OuterD, d1 = InnerD, h = SlopeSpan);
      
      if (Center)
      {
        translate([0, 0, Height / 2])
          cylinder(d1 = OuterD, d2 = InnerD, h = SlopeSpan);
        translate([0, 0, Height / 2])
        mirror([0, 0, 1])
          cylinder(d1 = OuterD, d2 = InnerD, h = SlopeSpan);
      }
    }
    cylinder(d = ShaftD, h = Height, $fn = ShaftFaces);
    //Cord hole
    if (Cord)      
      translate([InnerD / 4, 0, Height / 2])
        rotate(15, [1, 0, 0])
          rotate(90, [1, 0, 0])
            cylinder(d = ThreadD, h = OuterD, center = true);
    
  }
}

module FTCLifterSpindle(Splitter = false)
{  
  $HubDiameter = $SpindleDiameter + 5;
  $HubDepth = 8;
  $FlatOffset = 0.5;
  $NutWidth = 5.5 + 0.5;
  $NutThickness = 1.9 + 0.5;
  $NutBore = 3.2 + 0.2;
  $NutOffset = 6;
 
  difference()
  { 
    union()
    {
      //Hub
      cylinder(d = $HubDiameter, h = $HubDepth - 2, $fn = 50);
      translate([0, 0, $HubDepth - 2])
        cylinder(d1 = $HubDiameter, d2 = $SpindleDiameter, h = 2, $fn = 50);
      //Thread guide
      translate([0, 0, $HubDepth])
        //#1 = 3.3, #2 = 4
        if ($SpindleType == 0)
          metric_thread (diameter=$SpindleDiameter, pitch=4, length=$SpindleLength, thread_size=3, groove=false);
        else
          cylinder(d = $SpindleDiameter, h = $SpindleLength);
      difference()
      {
        //Hub
        translate([0, 0, $HubDepth + $SpindleLength])
        {
          translate([0, 0, 2])
            cylinder(d = $HubDiameter, h = $HubDepth - 2, $fn = 50);
          cylinder(d2 = $HubDiameter, d1 = $SpindleDiameter, h = 2, $fn = 50);
        }
        //Cable tieoff
        translate([0, -5, $HubDepth + $HubDepth + $SpindleLength + 3])
          rotate(145, [1, 0, 0])
            cylinder(d = 4, h = 16, $fn = 50);
      }
     if (Splitter)
      {
        $SplitterD = 2;
        translate([0, 0, ($SpindleLength / 2) + $HubDepth - $SplitterD])
          cylinder(d2 = $HubDiameter, d1 = $SpindleDiameter, h = $SplitterD, $fn = 50);
        translate([0, 0, ($SpindleLength / 2) + $HubDepth])
          cylinder(d1 = $HubDiameter, d2 = $SpindleDiameter, h = $SplitterD, $fn = 50);
      }
    }
     if (Splitter)
      {
      }
    //Motor shaft opening
    if ($ShaftType == 0)
      difference()
      {
        //Shaft bore
        cylinder(d = $ShaftDiameter, h = $HubDepth + $HubDepth + $SpindleLength, $fn = 50);
        //Shaft bode flat side
        translate([-$ShaftDiameter/2, ($ShaftDiameter / 2) - $FlatOffset, 0])
          cube([$ShaftDiameter, $ShaftDiameter, $HubDepth + $HubDepth + $SpindleLength]);
      }
    else
      //Shaft bore
      cylinder(d = $ShaftDiameter, h = $HubDepth + $HubDepth + $SpindleLength, $fn = 6);
      
    //Lock bolt shaft openings
    translate([0, 0, $HubDepth / 2])
    {
      rotate(-90, [1, 0, 0])
        cylinder(d = $NutBore, h = $SpindleDiameter, $fn = 50);
      translate([0, 0, $HubDepth + $SpindleLength])
        rotate(-90, [1, 0, 0])
          cylinder(d = $NutBore, h = $SpindleDiameter, $fn = 50);
    }
    //Lock bolt nut openings
    translate([0, $NutOffset, $HubDepth / 2])
      cube([$NutWidth, $NutThickness, $HubDepth], center = true);
    translate([0, $NutOffset, ($HubDepth / 2) + $SpindleLength + $HubDepth])
      cube([$NutWidth, $NutThickness, $HubDepth], center = true);
  }
}

module PlanetaryGearChecker()
{
  //Handle
  translate([-5, -5, 0])
    cube([40, 10, 5]);
  translate([0, 0, 5])
    cylinder(d1 = 6.9, d2 = 5.7, h = 8);
  
  //Pointer
  translate([0, 20, 0])
  {
    difference()
    {
      cube([22, 12, 5]);
      translate([6, 6, 0])
        cylinder(d1 = 8.6, d2 = 8.1, h = 5);
    }
    translate([22 + 3.4, 6, 0])
    {
      scale([1,1.5,1])
        cylinder(d = 12 /  sin(120),h = 5, $fn=3);
    }
  }
  

}

module CChannelHolesCornerSet()
{
  translate([16, 16, 0])
    cylinder(d = $M4NonThreadedD, h = $Depth);
  translate([8, 16, 0])
    cylinder(d = $M4NonThreadedD, h = $Depth);
  hull()
  {
    translate([16, 8, 0])
      cylinder(d = $M4NonThreadedD, h = $Depth);
    translate([15.5, 8.5, 0])
      cylinder(d = $M4NonThreadedD, h = $Depth);
  }
  hull()
  {
    translate([8, 8, 0])
      cylinder(d = $M4NonThreadedD, h = $Depth);
    translate([8.5, 8.5, 0])
      cylinder(d = $M4NonThreadedD, h = $Depth);
  }
}

module CChannelHolesLength(HoleCount)
{
  for (i = [0 : HoleCount - 1])
  {
    translate([i * 24, 0, 0])
      CChannelHoles(DoEnd = (i == 0));
  }
}

module CChannelHoles(DoEnd)
{
  if ($DoCorners)
  {
    CChannelHolesCornerSet();
    rotate(-90, [0, 0, 1])
      CChannelHolesCornerSet();
  }
  if (DoEnd)
  {
    if ($DoCorners)
    {
      rotate(90, [0, 0, 1])
        CChannelHolesCornerSet();
      rotate(180, [0, 0, 1])
        CChannelHolesCornerSet();
    }
    if ($DoSlots)
    {
      hull()
      {
        translate([-11.3137, 0, 0])
          cylinder(d = $M4NonThreadedD, h = $Depth);
        translate([-12.7, 0, 0])
          cylinder(d = $M4NonThreadedD, h = $Depth);
      }
    }
  }
  if ($DoSlots)
  {
    hull()
    {
      translate([0, 11.3137, 0])
        cylinder(d = $M4NonThreadedD, h = $Depth);
      translate([0, 16, 0])
        cylinder(d = $M4NonThreadedD, h = $Depth);
    }
    hull()
    {
      translate([0, -11.3137, 0])
        cylinder(d = $M4NonThreadedD, h = $Depth);
      translate([0, -16, 0])
        cylinder(d = $M4NonThreadedD, h = $Depth);
    }
    hull()
    {
      translate([11.3137, 0, 0])
        cylinder(d = $M4NonThreadedD, h = $Depth);
      translate([12.7, 0, 0])
        cylinder(d = $M4NonThreadedD, h = $Depth);
    }
  }
  if ($DoCenter)
    cylinder(d = 14, h = $Depth);
}

module CChannelInsertHoles($CaptureHeight = 0, $HoleD = 4.3)
{
    //Mount holes, sized for M4
    //Top
    translate([16, 16, $Depth / 2])
      Bolt($Shaft = $HoleD, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $CaptureHeight, $Orientation = [1, 0, 0], $Angle = 180, $ShaftLength = $Depth);
    //Top 2
    translate([16 - 8, 16, $Depth / 2])
      Bolt($Shaft = $HoleD, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $CaptureHeight, $Orientation = [1, 0, 0], $Angle = 180, $ShaftLength = $Depth);
    //Top row 2
    translate([16, 16 - 8, $Depth / 2])
      Bolt($Shaft = $HoleD, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $CaptureHeight, $Orientation = [1, 0, 0], $Angle = 180, $ShaftLength = $Depth);
    //Top 2 row 2
    translate([16 - 8, 16 - 8, $Depth / 2])
      Bolt($Shaft = $HoleD, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $CaptureHeight, $Orientation = [1, 0, 0], $Angle = 180, $ShaftLength = $Depth);

    //Bottom
    translate([16, -16, $Depth / 2])
      Bolt($Shaft = $HoleD, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $CaptureHeight, $Orientation = [1, 0, 0], $Angle = 180, $ShaftLength = $Depth);
    //Bottom 2
    translate([16 - 8, -16, $Depth / 2])
      Bolt($Shaft = $HoleD, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $CaptureHeight, $Orientation = [1, 0, 0], $Angle = 180, $ShaftLength = $Depth);
    //Bottom row 2
    translate([16, -16 + 8, $Depth / 2])
      Bolt($Shaft = $HoleD, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $CaptureHeight, $Orientation = [1, 0, 0], $Angle = 180, $ShaftLength = $Depth);
    //Bottom 2 row 2
    translate([16 - 8, -16 + 8, $Depth / 2])
      Bolt($Shaft = $HoleD, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $CaptureHeight, $Orientation = [1, 0, 0], $Angle = 180, $ShaftLength = $Depth);
    //Middle
    translate([12, 0, ($Depth / 2)])
      Bolt($Shaft = $HoleD, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $CaptureHeight, $Orientation = [1, 0, 0], $Angle = 180, $ShaftLength = $Depth);
    //Middle slot
    hull()
    {
      translate([16 - 8 - 8, 16, $Depth / 2])
        Bolt($Shaft = $HoleD, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = 0, $Orientation = [1, 0, 0], $Angle = 180, $ShaftLength = $Depth);
      translate([16 - 8 - 8, 16 - 4.6, $Depth / 2])
        Bolt($Shaft = $HoleD, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = 0, $Orientation = [1, 0, 0], $Angle = 180, $ShaftLength = $Depth);
    }
}

module CChannelInsert($NutHeight = 0, $Width = $ChannelInsertBlockWidth, $Height = $ChannelInsertBlockWidth, $ShaftD = 4.3, $Depth = 20)
{
  difference()
  {
    RoundedBlock($XDim = $Width, $YDim = $Height, $ZDim = $Depth, $CurveD = 4);
    CChannelInsertHoles($CaptureHeight = $NutHeight, $Depth = $Depth, $HoleD = $ShaftD);
    rotate(180, [0, 0, 1])
      CChannelInsertHoles($CaptureHeight = $NutHeight, $Depth = $Depth, $HoleD = $ShaftD);
    cylinder(d = $ShaftD, h = $Depth, center = true);
  }
}

module DrillTemplate($Position = 7.5, $Text = "7.5")
{
  difference()
  {
    translate([-2, 0, 0])
      cube([16, 20, 20], center = true);
    translate([2, 0, 0])
      cube([20, 15.5, 15.5], center = true);
    translate([-8 + $Position, 0, 0])
      cylinder(d = 3.5, h = 50, center = true);
  }
  translate([-5, -10, 0])
    rotate(90, [0, 1, 0])
      rotate(90, [1, 0, 0])
        linear_extrude(1)
          text($Text,halign="center",size=8); 

}

module PulleyWheel()
{
  translate([-2, 0, 0])
    rotate(90, [0, 1, 0])
      difference()
      {
        union()
        {
          cylinder(d = 12, h = 1);
          translate([0, 0, 1])
            cylinder(d1 = 12, d2 = 9.6, h = 1);
          translate([0, 0, 2])
            cylinder(d2 = 12, d1 = 9.6, h = 1);
          translate([0, 0, 3])
            cylinder(d = 12, h = 1);
        }
        translate([0, 0, -0.5])
          cylinder(d = 3.2, h = 5);
      }
}


module USBConnector($Clearance = .5)
{
  $Rounding = 1.5;
  
  translate([0, 19.4 / 2, 0])
  {
    //Shroud
    RoundedBlock($XDim = 16 + $Clearance, $YDim = 19.4 + $Clearance, $ZDim = 9 + $Clearance, $CurveD = $Rounding);
    //Strain relief body
    translate([0, (25 - 19.4) / 2, 0])
      RoundedBlock($XDim = 10.5 + $Clearance, $YDim = 25 + $Clearance, $ZDim = 9 + $Clearance, $CurveD = $Rounding);
    //Strain relief cable
    translate([0, -((19.4 + $Clearance) / 2) + 1, 0])
      rotate(-90, [1, 0, 0])
        cylinder(d = 8.2 + $Clearance, h = 37.2 + $Clearance - 1);
    //Cable
    translate([0, -(19.4 + $Clearance) / 2, 0])
      rotate(-90, [1, 0, 0])
        cylinder(d = 5 + $Clearance, h = 50 + $Clearance);
    //Plug
    translate([0, -(12.2 + 19.4) / 2, 0])
      cube([12 + $Clearance, 12.2 + $Clearance, 4.5 + $Clearance], center = true);
  }
}

module FTCDriverHubModedCase()
{
  import("REV Driver Hub Case With Cover/files/Driver_Hub_Case.stl", convexity=3);
}

module FTCDriverHubModedBottom()
{
  $OriginalDepth = 6;
  $Depth = 16.5;
  $Rounding = 3;
  
  difference()
  {
    import("REV Driver Hub Case With Cover/files/Driver_Hub_Bottom.stl", convexity=3);
    translate([38.0, -7, -7])
      linear_extrude(6)
      {
        mirror([1, 0])
        text("MERCS", size = 14);
      }
  }
  
  //Cable tail holder
  difference()
  {
    translate([4.5, -65, ($Depth / 2) - $OriginalDepth])
      RoundedBlock($XDim = 90, $YDim = 50, $ZDim = $Depth, $CurveD = $Rounding);
    
    translate([0, -43 - 3, 8.8])
    {
      //Type-C power cable opening
      translate([36-43.5, -22, 0])
        RoundedBlock($XDim = 13, $YDim = 50, $ZDim = 7, $CurveD = $Rounding);
      //Joystick openings
      translate([36, 0, 0])
        rotate(180, [1, 0, 0])
          USBConnector($Clearance = .5);
      translate([-26.8, 0, 0])
        rotate(180, [1, 0, 0])
          USBConnector($Clearance = .5);
    }
    //Main case clearance
    translate([0, - (20 / 2) -26.55, 20 / 2])
      cube([150, 20, 20], center = true);
  }
}

module FTCDriverHubModed()
{
//  FTCDriverHubModedBottom();
  FTCDriverHubModedCase();
//  import("REV Driver Hub Case With Cover/files/Driver_Hub_Lid.stl", convexity=3);
}

module GolfBotClub()
{
  difference()
  {
    translate([196, -1.8, 51])
      scale(0.75)
          import("golf stick3.stl", convexity=3);
    translate([590, -50, 0])
      cube([100, 100, 200]);
  }
  
  translate([90, 0, 15])
    rotate(7, [0, 1, 0])
      difference()
      {
        hull()
        {
          sphere(d = 20, $fn = 50);
          translate([0, 0, 60])
            cylinder(d = 25, $fn = 50);
        }
        translate([0, 0, 21])
        cylinder(d = 14.6, h = 40, $fn = 6);
      }
  
}

module GolfBotClubAttatch()
{
  difference()
  {
    cylinder(d = 32, h = 30);
    
    //Hub
    cylinder(d = 14, h = 2.5);
    //Bolt holes
    translate([11, 0, -1])
      cylinder(d = 5, h = 32);
    translate([-11, 0, -1])
      cylinder(d = 5, h = 32);

    //Bolt head holes
    translate([11, 0, 5])
      cylinder(d = 7.5, h = 32);
    translate([-11, 0, 5])
      cylinder(d = 7.5, h = 32);

    //Club shaft hole
    translate([0, 20, 15])
      rotate(90 - 7, [1, 0, 0])
        rotate(30, [0, 0, 1])
          cylinder(d = 14.6, h = 40, $fn = 6);
    //Shaft grub screw holes
    translate([0, 8, 16.4])
    rotate(90, [0, 1, 0])
#    cylinder(d = 3.8, h = 40, center = true);
  }
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
 
 
module PixelFloorPickerO1Rollers(Locations)
{
  for (i = [0:len(Locations) - 1])
    translate(Locations[i])
      cylinder(d = d, h = h, center = true);
  
  
  
  //Leading top roller
  translate([0, 22, 5 + 40])//Band offset from ground
    CylinderOffset($RollerDiameter, $PixelFloorPickerO1UpperRollerLength);
  //Second top roller
  translate([0, $PixelFloorPickerO1MidOffset, $RearRollerSpacing])//Band offset from ground
    CylinderOffset($RollerDiameter, $PixelFloorPickerO1UpperRollerLength);
  //Trailing top roller
  translate([0, $PixelFloorPickerO1MidOffset + $PixelFloorPickerO1RearLength, $RearRollerSpacing + $RearRollerAdder])
    CylinderOffset($RollerDiameter, $PixelFloorPickerO1UpperRollerLength);
}
 
module PixelFloorPickerO1BeltGuide(width, length, channels, mounts, margin, holed = 4)
{
  $ChannelSpacing = (width - margin - margin) / (channels - 1);
  $MountHoleSpacing = (length - $PixelFloorPickerO1GuideBaseThickness) / (mounts - 1);
  
  difference()
  {
    //Base
    hull()
    {
      translate([0, $PixelFloorPickerO1GuideBaseThickness / 2, $PixelFloorPickerO1GuideBaseThickness / 2])
        rotate(90, [0, 1, 0])
          cylinder(d = $PixelFloorPickerO1GuideBaseThickness, h = width, center = true);
      translate([0, length - ($PixelFloorPickerO1GuideBaseThickness / 2), $PixelFloorPickerO1GuideBaseThickness / 2])
        rotate(90, [0, 1, 0])
          cylinder(d = $PixelFloorPickerO1GuideBaseThickness, h = width, center = true);
    }
    //Guide channels
    translate([-(width / 2) + margin, 0, 0])
      for ( i = [0 : channels - 1] )
      {
        hull()
        {
          translate([i * $ChannelSpacing, 0, 2.5 + ($PixelFloorPickerO1GuideBaseThickness / 2)])
            rotate(-90, [1, 0, 0])
              cylinder(d = 5, h = length);
          translate([i * $ChannelSpacing, 0, 10 + ($PixelFloorPickerO1GuideBaseThickness / 2)])
            rotate(-90, [1, 0, 0])
              cylinder(d = 12, h = length);
        }
      }
    //Mount holes
    for ( i = [0 : mounts - 1] )
    {
      translate([width / 2, ($PixelFloorPickerO1GuideBaseThickness / 2) + (i * $MountHoleSpacing), ($PixelFloorPickerO1GuideBaseThickness / 2) + $PixelFloorPickerO1GuideVOffset])
        rotate(-90, [0, 1, 0])
          cylinder(d = holed, h = 20);
      translate([-width / 2, ($PixelFloorPickerO1GuideBaseThickness / 2) + (i * $MountHoleSpacing), ($PixelFloorPickerO1GuideBaseThickness / 2) + $PixelFloorPickerO1GuideVOffset])
        rotate(90, [0, 1, 0])
          cylinder(d = holed, h = 20);
    }
  }
  
  /*
    color("Cyan")
    for ( i = [0 : mounts - 1] )
    {
      translate([width / 2, ($PixelFloorPickerO1GuideBaseThickness / 2) + (i * $MountHoleSpacing), ($PixelFloorPickerO1GuideBaseThickness / 2)+ $PixelFloorPickerO1GuideVOffset])
        rotate(-90, [0, 1, 0])
          cylinder(d = 4, h = 10, center = true);
      translate([-width / 2, ($PixelFloorPickerO1GuideBaseThickness / 2) + (i * $MountHoleSpacing), ($PixelFloorPickerO1GuideBaseThickness / 2)+ $PixelFloorPickerO1GuideVOffset])
        rotate(90, [0, 1, 0])
          cylinder(d = 4, h = 10, center = true);
    }
  */
}

module PixelFloorPickerO1UpperGuideSection(channels = 8)
{
  PixelFloorPickerO1BeltGuide(width = $PixelFloorPickerO1UpperPlateSpacing - $PlateThickness, length = $PixelFloorPickerO1BeltGuideWidth, channels = channels, mounts = 2, margin = 14);
}

module PixelFloorPickerO1LowerGuideSection()
{
  mirror([0, 0, 1])
    PixelFloorPickerO1BeltGuide(width = $PixelFloorPickerO1LowerPlateSpacing  - $PlateThickness, length = $PixelFloorPickerO1BeltGuideWidth, channels = 8, mounts = 2, margin = 14);
}

module PixelFloorPickerO1UpperGuides()
{
  translate([$PixelFloorPickerO1UpperBearingLocations[0][2], ($RollerDiameter / 2) + 3 + $PixelFloorPickerO1UpperBearingLocations[0][1], $PixelFloorPickerO1UpperBearingLocations[0][0] - 3])
    PixelFloorPickerO1UpperGuideSection();
  translate([$PixelFloorPickerO1UpperBearingLocations[0][2], ($RollerDiameter / 2) + 80 + 3 + $PixelFloorPickerO1UpperBearingLocations[0][1], $PixelFloorPickerO1UpperBearingLocations[0][0] - 3])
    PixelFloorPickerO1UpperGuideSection();
  translate([$PixelFloorPickerO1UpperBearingLocations[0][2], ($RollerDiameter / 2) + 140 + 3 + $PixelFloorPickerO1UpperBearingLocations[0][1], $PixelFloorPickerO1UpperBearingLocations[0][0] - 3])
    PixelFloorPickerO1UpperGuideSection();

}

module PixelFloorPickerO1LowerGuides()
{
  translate([$PixelFloorPickerO1LowerBearingLocations[1][2], ($RollerDiameter / 2) + 20 + $PixelFloorPickerO1LowerBearingLocations[1][1], $PixelFloorPickerO1LowerBearingLocations[1][0] + 5])
    PixelFloorPickerO1LowerGuideSection();
  translate([$PixelFloorPickerO1LowerBearingLocations[1][2], ($RollerDiameter / 2) + 80 + 3 + $PixelFloorPickerO1LowerBearingLocations[1][1], $PixelFloorPickerO1LowerBearingLocations[1][0] + 5])
    PixelFloorPickerO1LowerGuideSection();
  translate([$PixelFloorPickerO1LowerBearingLocations[1][2], ($RollerDiameter / 2) + 80 + 3 + $PixelFloorPickerO1LowerBearingLocations[1][1], $PixelFloorPickerO1LowerBearingLocations[1][0] + 30])
    PixelFloorPickerO1LowerGuideSection();
}


module PixelFloorPickerO1LowerPlate(m)
{
  mirror([m, 0, 0])
    rotate(-90, [0, 1, 0])
      difference()
      {
        hull()
          PixelFloorPickerO1LowerPlateHoles(20, $PlateThickness, 3, 3);
        translate([0, 0, 1])
          PixelFloorPickerO1LowerPlateHoles($BearingDiameter, $PlateThickness);
        //Shaft opening
        PixelFloorPickerO1LowerPlateHoles($BearingDiameter - 4, $PlateThickness + 1);
      }
}
 
module PixelFloorPickerO1Plate(m, HullBounds, Holes, Bearings)
{
  mirror([m, 0, 0])
    rotate(-90, [0, 1, 0])
    {
      difference()
      {
        //Body
        hull()
          PixelFloorPickerO1PlateHoles(22, $PlateThickness, HullBounds);
        //Bearigs
        translate([0, 0, 1])
          PixelFloorPickerO1PlateHoles($BearingDiameter, $PlateThickness, Bearings);
        //Shaft opening
        PixelFloorPickerO1PlateHoles($BearingDiameter - 2, $PlateThickness + 1, Bearings);
        //Misc holes (e.g. mounting holes)
        PixelFloorPickerO1PlateHoles($M4NonThreadedD, $PlateThickness + 1, Holes);
      }
    }
}




module PixelFloorPickerO1PlateDrive(m, HullBounds, Holes, Bearings)
{
  difference()
  {
    PixelFloorPickerO1Plate(m, HullBounds, Holes, Bearings);
    translate([0, 208, 94.85])
      PixelFloorPickerO1DriveMotorMount();
  }
}

 
module PixelFloorPickerO1Upper()
{
  //Upper side plates
  translate([$PixelFloorPickerO1UpperPlateSpacing / 2, 0, 0])
    PixelFloorPickerO1PlateDrive(m = 0, HullBounds = $PixelFloorPickerO1UpperHullLocationsDrive, Holes = $PixelFloorPickerO1UpperHoleLocations, Bearings = $PixelFloorPickerO1UpperBearingLocations);
  translate([-$PixelFloorPickerO1UpperPlateSpacing / 2, 0, 0])
    PixelFloorPickerO1Plate(m = 1, HullBounds = $PixelFloorPickerO1UpperHullLocations, Holes = $PixelFloorPickerO1UpperHoleLocations, Bearings = $PixelFloorPickerO1UpperBearingLocations);
 
  //Upper rollers
  rotate(-90, [0, 1, 0])
    PixelFloorPickerO1PlateHoles(d = $RollerDiameter, h = $PixelFloorPickerO1UpperRollerLength, Holes = $PixelFloorPickerO1UpperRollerLocations);
  
  //Upper spacers and band guides
  PixelFloorPickerO1UpperGuides();
  
}


module PixelFloorPickerO1MountBlockHoles(d = $M4ThreadedD, h = 30)
{
  //Plate mount holes
  translate([-4, 5 + 4 + 16, -1])
    cylinder(d = d, h = h);
  translate([-4 - 24 , 4 + 5 + 16, -1])
    cylinder(d = d, h = h);
}

module PixelFloorPickerO1MountBlock()
{
  translate([0, -50 / 2, -40 / 2])
  {
    difference()
    {
      cube([11, 50, 32]);
      rotate(90, [0, 1, 0])
      {
        PixelFloorPickerO1MountBlockHoles();
        //Bearing nut holes
        translate([-4, 4 + 5, 4])
          cylinder(d = 8.5, h = 8);
        translate([-4 - 32 + 8, 4 + 5, 4])
          cylinder(d = 8.5, h = 8);
        translate([-4, 4 + 64 - 32 + 5, 4])
          cylinder(d = 8.5, h = 8);
        translate([-4 - 32 + 8, 4 + 64 - 32 + 5, 4])
          cylinder(d = 8.5, h = 8);
      }
    }
//    translate([16, 130, 16])
//    cube([10, 200, 18], center = true);
  }
}

module PixelFloorPickerO1PlateLower(mount, m, HullBounds, Holes, Bearings)
{
  mirror([m, 0, 0])
    {
    difference()
    {
      union()
      {
        PixelFloorPickerO1Plate(0, HullBounds, Holes, Bearings);
        if (mount == 1)
        {
          translate([($PlateThickness / 2), 180, 20])
            rotate($PixelFloorPickerO1MountBlockRotation, [1, 0, 0])
              PixelFloorPickerO1MountBlock();
        }
        else if (mount == 2)
        {
          //Rotation hub
            translate([$PixelFloorPickerO1SpindleHeight + ($PlateThickness / 2), 0, 0])
            {
              rotate(-90, [0, 1, 0])
                translate($PixelFloorPickerO1LowerHoleLocations[6])
                {
                  cylinder(d = 34, h = 10);
                  translate([0, 0, -10])
                    rotate(90, [0, 0, 1])
                      SpindleCore(InnerD = 30, OuterD = 34, Height = $PixelFloorPickerO1SpindleHeight, RimHeight = .5, SlopeSpan = 1, ShaftD = 0, ShaftFaces = 6, ThreadD = 3, Center = true, Cord = true);
                }
            }
          }
      }
      if (mount == 1)
      {
        translate([10, 0, 0])
          rotate(-90, [0, 1, 0])
            PixelFloorPickerO1PlateHoles(8, $PlateThickness + 10, Holes);
        translate([-7, 163.35, -7.35])//Not the best way to do this. Just lazy at the moment!!!
//        translate([-7, 153, -11.1])//Old mount block
          rotate($PixelFloorPickerO1MountBlockRotation, [1, 0, 0])
            rotate(90, [0, 1, 0])
            {
              PixelFloorPickerO1MountBlockHoles();
              translate([0, 0, $PlateThickness])
                PixelFloorPickerO1MountBlockHoles(d = 8, h = $PlateThickness);
            }
      }
      else if (mount == 2)
        translate([0, 0, ($PixelFloorPickerO1SpindleHeight + ($PlateThickness / 2))])
          translate($PixelFloorPickerO1LowerHoleLocations[6])
            rotate(-90, [0, 1, 0])
              cylinder(d = $HexShaft8mmDSnug, h = 100, $fn = 6, center = true); 
      
    }
  }
}

module PixelFloorPickerO1Lower(mount)
{
  //Lower side plates
  translate([$PixelFloorPickerO1LowerPlateSpacing / 2, 0, 0])
    PixelFloorPickerO1PlateLower(mount = mount, m = 0, HullBounds = $PixelFloorPickerO1LowerBearingLocations, Holes = $PixelFloorPickerO1LowerHoleLocations, Bearings = $PixelFloorPickerO1LowerBearingLocations);
  translate([-$PixelFloorPickerO1LowerPlateSpacing / 2, 0, 0])
    PixelFloorPickerO1PlateLower(mount = mount, m = 1, HullBounds = $PixelFloorPickerO1LowerBearingLocations, Holes = $PixelFloorPickerO1LowerHoleLocations, Bearings = $PixelFloorPickerO1LowerBearingLocations);
 
  //Lower rollers
  rotate(-90, [0, 1, 0])
    PixelFloorPickerO1PlateHoles(d = $RollerDiameter, h = $PixelFloorPickerO1LowerRollerLength, Holes = $PixelFloorPickerO1LowerRollerLocations);

  //Lower spacers and band guides
  PixelFloorPickerO1LowerGuides();
  
}
 
module PixelFloorPickerO1(mount)
{ 
  //Upper components
//  color("Red", 0.7)
    PixelFloorPickerO1Upper();
  //Lower components
//  color("Blue", 0.7)
    PixelFloorPickerO1Lower(mount = mount);
  
  //Roller drive gears
  PixelFloorPickerO1DriveGears();

}
 
module PixelFloorPickerO1Subsystem(mount)
{ 
  RotateAbout(0, (16 * $Inch2mm) + 10, ((12 + 1) * $Inch2mm) - 10, -$ArmAngle)
  {
    RotateAbout(0, $PixelFloorPickerO1MidOffset + $RotationHOffset, ($RollerDiameter / 2), $GrabberAngle + $ArmAngle + ($ArmAngle / 10))
    {
      PixelFloorPickerO1(mount);
    }
  }
  //Arm
  translate([($PixelFloorPickerO1LowerPlateSpacing / 2) + 30.5 + ($PlateThickness / 2), 0, 0])
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
 
module PixelFloorPickerO1PlateHoles(d, h, Holes)
{
  for (i = [0:len(Holes) - 1])
    translate(Holes[i])
      cylinder(d = d, h = h, center = true);
}

module PixelFloorPickerO1DriveGearFixHub(Depth = 8, ShaftD = 6, ShaftShape = 1, DoGub = false, Hub = 15.5, GrubNut = 0)//Shape = 0 round, shape 1 = hex, shape 2 = D, shape3 = slot
{
  //Shape = 0 round, shape 1 = hex, shape 2 = D, shape3 = slot
  rotate(90, [0, 1, 0])
  {
    difference()
    {
      union()
      {
        children();
        cylinder(d = Hub, h = Depth);
      }
      if (ShaftShape == 0)
        cylinder(d = ShaftD, h = Depth, $fn = 30);
      if(ShaftShape == 1)
        rotate(30, [0, 0, 1])
          cylinder(d = ShaftD, h = Depth, $fn = 6);
      if((ShaftShape == 2) || (ShaftShape == 3))
        difference()
        {
          cylinder(d = ShaftD, h = Depth, $fn = 30);
          translate([ShaftD / 2.5, -10, 0])
            cube([20, 20, Depth]);
          if (ShaftShape == 3)
            mirror([1, 0, 0])
              translate([ShaftD / 2.5, -10, 0])
                cube([20, 20, Depth]);
        }
      translate([0, 0, 1.5])
      {
        if (DoGub)
        {
          translate([0, 0, 5])
            rotate(90, [0, 1, 0])
              cylinder(d = 2.5, h = Hub, center = true);
        }
        if ((GrubNut == 1) || (GrubNut == 2))
        {
          translate([2 + (ShaftD / 2), 0, 4.3])
            rotate(-90, [0, 1, 0])
              hull()
              {
                cylinder(d = $Hex2Circle * 5.2, h = 2.1, $fn = 6);
                translate([20, 0, 0])
                  cylinder(d = $Hex2Circle * 5.2, h = 2.1, $fn = 6);
              }
        }
        if ((GrubNut == 2))
        {
          translate([-(ShaftD / 2), 0, 4.3])
            rotate(-90, [0, 1, 0])
              hull()
              {
                cylinder(d = $Hex2Circle * 5.2, h = 2.1, $fn = 6);
                translate([20, 0, 0])
                  cylinder(d = $Hex2Circle * 5.2, h = 2.1, $fn = 6);
              }
        }
      }
    }
  }
}

module PixelFloorPickerO1DriveMotorMount()
{
  rotate(90, [0, 1, 0])
  {
    //Shaft
    cylinder(d = 9, h = 50, center = true);
    //Mount holoes
    translate([8, 8, 0])
      cylinder(d = $M4NonThreadedD, h = 50, center = true);
    translate([8, -8, 0])
      cylinder(d = $M4NonThreadedD, h = 50, center = true);
    translate([-8, 8, 0])
      cylinder(d = $M4NonThreadedD, h = 50, center = true);
    translate([-8, -8, 0])
      cylinder(d = $M4NonThreadedD, h = 50, center = true);
  }
}

module PixelFloorPickerO1DriveGearTop()
{
  PixelFloorPickerO1DriveGearFixHub(Depth = 9,ShaftD = $HexShaft8mmDSnug, ShaftShape = 1, DoGub = true, GrubNut = 0, Hub = 20)
    pfeilrad (modul=1, zahnzahl=54, breite=$PixelFloorPickerO1DriveGearThickness, bohrung=10, eingriffswinkel=20, schraegungswinkel=30, optimiert=true);
}

module PixelFloorPickerO1DriveGearBottom()
{
  mirror([0, 1, 0])
    PixelFloorPickerO1DriveGearFixHub(Depth = 9,ShaftD = $HexShaft8mmDSnug, ShaftShape = 1, DoGub = true, GrubNut = 0, Hub = 20)
      pfeilrad (modul=1, zahnzahl=35, breite=$PixelFloorPickerO1DriveGearThickness, bohrung=10, eingriffswinkel=20, schraegungswinkel=30, optimiert=true);
}

module PixelFloorPickerO1DriveGearMotor(Render = 3)
{
  mirror([0, 1, 0])
  {
    if ((Render == 1) || (Render == 3))
      rotate(180, [0, 1, 0])
        PixelFloorPickerO1DriveGearFixHub(Depth = 9, ShaftD = 6.08, ShaftShape = 2, DoGub = true, GrubNut = 2, Hub = 20)//Shape = 0 round, shape 1 = hex, shape 2 = D, shape3 = slot
          pfeilrad (modul=1, zahnzahl=54, breite=$PixelFloorPickerO1DriveGearThickness, bohrung=10, eingriffswinkel=20, schraegungswinkel=30, optimiert=true);
    else if(Render == 4)
      rotate(180, [0, 1, 0])
        PixelFloorPickerO1DriveGearFixHub(Depth = 9, ShaftD = 8.4, DoGub = true, GrubNut = 0, Hub = 20, ShaftShape = 1)//Shape = 0 round, shape 1 = hex, shape 2 = D, shape3 = slot
          pfeilrad (modul=1, zahnzahl=54, breite=$PixelFloorPickerO1DriveGearThickness, bohrung=10, eingriffswinkel=20, schraegungswinkel=30, optimiert=true);

    if ((Render ==2 ) || (Render == 3))
      rotate(90, [0, 1, 0])
        difference()
        {
          cylinder(d = 14, h = 5);
          cylinder(d = 6.3, h = 5);
        }
  }
}

module PixelFloorPickerO1DriveGears(AdditionalSpacing = 0)
{
  translate([(($PixelFloorPickerO1LowerPlateSpacing  + $PixelFloorPickerO1DriveGearThickness) / 2) + .5, $PixelFloorPickerO1LowerRollerLocations[2][1], $PixelFloorPickerO1LowerRollerLocations[2][0]])
  {
    //Top drive
    translate([0, 0, $RearRollerSpacing + $RearRollerAdder + AdditionalSpacing])
      PixelFloorPickerO1DriveGearTop();
    //Bottom drive
    PixelFloorPickerO1DriveGearBottom();
    //Motor drive
    translate([0, -37, $RearRollerSpacing + $RearRollerAdder + AdditionalSpacing + 39.1 + AdditionalSpacing])
      rotate(180, [0, 1, 0])
        PixelFloorPickerO1DriveGearMotor();
  }
}

module OdometryPodWheel()
{
  difference()
  {
    cylinder(d = $OdometryPodWheelDiameter, h = $OdometryPodWheelWidth, center = true);
    cylinder(d = 5.6, h = 20, center = true, $fn = 6);
  }
}

module E4PSensor()
{
  //Core
  cylinder(d = 22, h = 10);
  //Mount screws
  translate([14.88 / 2, 0, -16])
    cylinder(d = 2.5, h = 16);
  translate([-14.88 / 2, 0, -16])
    cylinder(d = 2.5, h = 16);
  //Connector
  rotate(60, [0, 0, 1])
    translate([2, 0, 5])
    {
      //Wire opening
      translate([20, 0, -3])
        cube([27, 8, 4], center = true);
      cube([27, 8, 10], center = true);
      //Connector pins
      translate([6, -4, -2-5])
        cube([2, 8, 2]);
    }
}

module OdometryPodSide(WheelCenterOffset, SensorSide)
{
  difference()
  {
    union()
    {
      //Base panel
      hull()
      {
        cylinder(d = 30, h = $OdometryPodWidth / 2);
        translate([$OdometryPodWheelOffset, 0, 0])
          cylinder(d = 30, h = $OdometryPodWidth / 2);
      }
      //Alignment pins
      translate([23, -8, -3])
        cylinder(d = 7, h = 3);
      translate([33, -8, -3])
        cylinder(d = 7, h = 3);
    }
    
    //Bearing openings
    if (SensorSide)
      translate([0, 0, ($OdometryPodWheelWidth / 2) + WheelCenterOffset + 0.49])
        cylinder(d = $BearingDiameter, h = $BearingDepth);
    else
      translate([0, 0, ($OdometryPodWidth / 2) - $BearingDepth + 0.01])
        cylinder(d = $BearingDiameter, h = $BearingDepth);
    cylinder(d = $BearingDiameter - 2, h = $OdometryPodWidth);
    translate([$OdometryPodWheelOffset, 0, ($OdometryPodWidth / 2) - $BearingDepth + 0.01])
      cylinder(d = $BearingDiameter, h = $OdometryPodWidth);
    translate([$OdometryPodWheelOffset, 0, 0])
      cylinder(d = $BearingDiameter - 2, h = $OdometryPodWidth);
    //Wheel opening
    translate([0, 0, WheelCenterOffset])
      cylinder(d = $OdometryPodWheelDiameter + 4, h = $OdometryPodWheelWidth + 1, center = true);
    //Alignment holes
    translate([23, 8, 0])
      cylinder(d = 7.2, h = 5);
    translate([33, 8, 0])
      cylinder(d = 7.2, h = 5);
    //Fixing blt holes
    //Free holes
    translate([23, 8, -5])
      cylinder(d = 3.4, h = $OdometryPodWidth);
    translate([33, 8, -5])
      cylinder(d = 3.4, h = $OdometryPodWidth);
    //Threading holes
    translate([23, -8, -5])
      cylinder(d = 3.0, h = $OdometryPodWidth);
    translate([33, -8, -5])
      cylinder(d = 3.0, h = $OdometryPodWidth);
    //Head countersinks
    translate([23, 8, ($OdometryPodWidth / 2) - $OdometryPodCountersinkDepth])
      cylinder(d = 8, h = $OdometryPodCountersinkDepth);
    translate([33, 8, ($OdometryPodWidth / 2) - $OdometryPodCountersinkDepth])
      cylinder(d = 8, h = $OdometryPodCountersinkDepth);
    if (SensorSide)
    {
      translate([0, 0, ($OdometryPodWidth / 2) - 10])
        rotate(-20, [0, 0, 1])
          E4PSensor();
    }
  }
}

module OdometryPod()
{
//  OdometryPodWheel();
  
  OdometryPodSide($OdometryPodWheelCenterOffset, 0);
//  rotate(180, [1, 0, 0])
  translate([0, 35, 0])
    OdometryPodSide(-$OdometryPodWheelCenterOffset, 1);
}

module PixelFloorPickerO1RollerPlug()
{
  difference()
  {
    union()
    {
      translate([0, 0, 0])
        cylinder(d1 = 16.0, d2 = 15.2, h = 15);
//      cylinder(d = 21, h = 2);
    }
    cylinder(d = $HexShaft8mmDSnug, h = 20, $fn = 6);
  }
}

module DroneLauncherRailProfile(Width, Height, Length, Thickness)
{
    translate([0, -Width / 2, -Height / 2])
      difference()
      {
        cube([Length, Width, Height]);
        translate([-1, Thickness, Thickness])
          cube([Length + 2, Width - Thickness - Thickness, Height]);
      }
}
 
module DroneLauncherCarriageV1()
{
  difference()
  {
    //Core
    translate([($DroneLauncherV1L / 2), 0, 4])
      cube([$DroneLauncherV1L - 0.1, 40, 35], center = true);
    //Drone cutout
    translate([($DroneLauncherV1L / 2) - 2, 0, 23])
      cube([$DroneLauncherV1L - 0.1, 35, 30], center = true);
    //Front extension cutout
    translate([$DroneLauncherV1ExtensionCutout / 2, 0, -9.5])
      cube([$DroneLauncherV1ExtensionCutout, 45, 30], center = true);
    //Elastic hook holes
    translate([$DroneLauncherV1ExtensionCutout + 50, 10, -34.5 + 15])
        cylinder(d = 3, h = 20);
    translate([$DroneLauncherV1ExtensionCutout + 50, -10,  -34.5 + 15])
        cylinder(d = 3, h = 12);
    //Rail slider
    translate([$DroneLauncherV1L / 2, 0, -1])
      cube([$DroneLauncherV1L, $DroneLauncherRailW + $DroneLauncherCarriageClearance, $DroneLauncherRailW + $DroneLauncherCarriageClearance], center = true);
  }
  //Inside guides
  difference()
  {
    translate([($DroneLauncherV1L / 2), 0, 9])
      cube([$DroneLauncherV1L - 0.1, 10, 5], center = true);
    translate([($DroneLauncherV1L / 2), 0, 15])
    rotate(45, [1, 0, 0])
      cube([$DroneLauncherV1L, 10, 10], center = true);
  }
 
}

module DroneLauncherCarriageV2()
{
  difference()
  {
    //Core
    translate([115, -20, -10])
      cube([$DroneLauncherV2L - 115, 40, 35]);
    //Drone cutout
    translate([($DroneLauncherV2L / 2) - 15, 0, 23])
      cube([$DroneLauncherV2L - 0.1, 35, 30], center = true);
    //Latch cutout
    translate([$DroneLauncherV2L -10 - 3, -5, 15])
      cube([10, 10, 30]);
    //Front extension cutout
    translate([$DroneLauncherV2ExtensionCutout / 2, 0, -9.5])
      cube([$DroneLauncherV2ExtensionCutout, 45, 30], center = true);
    //Elastic hook holes
    translate([$DroneLauncherV2ExtensionCutout + 30, 10, -34.5 + 15])
        cylinder(d = 3, h = 20);
    translate([$DroneLauncherV2ExtensionCutout + 30, -10,  -34.5 + 15])
        cylinder(d = 3, h = 12);
    //Rail slider
    translate([$DroneLauncherV1L - 40, 0, -1])
      cube([70, $DroneLauncherRailW + $DroneLauncherCarriageClearance, $DroneLauncherRailW + $DroneLauncherCarriageClearance + .1], center = true);
  }
  //Side supports
  translate([80, 13.32, 15.25])
    rotate(8.8, [0, 0, 1])
      cube([71.22, 2.5, 19.5], center = true);
  translate([80, -13.32, 15.25])
    rotate(-8.8, [0, 0, 1])
      cube([71.22, 2.5, 19.5], center = true);
  //Holder pillars
  difference()
  {
  translate([$DroneLauncherV2L - 10 - 15,0, 20 + 8])
    cube([20, 40, 40], center = true);
  translate([$DroneLauncherV2L - 10 - 15 - 2,0, 20 + 8])
    cube([20, 12, 40], center = true);
  }
  //Inside guides
  difference()
  {
    translate([0, -10, 5.5])
      cube([50, 20, 35]);
    rotate(5, [0, 1, 0])
    translate([-10, 0, 27])
      scale([1.0, 1.0, 1.8])
        rotate(45, [1, 0, 0])
          cube([75, 20, 20]);
  }
  
}
 
module DroneLauncherBase()
{
  difference()
  {
    //Core
    translate([5, 0, 18])
      cube([20, $DroneLauncherRailW + 12, $DroneLauncherRailW + 51], center = true);
    //Channel opening
    translate([0, 0, 0])
      cube([10.2, $DroneLauncherRailW + $DroneLauncherRailClearance, $DroneLauncherRailW + $DroneLauncherRailClearance], center = true);
    //Channel mount mole
    translate([5 - 4.5, 0, 6 - 4])
      rotate(90, [1, 0, 0])
        cylinder(d = $M4ThreadedD, h = 40, center = true);
    //Latch pivot hole    
    translate([8, 0, 19])
      rotate(90, [1, 0, 0])
        cylinder(d = $M4ThreadedD, h = 40, center = true);
    //Mount hole
    translate([8, 0, 19 - 24])
      rotate(90, [1, 0, 0])
        cylinder(d = $M4ThreadedD, h = 40, center = true);
    //Latch cutout
    translate([5, 0, 22])
      cube([21, 6, 26], center = true);
    translate([4, 0, 22])
      rotate(18, [0, 1, 0])
        cube([40, 6, 27], center = true);
    //Gripper mount holes
    translate([3, 8, 30])
      cylinder(d = $M4ThreadedD - .1, h = 20);
    translate([3, -8, 30])
      cylinder(d = $M4ThreadedD - .1, h = 20);
  }
}
 
module DroneLauncharTrigger()
{
  rotate(90, [1, 0, 0])
    difference()
    {
      linear_extrude(height = 5,  center = true, convexity = 10, twist = 0)
        polygon([[-3, 5], [-13, 14], [-20, 14], [-19, 11], [-23, 11], [-25, 19],[-5, 19],[5, 12],[30, 12],[30, 5]]);
      translate([0, 10, 0])
        cylinder(d = $M4NonThreadedD, h = 20, center = true);
    }
}
 
module DroneLauncherFrontCap()
{
  rotate(180, [0, 0, 1])
    difference()
    {
      DroneLauncherBase();
      translate([0, 0, 30])
        cube([50, 50, 50], center = true);
    }
}

module DroneLauncher(Version = 2)
{
  color("lightgray")
    DroneLauncherRailProfile(Width = $DroneLauncherRailW, Height = $DroneLauncherRailW, Thickness = $DroneLauncherRailThickness, Length = $DroneLauncherRailL);
  //Rear cap
  translate([$DroneLauncherRailL - 5, 0, 0])
    DroneLauncherBase();
  //Front cap
  translate([0, 0, 0])
    DroneLauncherFrontCap();
  //Launch carriage
  if (Version == 1)
  {
    translate([117, 0, 1])
      DroneLauncherCarriageV1();
  }
  else
  {
    translate([117, 0, 1])
      DroneLauncherCarriageV2();
  }
  //Trigger
  translate([$DroneLauncherRailL + 3, 0, 9])
    DroneLauncharTrigger();
}

module DroneLauncherPrint(Version = 2, ToPrint = 15)
{
  if (and(ToPrint, 1) != 0)
  {
    translate([100, 10, 15])
      rotate(90, [0, 1, 0])
        DroneLauncherBase();
  }
  
  if (and(ToPrint, 2) != 0)
  {
    translate([10, 10, 13.5])
      DroneLauncherFrontCap();    
  }
  
  if (and(ToPrint, 4) != 0)
  {
    if (Version == 1)
    {
      translate([-15, 50, 13.5])
        DroneLauncherCarriageV1();
    }
    else
    {
      translate([-15, 50, 10])
        DroneLauncherCarriageV2();
    }
  }
  
  if (and(ToPrint, 8) != 0)
  {
    translate([50, 20, 2.5])
      rotate(90, [1, 0, 0])
        DroneLauncharTrigger();
  }
}

module TRailPulleyClampLower()
{
  difference()
  {
    //Main cube
    translate([0, 0, 0.8 - 1.5])
      cube([25 + 3.8 + 3.8, 20 - 0.01, 19.5], center = true);
    //Rail cutout, outer
    translate([0, 25, -10 - 1.1])
      cube([20.5, 50, 10], center = true);
    //Rail cutout, inner
    translate([0, 10, -10 - 1.1])
      cube([14, 50, 7.5], center = true);
    //T-slot stem
    translate([0, 5, -1.2])
      cube([8.1, 10, 10], center = true);
    //T-slot top
    translate([0, 5, -3.9 + 5.6])
      cube([15, 10, 4.5], center = true);
    //Floor clearance cutout
    translate([0, -15, -25])
      rotate(-35, [0, 0, 1])
        cube([30, 30, 50]);
    //Primary pulley
    translate([0, -5, -5])
      rotate(90, [0, 1, 0])
        cylinder(d = $M4ThreadedD, h = 40, center = true);//$M4ThreadedD
  }
}

module TRailPulleyClampUpper()
{
  mirror([0, 1, 0])
  difference()
  {
    translate([0, 0, 1.8])
      cube([25 + 3.8 + 3.8, 20 - 0.01, 18.5], center = true);
    translate([0, 5, -10 - 1.1])
      cube([20.5, 40, 10], center = true);
    translate([0, 5, -1.2])
      cube([8.1, 10, 10], center = true);
    translate([0, 5, -3.9 + 5.6])
      cube([15, 10, 4.5], center = true);
    translate([0, -15, -10])
      rotate(-35, [0, 0, 1])
        cube([30, 30, 30]);
    translate([0, -5, 5])
      rotate(90, [0, 1, 0])
        cylinder(d = $M4ThreadedD, h = 40, center = true);
  }
}

module PulleyCap()
{
  difference()
  {
    cylinder(d = 16, h = 8.5);
    cylinder(d = 14, h = 6.5);
    cylinder(d = 7.9 + 0.36, h = 10);
    translate([-5, 0, 0])
      cube([10, 14, 5.5]);
    translate([-5, 1, 3])
      rotate(-90, [1, 0, 0])
        cylinder(d = 4, h = 10);
    translate([5, 1, 3])
      rotate(-90, [1, 0, 0])
        cylinder(d = 4, h = 10);
  }
}

module CurveTextString(Caption, Radius, Spacing, Depth)
{
  Offset = (len(Caption) - 1)/ 2;
  Circumference = (2 * PI * Radius);
  CharAngle = 360*Spacing/Circumference;
  
  for (i = [0:len(Caption) - 1]) 
  {
    rotate(CharAngle * (i - Offset), [0, 1, 0])
      translate([0, 0, Radius])
        linear_extrude(Depth)
          text(Caption[i], valign="center", halign="center");
  }
}

module TeamToken()
{
  color("red")
  difference()
  {
    sphere(d = 3.75 * 25.4);
    translate([0, 0, -50])
      cube([180, 180, 10], center = true);
  }
  color("white")
    CurveTextString("20166", (3.75 * 25.4 / 2) - 2, 9, 2);
}

module PixelGripperOutline()
{
  difference()
  {
    hull()
    {
      translate([-2, 0])
        circle(d =.5);
      translate([2, 0])
      circle(d =.5);
    }
    translate([-8/25.4, 0])
      circle(d = 4/25.4);
    translate([8/25.4, 0])
      circle(d = 4/25.4);
  }
}

module PixelGripperUpperOutline()
{
  PixelGripperOutline();
  difference()
  {
    translate([-.25, .25])
      square([.5, 1.1]);
    translate([0, .5])
      circle(d = 4/25.4);
    translate([0, .5 + (16 / 25.4)])
      circle(d = 4/25.4);
  }
}

module IntakeRoller(d = 22, l = 240)
{
  rotate(90, [1, 0, 0])
    cylinder(d = d, h = l, center = true);
}

module HopperOpening(wl = 20, wu = 30, l = 95, h = 100)
{
  hull()
  {
    cube([wl, l, 1], center = true);
    translate([0, 0, h])
      cube([wu, l, 1], center = true);
  }
}

module DualHopperOpening(wl = 20, wu = 30, l = 95, h = 100)
{
  translate([0, (l + 2) / 2, 0])
    HopperOpening(wl = wl, wu = wu, l = l, h = h);
  translate([0, -((l + 2) / 2), 0])
    HopperOpening(wl = wl, wu = wu, l = l, h = h);
}

module ServoMountPillarSet()
{
  //Servo support blocks
//  translate([-22.3, -21, 21.2])
    ServoMountPillar();
//  translate([-22.3, -21, 21.2 + 48])
    translate([0, 0, 48])
    mirror([0, 0, 1])
      ServoMountPillar();
}

module DualHopperBin(showservo)
{  
  rotate(90, [0, 0, 1])
  {
    //Center around upper pivot point
    translate([0, 0, -hopperlinkagehopperspacing - 10])
    {
      difference()
      {
        union()
        {
          //Outer frame
          HopperOpening(wl = hopperlowerwidth + (hopperwallthickness * 2), wu = hopperupperwidth + (hopperwallthickness * 2), l = DualHopperWidth , h = hopperheight - 0.1 + 0);
          //Servo support blocks
          translate([-22.3, -21, 21.2])
            ServoMountPillar();
          translate([-22.3, -21, 21.2 + 48])
            mirror([0, 0, 1])
              ServoMountPillar();
        }
        //Scoop shaping
        translate([-10, 0, hopperheight - 5])
          rotate(-50, [0, 1, 0])
            cube([70, DualHopperWidth + 5, 30], center = true);
        //Pixel cutout
        translate([0, 0, -0.1])
          DualHopperOpening(wl = hopperlowerwidth, wu = hopperupperwidth, l = hoppersinglewidth, h = hopperheight + 1);
        //Linkage mount holes
        //Lower hole
        translate([0, 0, 10])
        {
          rotate(90, [1, 0, 0])
            cylinder(d = $M4NonThreadedD, h = DualHopperWidth + 2, center = true);
          translate([0, 0, hopperlinkagehopperspacing])
            rotate(90, [1, 0, 0])
              cylinder(d = $M4NonThreadedD, h = DualHopperWidth + 2, center = true);
        }
      }
    }
    
    if (showservo)
    {
      color("purple")
        translate([-27.25, -4.5, -35.75])
          rotate(-90, [1, 0, 0])
            rotate(-90, [0, 0, 1])      
              import("GoBildaServoLoRes.stl");
    }
  }
}

module ServoMountPillar()
{
  difference()
  {
    translate([-1.7, 0, -1])
      cube([26, 10, 10], center = true);
    rotate(90, [1, 0, 0])
      cylinder(d = 4.5, h = 15, center = true);          
    translate([- 9.9, 0, 0])
      rotate(90, [1, 0, 0])
        cylinder(d = 4.5, h = 15, center = true);
  }
}

module PixelFloorPickerO2(supportspacing, position, offset, stages, width)
{
  //Lift motor side
  if (RobotShowLifterSlide)
  {
    translate([supportspacing, 5, 8])
      mirror([1, 0, 0])
        PixelFloorPickerO2HopperArm(position, offset, stages, width, motorposition = 184 + (24 * 2), channelholes = 5, offsetholes = 2, dopulleyguide = false, spindleoffset = 24 + 4 + 16, mechtype = 1);
    //Outside lift motor support
    color("silver")
      translate([168.2, 28, 196])
        rotate(90, [0, 1, 0])
          RailSupportPlate();
  }

  //Conveyor motor side
  if (RobotShowConveyorSlide)
  {
    translate([-supportspacing, 5, 8])
      PixelFloorPickerO2HopperArm(position, offset, stages, width, motorposition = 184 + 0, channelholes = 5, offsetholes = 3, dopulleyguide = false, spindleoffset = 24 + 12 + 16, mechtype = 2);
    //Outside conveyor motor support
    color("silver")
      translate([-168.2 - 3, 28, 196])
        rotate(90, [0, 1, 0])
          RailSupportPlate();
  }

  //translate and rotate the hopper about the slider and position arms
  if (RobotShowHopper)
  {
    //Move the entire system horizontally wrt slider anchor
    translate([0, 39, 2.55])
      //Rotate at the slider mount angle
      rotate(-30, [1, 0, 0])
        //Move up the slider
        translate([0, 0, position + 468])
          //Rotate back to robot referenced angle
          rotate(30, [1, 0, 0])  
          {
            translate([0, -96.2, -hopperbaseplateheight + 25])
              rotate(-30, [1, 0, 0])              
                HopperSubsystem();
          }
  }
    
   
  //Conveyor
  translate([0, 91.2, 272.6])
  {
    if (RobotShowLowerConveyor)
      PixelConveyor(conveyorwidth = (supportspacing * 2) - 30, conveyorlength = $FrontRollerDistanceLower, upperlower = 0);
    if (RobotShowUpperConveyor)
      PixelConveyor(conveyorwidth = (supportspacing * 2) - 16, conveyorlength = $FrontRollerDistanceUpper, upperlower = 1);
  }
}

module PixelConveyorArm(UpperLower = 0, length)
{
  $DriveGearSpacing = 48;
  $SupportHoleCount = 6;
  $SupportHoleSpacing = length/($SupportHoleCount + 1);
  
  echo("Conveyor support hole spacing = ", $SupportHoleSpacing);
  
  difference()
  {
    union()
    {
      if (UpperLower == 0)//Lower
      //Drive wheel pair
      hull()
      {
        //Intersecting bearing
        cylinder(d = 22, h = 3.5, center = true);
        //Upper bearing
        translate([-$DriveGearSpacing, 0, 0])
          cylinder(d = 22, h = 3.5, center = true);
      }
      //Front edge partner
      hull()
      {
        //Intersecting bearing
        cylinder(d = 22, h = 3.5, center = true);
        translate([0, -length, 0])
          cylinder(d = 18, h = 3.5, center = true);
      }
    }
    //Bearing holes
    cylinder(d = $FlangeBearingDiameter, h = 3.6, center = true);
    translate([-$DriveGearSpacing, 0, 0])
      cylinder(d = $FlangeBearingDiameter, h = 3.6, center = true);
    //Drive gear mount holes
    translate([-(48 / 3), 0, 0])
      cylinder(d = $M4NonThreadedD, h = 3.6, center = true);
    translate([-(2 * 48 / 3), 0, 0])
      cylinder(d = $M4NonThreadedD, h = 3.6, center = true);

    //Front bearing
    translate([0, -length, 0])
      cylinder(d = $FlangeBearingDiameter, h = 3.6, center = true);
    for (i = [0:$SupportHoleCount])
    {
      translate([0, -$SupportHoleSpacing * i, 0])
        cylinder(d = $M3NonThreadedD, h = 3.6, center = true);
    }
  }
}

module PixelConveyor(conveyorwidth, conveyorlength, upperlower)
{
  bandcount = 12;
  bandspacing = (conveyorwidth - 30) / (bandcount - 1);//Leave 15mm at each side
  
  upperlowertranslatez = upperlower ? 48 : 0;
  plateoffset          = upperlower ? 0 : 3;
  upperangleadjust     = upperlower ? 3 : 0;
  
  echo("Conveyor roller width", conveyorwidth);
  rotate(-$PixelConveyorAngle + upperangleadjust, [1, 0, 0])
  {
    translate([0, 0, upperlowertranslatez])
    {
      color("AliceBlue")
      {
        rotate(90, [0, 1, 0])
        {
          //Top drive roller
          cylinder(d = 20, h = conveyorwidth, center = true);
          //Side plates
          translate([0, 0, (conveyorwidth / 2) + plateoffset])
              PixelConveyorArm(UpperLower = upperlower, length = conveyorlength);
          translate([0, 0, -(conveyorwidth / 2) - plateoffset])
              PixelConveyorArm(UpperLower = upperlower, length = conveyorlength);
          //Bottom intake roller
         translate([0, -conveyorlength, 0])
            cylinder(d = 20, h = conveyorwidth, center = true);
        }
      }
      color("Goldenrod")
      //Move to leading roller center
      if (RobotShowConveyorBands)
      {
        translate([0, -conveyorlength, 0])
        {
          rotate(-90, [1, 0, 0])
          {
            //Move to outer edge of roller so rotation rotates about the roller
            translate([0, 11, 0])
              for (i = [0 : (bandcount / 2) - 1])
              {
                translate([(bandspacing / 2) + (bandspacing * i), 0, 0])
                  cylinder(d = 3, h = 355);
                translate([-(bandspacing / 2) - (bandspacing * i), 0, 0])
                  cylinder(d = 3, h = 355);
              }
            //Move to outer edge of roller so rotation rotates about the roller
            translate([0, -11, 0])
              for (i = [0 : (bandcount / 2) - 1])
              {
                translate([(bandspacing / 2) + (bandspacing * i), 0, 0])
                  cylinder(d = 3, h = conveyorlength);
                translate([-(bandspacing / 2) - (bandspacing * i), 0, 0])
                  cylinder(d = 3, h = conveyorlength);
              }
          }
        }
      }
    }
  }
}

module FullRobotV2(supportspacing, offset, stages, width)
{
  if (RobotShowDrivebase)
    rotate(90, [0, 0, 1])
      DriveBase(FrontOffset = 6, HHoles = 9, FrontOrientation = 0, BackOrientation = 0);
  translate([0, -20, 0])
    PixelFloorPickerO2(supportspacing, SliderPosition, offset, stages, width);
  if (RobotShowDroneLauncher)
    translate([143.7, 90, 330])
      rotate(50, [1, 0, 0])
        rotate(-90, [0, 0, 1])
          DroneLauncher();
}

module PixelFloorPickerO2HopperArm(position, offset, stages, width, motorposition, channelholes, offsetholes, dopulleyguide, spindleoffset = 24 + 4 + 16, mechtype)
{
  //Linear rail
  translate([0, -10, 80])
    rotate(-30, [1, 0, 0])
      {
        MisumiRailSet(support1 = true, length = 300, stages = stages, position = position, offset = offset, width = width, dopulleyguide = dopulleyguide);
        //Motor mount
        if (motorposition != -1)
        {
          translate([-35, -9, motorposition])
            rotate(180, [1, 0,0])
            {
              MotorAndFrame(ChannelHoles = channelholes, Rx = -1, Ry = 0, Rz = -1, OffsetHoles = offsetholes);
              if (mechtype == 1)//Lifter pulley
              {
                translate([spindleoffset, 0, -24])
                  rotate(90, [0, 1, 0])
                  {
                    LifterSpindle(style = RobotLifterSpindleStyle);
                    translate([0, 0, -spindleoffset - 28])
                      cylinder(d = 8, h = spindleoffset + 28, $fn = 6);
                  }
              }
              else if (mechtype == 2)//Conveyor type A
              {
                translate([spindleoffset, 0, -24])
                  rotate(90, [0, 1, 0])
                  {
                    cylinder(d = 48, h = 5, center = true);
                    translate([10, 48, 0])
                    cylinder(d = 48, h = 5, center = true);
                  }
              }
            }
        }
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
 
module MisumiSlideRail(length = 300)
{
  difference()
  {
    translate([-10, 0, 0])
      cube([20, 7.2, length]);
    translate([-8, 2.01, -0.5])
      cube([16, 5.2, length + 1]);
    rotate(-90, [1, 0, 0])
    {
      translate([0, -15, -0.1])
        cylinder(d = 3.1, h = 10);
      translate([0, -length + 15, -0.1])
        cylinder(d = 3.1, h = 10);
      translate([0, -length / 2, -0.1])
        cylinder(d = 3.1, h = 10);
    }
  }
}
 
module Extrusion15mm(length = 300)
{
  color([0.95, 0.9, 0.95])
    translate([0, 0, length / 2])
      cube([15, 15, length], center = true);
  color([.8, .8, .8])
  {
    translate([0, 0, length / 2])
      cube([3.001, 15.001, length + 0.001], center = true);
    translate([0, 0, length / 2])
      cube([15.001, 3.001, length + 0.001], center = true);
  }
}
 
module MisumiSlide(length, position, showupper = true, showlower = true, pulleyextension, showpulley = true, offset, width)
{
  color("silver")
  {
    MisumiSlideRail(length = length);
    translate([0, 16, position])
      mirror([0, 1, 0])
        MisumiSlideRail(length = length);
  }
  color("darkgray")
    translate([-8, 2, position / 2])
      cube([16, 12, length]);   
  //Upper pulley
  if (showupper)
    translate([10, -15/2, length - 0])
      MisumiPulleyPlate(showpulley = true, holespacing = 8, extension = 0, offset = offset, width = width);
  //Lower pulley
  if (showlower)
    translate([10, (15/2) + 16, position + 0])
      rotate(180, [1, 0, 0])
        MisumiPulleyPlate(showpulley = showpulley, holespacing = 8, extension = pulleyextension, offset = offset, width = width);
}
 
module MisumiPulleyReturnPlate(showpulley, holespacing, extension, voffset, width, style)
{
  if (style == 1)
  {
    difference()
    {
      union()
      {
        hull()
        {
          translate([0, extension, 0])
            rotate(90, [0, 1, 0])
              cylinder(d = width, h = 3);
            rotate(90, [0, 1, 0])
              cylinder(d = width, h = 3);
   
        }
        hull()
        {
          rotate(90, [0, 1, 0])
            cylinder(d = width, h = 3);
          translate([0, 0, holespacing + voffset])
            rotate(90, [0, 1, 0])
              cylinder(d = width, h = 3);
        }
      }
      translate([-0.1, extension, 0])
        rotate(90, [0, 1, 0])
          cylinder(d = $M4NonThreadedD, h = 4);
      translate([-0.1, 0, voffset])
        rotate(90, [0, 1, 0])
          cylinder(d = $M3NonThreadedD, h = 4);
      translate([-0.1, 0, holespacing + voffset])
        rotate(90, [0, 1, 0])
          cylinder(d = $M3NonThreadedD, h = 4);
      translate([-0.1, 0, 0])
        rotate(90, [0, 1, 0])
          cylinder(d = $M4NonThreadedD, h = 4);
    }
    if (showpulley)
    {
      translate([3.5, extension, 0])
        rotate(90, [0, 1, 0])
          cylinder(d = 12, h = 4);
      translate([3.5, 0, 0])
        rotate(90, [0, 1, 0])
          cylinder(d = 12, h = 4);
    }
  }
  else
  {
    difference()
    {
      union()
      {
        //Extrusion attach section
        hull()
        {
          //First, upper point
          translate([0, 0, holespacing + voffset - 23 + 16])
            rotate(90, [0, 1, 0])
              cylinder(d = width, h = 3);
          //Second, corner point
          translate([0, 0, holespacing + voffset - 23])
            rotate(90, [0, 1, 0])
              cylinder(d = width, h = 3);
        }
        //Lower curve section part 1
        hull()
        {
          //Second, corner point
          translate([0, 0, holespacing + voffset - 23])
            rotate(90, [0, 1, 0])
              cylinder(d = width, h = 3);
          //Third, corner point
          translate([0, 10, 0])
            rotate(90, [0, 1, 0])
              cylinder(d = width, h = 3);
        }
        //Lower curve section part 2
        hull()
        {
          //Third, corner point
          translate([0, 10, 0])
            rotate(90, [0, 1, 0])
              cylinder(d = width, h = 3);
          //Fourth, final corner point
          translate([0, 30, 0])
            rotate(90, [0, 1, 0])
              cylinder(d = width, h = 3);
        }
        //Return pulley section
        hull()
        {
          //Fourth, final corner point
          translate([0, 30, 0])
            rotate(90, [0, 1, 0])
              cylinder(d = width, h = 3);
          //Final pulley point
          translate([0, extension, 15])
            rotate(90, [0, 1, 0])
              cylinder(d = width, h = 3);
        }
      }
      
      //Extrusion mount holes
      //First, upper point
      translate([-0.1, 0, holespacing + voffset - 23 + 16])
        rotate(90, [0, 1, 0])
          cylinder(d = $M3NonThreadedD, h = 4);
      //Second, corner point
      translate([-0.1, 0, holespacing + voffset - 23])
        rotate(90, [0, 1, 0])
          cylinder(d = $M3NonThreadedD, h = 4);
      
      //Drive pulley mount hole
      //Third, corner point
      translate([-0.1, 10, 0])
        rotate(90, [0, 1, 0])
          cylinder(d = $M4NonThreadedD, h = 4);
      
      //Final pulley point
      translate([-0.1, extension, 15])
        rotate(90, [0, 1, 0])
          cylinder(d = $M4NonThreadedD, h = 4);
    }
    
    if (showpulley)
    {
      translate([3.5, 10, 0])
        rotate(90, [0, 1, 0])
          cylinder(d = 12, h = 4);
      translate([3.5, extension, 15])
        rotate(90, [0, 1, 0])
          cylinder(d = 12, h = 4);
    }
  }
  
}

module Linkage(spacing, width, thickness, holed)
{
  rotate(90, [0, 0, 1])
    rotate(90, [1, 0, 0])
      difference()
      {
        hull()
        {
          cylinder(d = width, h = thickness, center = true);
          translate([spacing, 0, 0])
            cylinder(d = width, h = thickness, center = true);
        }
        cylinder(d = holed, h = thickness + 1, center = true);
        translate([spacing, 0, 0])
          cylinder(d = holed, h = thickness + 1, center = true);
      }
}

module MisumiPulleyPlateSpacer(holespacing, width, count)
{
  difference()
  {
    hull()
    {
      rotate(90, [0, 1, 0])
        cylinder(d = width, h = 3);
      translate([0, 0, - holespacing * (count - 1)])
        rotate(90, [0, 1, 0])
          cylinder(d = width, h = 3);
    }
    for (i = [0 : count - 1])
    {
      translate([-0.1, 0, - holespacing * i])
        rotate(90, [0, 1, 0])
          cylinder(d = $M3NonThreadedD, h = 4);
    }
  }
}
 
module MisumiPulleyPlate(showpulley, holespacing, extension, offset, width)
{
  hoffset = 10.5;
  voffset = 6 + offset;
 
  difference()
  {
    union()
    {
      hull()
      {
        translate([0, hoffset + extension, extension])
          rotate(90, [0, 1, 0])
            cylinder(d = width, h = 3);
        translate([0, 0, - voffset])
          rotate(90, [0, 1, 0])
            cylinder(d = width, h = 3);
 
      }
      hull()
      {
        translate([0, 0, - voffset])
          rotate(90, [0, 1, 0])
            cylinder(d = width, h = 3);
        translate([0, 0, -holespacing - voffset])
          rotate(90, [0, 1, 0])
            cylinder(d = width, h = 3);
     }
    }
    //Holes 
    //Pulley
    translate([-0.1, hoffset + extension, extension])
      rotate(90, [0, 1, 0])
        cylinder(d = $M4NonThreadedD, h = 4);
    translate([-0.1, 0, -holespacing - voffset])
      rotate(90, [0, 1, 0])
        cylinder(d = $M3NonThreadedD, h = 4);
    translate([-0.1, 0, -voffset])
      rotate(90, [0, 1, 0])
        cylinder(d = $M3NonThreadedD, h = 4);
  }
  if (showpulley)
    translate([3.5, hoffset + extension, extension])
      rotate(90, [0, 1, 0])
        cylinder(d = 12, h = 4);
}
 
module MisumiRailSet(support1 = true, length = 300, stages = 2, position = 100, returnstyle = 0, offset = 0, width, dopulleyguide)
{
  hoffset = support1 ? 15 : 0;
  //Return style 0 = Return cord lines up with edge of outer slide
  //Return style 1 = Return cord lines up with pull up pulley
  returnextension = (returnstyle == 0) ? ((15/2) + (stages * 16) + (hoffset * (stages - 1)) - 3) :
                                         ((15/2) + (stages * 16) + (hoffset * (stages - 1)) - 13);
 
  for (i = [0:(stages - 1)])
  {
    translate([0, (i * (16 + 15)) + hoffset - 15, (i * offset * 2) + (i * (position / stages))])
    {
      if (!(!support1 && (i == 0)))
        translate([0, (15/2), 0])
          Extrusion15mm(length = length);
      if (i == stages - 1)
        translate([0, 15 , offset])
          MisumiSlide(length = length, position = (position / stages), showupper = true, showlower = true, pulleyextension = 5, showpulley = true, offset = offset, width = width);
      else
        translate([0, 15 , offset])
          MisumiSlide(length = length, position = (position / stages), showupper = true, showlower = true, pulleyextension = 0, showpulley = true, offset = offset, width = width);
    }
  }
  //Pulley return plate
  translate([10, (15/2), -12 + offset])
    MisumiPulleyReturnPlate(showpulley = true, extension = returnextension, holespacing = 16, voffset = 15, width = width, style = ReturnPulleyStyle);
  
  if (dopulleyguide)
  {
    translate([10, 15/2, 185])
      rotate(90, [1, 0, 0])
        SlidePulleyGuide(width);
  }
  
}
 
module MisumiPulleyCouplerPlate()
{
  rotate(90, [0, 1, 0])
    difference()
    {
      hull()
      {
        translate([4, 0, 0])
          cylinder(d = 15, h = 3);
        translate([-4, 0, 0])
          cylinder(d = 15, h = 3);
        translate([0, -15, 0])
          cylinder(d = 22, h = 3);
      }
      translate([0, 0, -.1])
        cylinder(d = 3, h = 4);
      translate([8, 0, -.1])
        cylinder(d = 3, h = 4);
      translate([-8, 0, -.1])
        cylinder(d = 3, h = 4);
      translate([0, -15, -.1])
        cylinder(d = 14, h = 4);
    }
}
 
module MisumiPulleyMotorMountPlate()
{
  rotate(90, [0, 1, 0])
    difference()
    {
      hull()
      {
        translate([14, 0, 0])
          cylinder(d = 15, h = 3);
        translate([-14, 0, 0])
          cylinder(d = 15, h = 3);
        translate([0, -29, 0])
          cylinder(d = 40, h = 3);
      }
      //Channel mount holes
      translate([0, 0, -.1])
        cylinder(d = 3, h = 4);
      translate([8, 0, -.1])
        cylinder(d = 3, h = 4);
      translate([-8, 0, -.1])
        cylinder(d = 3, h = 4);
      translate([16, 0, -.1])
        cylinder(d = 3, h = 4);
      translate([-16, 0, -.1])
        cylinder(d = 3, h = 4);
      //Motor shaft hole
      translate([0, -29, -.1])
        cylinder(d = 9, h = 4);
      //Motor mount holes
      translate([0, -29 + 8, -.1])
        cylinder(d = 4, h = 4);
      translate([0, -29 - 8, -.1])
        cylinder(d = 4, h = 4);
      translate([8, -29, -.1])
        cylinder(d = 4, h = 4);
      translate([-8, -29, -.1])
        cylinder(d = 4, h = 4);
     
    }
}
 
module CreatePlate(show, stages, returnstyle = 0, offset, width)
{
  vspacing = 45;
  hoffset = 15;
  returnextension = (returnstyle == 0) ? ((15/2) + (stages * 16) + (hoffset * (stages - 1)) - 3) :
                                         ((15/2) + (stages * 16) + (hoffset * (stages - 1)) - 13);

  echo ("Show ", show);
  projection(cut = false)
  {
    rotate(90, [0, 1, 0])
    {
      //Return pulley plate
      if (show == 1)
        MisumiPulleyReturnPlate(showpulley = false, extension = returnextension, holespacing = 16, voffset = 15, width = width, style = ReturnPulleyStyle);
      //Regular pulley plate
      else if (show == 2)
        MisumiPulleyPlate(showpulley = false, holespacing = 8, extension = 0, offset = offset, width = width);
      //Final 'last' plate that is ties to the carriage and not via a pulley
      else if (show == 3)
        MisumiPulleyPlate(showpulley = false, holespacing = 8, extension = 5, offset = offset, width = width);
      //Coupler plate : Not used
      else if (show == 4)
          MisumiPulleyCouplerPlate();
      //Motor mount plate : Not used
      else if (show == 5)
        MisumiPulleyMotorMountPlate();
      //8mm centered double spacer
      else if (show == 6)
        MisumiPulleyPlateSpacer(holespacing = 8, width = width, count = 2);
      //16mm centered double spacer
      else if (show == 7)
        MisumiPulleyPlateSpacer(holespacing = 16, width = width, count = 2);
      //8mm centered motor mount spacer and slider pulley guide mount spacer
      else if (show == 8)
        MisumiPulleyPlateSpacer(holespacing = 8, width = width, count = 5);
      //8mm centered coupler mount spacer : Not used
      else if (show == 9)
        MisumiPulleyPlateSpacer(holespacing = 8, width = width, count = 3);
      else if (show == 10)
        SlidePulleyGuide(width = width);
    }
  if (show == 11)
    RailSupportPlate();
  if (show == 15)
    PixelConveyorArm(UpperLower = 1, length = $FrontRollerDistanceUpper);
  else if (show == 16)
    PixelConveyorArm(UpperLower = 0, length = $FrontRollerDistanceLower);
  }
}

module CChannelTRail(Holes)
{
  CChannel(Holes = Holes, Depth = 12, Rx = -1, Ry = -1);
  translate([-12.5, 0, -5])
    cube([10, (Holes + 1)*24, 10]);
}

module CChannelCentered(Holes, Depth, Rx = 0, Ry = 0, Rz = 0, DoSlots = $ChannelDoSlots, DoCorners = $ChannelDoCorners, DoCenter = $ChannelDoCenter)//Depth = 48 or 12
{
  $Length = (Holes + 1) * 24;
  rotate(90, [Rx, 0, 0])
  rotate(90, [0, Ry, 0])
  rotate(90, [0, 0, Rz])
  translate([0, 0, -Depth / 2])
    difference()
    {
      translate([0, -24, 0])
        cube([$Length, 48, Depth]);
      translate([-1, -21.5, 2.5])
        cube([$Length + 2, 43, Depth]);

      translate([(Depth / 2), 0, -0.5])
        CChannelHolesLength($Depth = 5, HoleCount = Holes, $DoSlots = DoSlots, $DoCorners = DoCorners, $DoCenter = DoCenter);
      translate([(Depth / 2), (Depth / 2) + 0.5, (Depth / 2)])
        rotate(90, [1, 0, 0])
          CChannelHolesLength($Depth = 50, HoleCount = Holes, $DoSlots = DoSlots, $DoCorners = DoCorners, $DoCenter = DoCenter);
    
    }
}

module CChannel(Holes, Depth, Rx = 0, Ry = 0, Rz = 0, DoSlots = $ChannelDoSlots, DoCorners = $ChannelDoCorners, DoCenter = $ChannelDoCenter)//Depth = 48 or 12
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
        
      translate([(Depth / 2), 0, -0.5])
        CChannelHolesLength($Depth = 5, HoleCount = Holes, $DoSlots = DoSlots, $DoCorners = DoCorners, $DoCenter = DoCenter);
      translate([(Depth / 2), (Depth / 2) + 0.5, (Depth / 2)])
        rotate(90, [1, 0, 0])
          CChannelHolesLength($Depth = 50, HoleCount = Holes, $DoSlots = DoSlots, $DoCorners = DoCorners, $DoCenter = DoCenter);      
    }
}
 
module MotorAndFrame(ChannelHoles, Rx, Ry, Rz, OffsetHoles = 0)
{
  //Motor
  cylinder(d = 36, h = 117);
  //Motor shaft
  translate([0, 0, -20])
    color("silver")
      cylinder(d = 8, h = 20, $fn = 6);
  if (ChannelHoles > 0)
  {
    translate([0, 0, - (24 * OffsetHoles)])
      CChannelCentered(Holes = ChannelHoles, Depth = 48, Rx = Rx, Ry = Ry, Rz = Rz);
  }
}

module MecanumWheel(ShaftD = 8, MotorOrientation = 0, Mirror = 0, ChannelHoles = 0)
{
  mirror([0, Mirror, 0])
  {
    //Wheel
    rotate(90, [1, 0, 0])
    {
      //Base
      color("DarkRed")
        cylinder(d = 96, h = 38, center = true);
      //Shaft
      color("Black")
        translate([0, 0, 25])
          cylinder(d = ShaftD, h = 88, center = true);
    }
    //Motor
    rotate(90, [0, MotorOrientation, 0])
      translate([0, -44, 24])
        MotorAndFrame(ChannelHoles, Rx = -1, Ry = 1, Rz = -1);
  }  
}

module DriveBase(FrontOffset = 0, BackOffset = 0, HHoles = 7, VHoles = 17, FrontOrientation = 0, BackOrientation = 0)
{
  translate([-(VHoles * 12) - 12, -(HHoles * 12) - 36, 24 + 48])
  {
    //Left channel
    rotate(180, [1, 0, 0])
      CChannel(Holes = VHoles, Depth = 48);
    //Right channel
    translate([0, 48 + ((HHoles + 1) * 24), 0])
      rotate(180, [1, 0, 0])
        CChannel(Holes = VHoles, Depth = 48);
    //Front channel
    translate([24 + (FrontOffset * 24), 24, 0])
      rotate(180, [1, 0, 0])
        CChannel(Holes = HHoles, Depth = 48, Rz = -1);
    //Back channel
    translate([((VHoles - BackOffset) * 24), 24, 0])
      rotate(180, [1, 0, 0])
        CChannel(Holes = HHoles, Depth = 48, Rz = -1);
    //Wheels, left
    translate([48, -(48 + 40) / 2, -24])
      MecanumWheel(MotorOrientation = FrontOrientation, Mirror = 1, ChannelHoles = 0);
    translate([((VHoles - 1) * 24), -(48 + 40) / 2, -24])
      MecanumWheel(MotorOrientation = BackOrientation, Mirror = 1, ChannelHoles = 10);
    //Wheels, right
    translate([48,((HHoles + 3) * 24) + (48 + 40) / 2, -24])
    {
      MecanumWheel(MotorOrientation = FrontOrientation, ChannelHoles = 0);
    }
    translate([((VHoles - 1) * 24), ((HHoles + 3) * 24) + (48 + 40) / 2, -24])
      MecanumWheel(MotorOrientation = BackOrientation, ChannelHoles = 10);
  }
}

module DualHopperGate()
{
  //Lower gate
  translate([17, 0, -90 + 2])
    cube([hopperlowerwidth, hoppersinglewidth, 3], center = true);
  //Gate lower support
  hull()
  {
    //Top center
    translate([0, 0, -70])
      cube([3, 4, 4], center = true);
    //Left lower
    translate([5.5, (hoppersinglewidth - 4) / 2, -90 + 2.5])
      cube([3, 4, 4], center = true);
    //right lower
    translate([5.5, -(hoppersinglewidth - 4) / 2, -90 + 2.5])
      cube([3, 4, 4], center = true);
  }
  //Gate servo attach
  difference()
  {
    hull()
    {
      //Aligned with servo shaft
      translate([-7.3, 0, -49.6])
        rotate(90, [1, 0, 0])
          cylinder(d = 15, h = 7, center = true);
      //Attach to gate lower support
      translate([4, 0, -85])
        rotate(90, [1, 0, 0])
          cylinder(d = 4, h = 7, center = true);
    }
    //Serve attach hole
    //Screw hole
    translate([-7.3, 0, -49.6])
      rotate(90, [1, 0, 0])
        cylinder(d = 3, h = 9, center = true);
    //Shaft grip
    translate([-7.3, -((7 - 4) / 2) - .5, -49.6])
      rotate(90, [1, 0, 0])
        cylinder(d = 5.9, h = 4, center = true);
  }
}

module BoundingBox()
{
  color([0.9, 0.9, 0.9, 0.3])
    translate([-9 * $Inch2mm, -9 * $Inch2mm, 0])
      cube([18 * $Inch2mm, 18 * $Inch2mm, 13.7 * $Inch2mm]);
}

module HopperBaseMount(showservo)
{  
    //Base plate
    difference()
    {
      cube([hopperbaseplatewidth, hopperbaseplatethickness, hopperbaseplateheight], center = true);
      //Slider mount holes
      {
        translate([($DrivebaseInnerSpacing / 2) - 10, 0, (hopperbaseplateheight / 2) - 16])
        {
          rotate(90, [1, 0, 0])
          {
            hull()
            {
              translate([-2, 0, 0])
                cylinder(d = $M3NonThreadedD, h = 20, center = true);
              translate([0, 0, 0])
                cylinder(d = $M3NonThreadedD, h = 20, center = true);
            }
            translate([0, -135, 0])//Spacing of misumi mount holes
              hull()
              {
                translate([-2, 0, 0])
                  cylinder(d = $M3NonThreadedD, h = 20, center = true);
                translate([0, 0, 0])
                  cylinder(d = $M3NonThreadedD, h = 20, center = true);
              }
          }
        }
        translate([-($DrivebaseInnerSpacing / 2) + 10, 0, (hopperbaseplateheight / 2) - 16])
        {
          rotate(90, [1, 0, 0])
          {
            hull()
            {
              translate([0, 0, 0])
                cylinder(d = $M3NonThreadedD, h = 20, center = true);
              translate([2, 0, 0])
                cylinder(d = $M3NonThreadedD, h = 20, center = true);
            }
            translate([0, -135, 0])//Spacing of misumi mount holes
              hull()
              {
                translate([0, 0, 0])
                  cylinder(d = $M3NonThreadedD, h = 20, center = true);
                translate([2, 0, 0])
                  cylinder(d = $M3NonThreadedD, h = 20, center = true);
              }
          }
        }
      }
      //Excess plate
      translate([0, -.1, -40])
        cube([hopperbaseplatewidth - 33, 10, 100], center = true);
    }
    //Far side upper pivot
    translate([-(DualHopperWidth / 2) - 6 - 7, 0, (hopperbaseplateheight / 2) - 28.2])
    {
      difference()
      {
        cube([6, 20, 16]);
        translate([0, 15, 8])
          rotate(90, [0, 1, 0])
            cylinder(d = $M4NonThreadedD, h = 20, center = true);
      }    
    }
    //Far side lower pivot
    translate([-((DualHopperWidth / 2) + 6 + 7), 0, (hopperbaseplateheight / 2) - 28.2 - hopperlinkagebasespacing])
    {
      difference()
      {
        cube([6, 20, 16]);
        translate([0, 15, 8])
          rotate(90, [0, 1, 0])
            cylinder(d = $M4NonThreadedD, h = 20, center = true);
      }    
    }
    //Servo side lower pivot
    translate([((DualHopperWidth / 2) + 7), 0, (hopperbaseplateheight / 2) - 28.2 - hopperlinkagebasespacing])
    {
      difference()
      {
        cube([6, 20, 16]);
        translate([0, 15, 8])
          rotate(90, [0, 1, 0])
            cylinder(d = $M4NonThreadedD, h = 20, center = true);
      }    
    }
    translate([(DualHopperWidth / 2) - 19, 10, (hopperbaseplateheight / 2) - 54])
      rotate(-90, [0, 0, 1])
        ServoMountPillarSet();
    
    if (showservo)
      color("purple")
    translate([(DualHopperWidth / 2) - 3, 15, (hopperbaseplateheight / 2) - 30])

          rotate(90, [0, 1, 0])
            import("GoBildaServoLoRes.stl");
  
}

module HoleSet(D, XCount, YCount, XSpacing, YSpacing, H = 4)
{
  XOffset = -((XCount - 1) * XSpacing)/ 2;
  rotate(90, [0, 0, 1])
  {
    for (x = [0:XCount - 1])
    {
      translate([XOffset + (x * XSpacing), 0, 0])
        for (y = [0:YCount - 1])
        {
          translate([0, y * YSpacing, 0])
            cylinder(d = D, h = H);
        }
    }
  }
}

module RailSupportPlate()
{
  width = 184;
  height = 109;
  rounding = 15;
  pointwidth = width - rounding;
  pointheight = height - rounding;
  anglecorrection = pointheight * tan(30);
  echo (anglecorrection);
  
  difference()
  {
    translate([-rounding / 2, rounding / 2, 0])
    {
      hull()
      {
        cylinder(d = rounding, h = 3.3);
        translate([0, pointwidth, 0])
          cylinder(d = rounding, h = 3.3);
        translate([-pointheight, pointwidth, 0])
          cylinder(d = rounding, h = 3.3);
        translate([-pointheight, anglecorrection, 0])
          cylinder(d = rounding, h = 3.3);
      }
    }
    //Main support mount holes
    translate([-20, width - 24, -1])
      HoleSet(D = 4, XCount = 2, YCount = 4, XSpacing = 32, YSpacing = 24, H = 10);
    //Main support mount holes, offset
    translate([-20 + 12, width - 24, -1])
      HoleSet(D = 4, XCount = 2, YCount = 5, XSpacing = 32, YSpacing = 24, H = 10);
    //Slide support mount holes
    rotate(-30, [0, 0, 1])
      translate([-26, 24 - (rounding / 2), -1])
        HoleSet(D = 4, XCount = 2, YCount = 5, XSpacing = 32, YSpacing = 24, H = 10);
    //Main support bearing CLEARANCE holes
    translate([-8 - 12, width - 24, -1])
      HoleSet(D = $FlangeBearingClearance, XCount = 1, YCount = 4, XSpacing = 32, YSpacing = 24, H = 10);
    //Slide support bearing holes
    rotate(-30, [0, 0, 1])
      translate([-14 - 12, 24 - (rounding / 2), -1])
        HoleSet(D = $FlangeBearingClearance, XCount = 1, YCount = 6, XSpacing = 32, YSpacing = 24, H = 10);

  }
}

module SlidePulleyGuide(width)
{
  height = 10;
  rotate(90, [0, 1, 0])
  {
    difference()
    {
      hull()
      {
        translate([0, -16, 0])
          cylinder(d = width, h = 3);
        translate([0, 16, 0])
          cylinder(d = width, h = 3);
        translate([-height, -16, 0])
          cylinder(d = width, h = 3);
        translate([-height, 16, 0])
          cylinder(d = width, h = 3);
      }
      //Mount holes
      translate([0, -16, 0])
        cylinder(d = 3, h = 5);
      translate([0, 16, 0])
        cylinder(d = 3, h = 5);
      translate([0, -8, 0])
        cylinder(d = 3, h = 5);
      translate([0, 8, 0])
        cylinder(d = 3, h = 5);
      cylinder(d = 3, h = 5);
      //Bearing holes
      translate([-height, -16, 0])
        cylinder(d = 4, h = 5);
      translate([-height, 16, 0])
        cylinder(d = 4, h = 5);
      //Cutaway
      hull()
      {
        translate([-18, 0, 0])
          cylinder(d = 22, h = 5);
        translate([-25, 0, 0])
          cylinder(d = 22, h = 5);
      }
    }
  }
}

module HopperAndArms()
{
  uppertrianglebase = sqrt((hopperlinkagebasespacing * hopperlinkagebasespacing) + (hopperlinkagetoplength * hopperlinkagetoplength) - (2 * hopperlinkagebasespacing* hopperlinkagetoplength * cos(90 + HopperArmAngle)));
  upperpartialangle = asin(hopperlinkagebasespacing * sin(90 + HopperArmAngle) / uppertrianglebase);
  upperpartialangle2 = 180 - 90 - HopperArmAngle - upperpartialangle;
  lowerpartialangle = acos(((uppertrianglebase * uppertrianglebase) + (hopperlinkagehopperspacing * hopperlinkagehopperspacing) - (hopperlinkagebottomlength * hopperlinkagebottomlength)) / (2 * uppertrianglebase * hopperlinkagehopperspacing));
  lowerpartialangle2 = asin((sin(lowerpartialangle) * hopperlinkagehopperspacing)/ hopperlinkagebottomlength);
  hoppertipangle = HopperArmAngle - 90 + upperpartialangle + lowerpartialangle;
  
  translate([(DualHopperWidth / 2) + 3, hopperrotationxoffset, hopperrotationyoffset - hopperlinkagebasespacing])
  {
      rotate(90 - upperpartialangle2 - lowerpartialangle2, [1, 0, 0])
        Linkage(spacing = hopperlinkagebottomlength, width = 10, thickness = 6, holed = 4.2);
  }
  translate([-((DualHopperWidth / 2) + 3), hopperrotationxoffset, hopperrotationyoffset - hopperlinkagebasespacing])
  {
      rotate(90 - upperpartialangle2 - lowerpartialangle2, [1, 0, 0])
        Linkage(spacing = hopperlinkagebottomlength, width = 10, thickness = 6, holed = 4.2);
  }
  
  translate([(DualHopperWidth / 2) + 3, hopperrotationxoffset, hopperrotationyoffset])
  {
    rotate(HopperArmAngle, [1, 0, 0])
    {
      Linkage(spacing = hopperlinkagetoplength, width = 10, thickness = 6, holed = 4.2);
      translate([-(DualHopperWidth / 2) - 3, hopperlinkagetoplength, 0])
      {
        rotate(-90 + upperpartialangle + lowerpartialangle, [1, 0, 0])
        {
          DualHopperBin(showservo = true);
          rotate(90, [0, 0, 1])
            color("DeepSkyBlue")
              translate([-20, 0, 4])
              DualHopperGate();
        }
      }
    }
  }
  translate([-((DualHopperWidth / 2) + 3), hopperrotationxoffset, hopperrotationyoffset])
  {
    rotate(HopperArmAngle, [1, 0, 0])
    {
      Linkage(spacing = hopperlinkagetoplength, width = 10, thickness = 6, holed = 4.2);
    }
  }
}

module PixelFunnelSideSupport()
{
  difference()
  {
    union()
    {
      hull()
      {
        translate([0, 19.5 - 5, -1.5])
          cube([3, 44, .1], center = true);
        translate([0, 10 - 5, 60])
          cube([3, 25, .1], center = true);
      }
        //Back plate attach
        hull()
        {
          translate([0, 0, 30])
            cube([3, 15, .1], center = true);
          translate([0, 0, 50])
            cube([20, 15, .1], center = true);
          translate([0, 0, 72])
            cube([20, 15, .1], center = true);
        }
      }
    //Mount hole
    translate([0, 0, 65])
      rotate(90, [1, 0, 0])
        cylinder(d = 4.5, h = 30, center = true);
    //Back plate slot
    translate([0, 0, 70])
      cube([30, 6, 40], center = true);
  }
}

module HopperPixelFunnel()
{
  FunnelWidth = 175;
  FunnelLength = 85;
  
  translate([0, 0, -40])
  {
    //Main ramp
    translate([0, -5, 0])
      difference()
      {
        cube([FunnelWidth, FunnelLength, 3], center = true);
        translate([(FunnelWidth - 10) / 2, -(FunnelLength - 30) / 2, 0])
          cube([10, 30, 5], center = true);
        translate([-(FunnelWidth - 10) / 2, -(FunnelLength - 30) / 2, 0])
          cube([10, 30, 5], center = true);
      }
    //Side supports
    //Slider side
    translate([((FunnelWidth + 3)/ 2), 0, 0])
    {
      difference()
      {
        PixelFunnelSideSupport();
        //Servo clearance
        translate([-20, 0, 58])
          cube([40, 40, 40]);
      }
    }
    //Conveyor side
    translate([(-(FunnelWidth + 3)/ 2), 0, 0])
    {
      PixelFunnelSideSupport();
    }
  }
}

module HopperSubsystem()
{
  HopperBaseMount(showservo = true);
  HopperPixelFunnel();
  HopperAndArms();
}

module FishboneGear(Teeth, Depth, Hub, ShaftShape = 1, ShaftD = $HexShaft8mmDSnug)
{
  PixelFloorPickerO1DriveGearFixHub(Depth = Depth,ShaftD = ShaftD, ShaftShape = ShaftShape, DoGub = true, GrubNut = 0, Hub = Hub)
    pfeilrad (modul=1, zahnzahl=Teeth, breite=$PixelFloorPickerO1DriveGearThickness, bohrung=10, eingriffswinkel=20, schraegungswinkel=30, optimiert=false);
}


module LifterSpindle(style = 0)
{
  SpindleHeight = 18;
  SpacerHeight = 16;
  
  if (style == 1)
    FTCLifterSpindle($SpindleDiameter = 30, $SpindleLength = 25, $SpindleType = 1, $ShaftType = 1, $ShaftDiameter = $HexShaft8mmDSnug, Splitter = true);
  else if (style == 2)   
    SpindleCore(InnerD = 26, OuterD = 40, Height = SpindleHeight, RimHeight = .2, SlopeSpan = 1.8, ShaftD = $HexShaft8mmDSnug, ShaftFaces = 6, ThreadD = 3, Center = LifterSpindleCenter, Cord = LifterSpindleCord);
  else if (style == 3)
  {
    SpindleCore(InnerD = 20, OuterD = 30, Height = SpindleHeight, RimHeight = .2, SlopeSpan = 2.7, ShaftD = $HexShaft8mmDSnug, ShaftFaces = 6, ThreadD = 3, Center = LifterSpindleCenter, Cord = LifterSpindleCord);
    //Spacer
    rotate(180, [1, 0, 0])
      difference()
      {
        cylinder(d = 16, h = SpacerHeight);
        cylinder(d = $HexShaft8mmDSnug, h = SpacerHeight, $fn = 6);
        //Grub screw openings
        translate([0, 0, SpacerHeight / 2])
          rotate(90, [1, 0, 0])
            cylinder(d = $M3ThreadedD, h = 30, center = true);
      }
  }
}

module ConveyorTransferGear(type)
{
  if (type == 0)
    FishboneGear(Teeth = 24, Depth = 9, Hub = 15);//Conveyor drive gear, hex 8mm
  else if (type == 1)
  {    
    difference()
    {
      pfeilrad (modul=1, zahnzahl=24, breite=5, bohrung=8, eingriffswinkel=20, schraegungswinkel=30, optimiert=false);
      cylinder(d = 10, h = 3.8);
    }
  }
}

module Spacer(outer, inner, thickness, sides)
{
  difference()
  {
    cylinder(d = outer, h = thickness, center = true);
    cylinder(d = inner, h = thickness + 1, $fn = sides, center = true);
  }
}

module BoltCountersink(holed, headd, headh, sides)
{
  rotate(180, [1, 0, 0])
  {
    cylinder(d = holed, h = 30);
    cylinder(d = headd, h = headh, $fn = sides);
  }
}

module RevMount(orientation, dual)
{
  width  = orientation ? 145 : 105;
  height = orientation ? 105 : 145;
  hholeoffset  = orientation ? 128 / 2 : 88 / 2;
  vholeoffset  = orientation ? 88  / 2: 128 / 2;
  basesize = dual ? 72 : 41;
  baseoffset = dual ? 0 : (20.5 - 5);
  
  //Base
  translate([baseoffset, 0, 5])
  {
    difference()
    {
      cube([basesize, width, 10], center = true);
      for (i = [0:2])
      {
        translate([32 - baseoffset, i * 24, 10 - 4.9])
          BoltCountersink(holed = 4.5, headd = 7.5, headh = 4, sides = 20);
        translate([32 - baseoffset, -i * 24, 10 - 4.9])
          BoltCountersink(holed = 4.5, headd = 7.5, headh = 4, sides = 20);
        translate([-32 - baseoffset, i * 24, 10 - 4.9])
          BoltCountersink(holed = 4.5, headd = 7.5, headh = 4, sides = 20);
        translate([-32 - baseoffset, -i * 24, 10 - 4.9])
          BoltCountersink(holed = 4.5, headd = 7.5, headh = 4, sides = 20);
      }
    }
  }
  //Support
  translate([0, 0, (height/2) + 10])
  {
    difference()
    {
      cube([10, width, height], center = true);
      translate([0, 0, 1])
      rotate(90, [0, 1, 0])
      {
        translate([vholeoffset, hholeoffset, 0])
          cylinder(d = 4, h = 20, center = true);
        translate([vholeoffset, -hholeoffset, 0])
          cylinder(d = 4, h = 20, center = true);
        translate([-vholeoffset, hholeoffset, 0])
          cylinder(d = 4, h = 20, center = true);
        translate([-vholeoffset, -hholeoffset, 0])
          cylinder(d = 4, h = 20, center = true);
      }
    }
  }
}

module Hook()
{
  HookRotation = 30;
  Opening = 1.5 * $Inch2mm;
  Width = .6 * $Inch2mm;
  OuterD = Opening + Width + Width;
  HookCenterD = (Opening + Width) / 2;
  AttachLength = HookCenterD/tan(HookRotation);
  CordAttachOffset = AttachLength/cos(HookRotation);
 
  difference()
  {
    union()
    {
      //Main body
      cylinder(d = OuterD, h = 1 - 0.01, center = true);
      //Hook attach
      rotate(-HookRotation, [0, 0, 1])
        translate([HookCenterD, - (AttachLength / 2), 0])
          cube([Width, AttachLength, 1 - 0.01], center = true);
      //Vertical cord attach
      translate([0, -CordAttachOffset, 0])
        hull()
        {
          cylinder(d = Width, h = 1 - 0.01, center = true);
          translate([0, -16, 0])
            cylinder(d = Width, h = 1 - 0.01, center = true);
        }
    }
    //Bar clearance
    cylinder(d = Opening, h = 1, center = true);
    //Bar opening
    rotate(-HookRotation, [0, 0, 1])
      translate([0, - 50 / 2, 0])
        cube([Opening, 50, 1], center = true);
    //Bar catch slope
    translate([-(OuterD / 2), -(OuterD / 5), 0])
      rotate(-40, [0, 0, 1])
        translate([0, 0, 0])
          cube([OuterD / 2, OuterD / 2, 1], center = true);
 
    //Cord attach
    translate([0, -CordAttachOffset - 16, 0])
      cylinder(d = 3, h = 1, center = true);
  }
}

module ConveyorGuide()
{
  difference()
  {
    union()
    {
      rotate(90, [0, 1, 0])
        cylinder(d = $ConveyorGuideDiameter, h = $ConveyorGuideWidth, center = true);
      for (i = [0:5])
      {
        translate([(i + .5) * $ConveyorGuideSpacing, 0, 10])
          hull()
          {
            translate([0, (($ConveyorGuideDiameter - $ConveyorGuideThickness)/ 2), 0])
              cylinder(d= $ConveyorGuideThickness, h = 20, center = true);
            translate([0, -(($ConveyorGuideDiameter - $ConveyorGuideThickness)/ 2), 0])
              cylinder(d= $ConveyorGuideThickness, h = 20, center = true);
          }
        translate([(-i - .5) * $ConveyorGuideSpacing, 0, 10])
          hull()
          {
            translate([0, (($ConveyorGuideDiameter - $ConveyorGuideThickness)/ 2), 0])
              cylinder(d= $ConveyorGuideThickness, h = 20, center = true);
            translate([0, -(($ConveyorGuideDiameter - $ConveyorGuideThickness)/ 2), 0])
              cylinder(d= $ConveyorGuideThickness, h = 20, center = true);
          }
      }
    }
    rotate(90, [0, 1, 0])
      cylinder(d = $M3ThreadedD - .25, h = $ConveyorGuideWidth + 1, center = true);
  }
  
/*
  translate([0, 200, 0])
  rotate(90, [0, 1, 0])
  PixelConveyorArm(UpperLower = 0, length = $FrontRollerDistanceLower);
  */
}

module RollerFlipper()
{
  difference()
  {
    cylinder(d = 23.2, h = 3);
    cylinder(d = 20, h = 3);
  }
  for (i = [0:10])
  {
    rotate(i * (360/11), [0, 0, 1])
      translate([22 / 2, -1, 0])
        cube([5, 1.2, 3]);
  }
}

//PixelFloorPickerO1Subsystem1();

//PixelFloorPickerO1Subsystem2();

//Display items

//PlanetaryGearChecker();
//IconCap();
//CChannelInsert($NutHeight = 0, $Width = $ChannelInsertBlockWidth, $Height = $ChannelInsertBlockWidth);//Full width, full height
//CChannelInsert($NutHeight = 0, $Width = 20);//Narrow C-channel spacers
//CChannelInsert($NutHeight = 0, $Width = 20, $Height = $ChannelInsertBlockWidth, $Depth = 10);//Narrow C-channel spacers

//FTCLifterSpindle($SpindleDiameter = 20, $SpindleLength = 25, $SpindleType = 1, $ShaftType = 1, $ShaftDiameter = 6 + 0.4);

//PulleyGaurd();

//CamerMountLogitec();
//PrintCamerMountLogitec();

//FTCDriverHubModed();
//GolfBotClub();

//GolfBotClubAttatch();

//PixelFloorPickerO1Subsystem(mount = 1);
//PixelFloorPickerO1(mount = 1);
//PixelFloorPickerO1Lower(mount = 1);
//PixelFloorPickerO1Upper();
//?    PixelFloorPickerO1LowerPlate(m = 0);
//?    PixelFloorPickerO1LowerPlate(m = 1);

//OdometryPod();

//PixelFloorPickerO1 printables
//Drive gears
//PixelFloorPickerO1DriveGearTop();
//Bottom drive
//PixelFloorPickerO1DriveGearBottom();
//Motor drive, D shaft
//PixelFloorPickerO1DriveGearMotor(Render = 1);
//Motor drive, 8mm hex shaft
//PixelFloorPickerO1DriveGearMotor(Render = 4);
//Spacer
//PixelFloorPickerO1DriveGearMotor(Render = 2);

//Guide spacer and band guides
//PixelFloorPickerO1UpperGuideSection(channels = 7);
//Use the following for upper guides
//PixelFloorPickerO1BeltGuide(width = 94.5, length = $PixelFloorPickerO1BeltGuideWidth, channels = 6, mounts = 2, margin = 14);
//Use the following for Lower guides
//PixelFloorPickerO1BeltGuide(width = 105, length = $PixelFloorPickerO1BeltGuideWidth, channels = 7, mounts = 2, margin = 14);
//Guide spacer (allows using same guides for upper and lower carriages)
//PixelFloorPickerO1BeltGuide(width = $PlateThickness + .5, length = $PixelFloorPickerO1BeltGuideWidth, channels = 2, mounts = 2, margin = 14, holed = $M4NonThreadedD);
//Upper rail plates, short version
//PixelFloorPickerO1PlateDrive(m = 0, HullBounds = $PixelFloorPickerO1UpperHullLocationsDrive, Holes = $PixelFloorPickerO1UpperHoleLocations, Bearings = $PixelFloorPickerO1UpperBearingLocations);
//PixelFloorPickerO1Plate(m = 1, HullBounds = $PixelFloorPickerO1UpperHullLocations, Holes = $PixelFloorPickerO1UpperHoleLocations, Bearings = $PixelFloorPickerO1UpperBearingLocations);
//Upper rail plates, long version
//PixelFloorPickerO1PlateDrive(m = 0, HullBounds = $PixelFloorPickerO2UpperHullLocationsDrive, Holes = $PixelFloorPickerO2UpperHoleLocations, Bearings = $PixelFloorPickerO2UpperBearingLocations);
//PixelFloorPickerO1Plate(m = 1, HullBounds = $PixelFloorPickerO2UpperHullLocations, Holes = $PixelFloorPickerO2UpperHoleLocations, Bearings = $PixelFloorPickerO2UpperBearingLocations);

//Lower guides, short version
//PixelFloorPickerO1PlateLower(mount = 1, m = 0, HullBounds = $PixelFloorPickerO1LowerBearingLocations, Holes = $PixelFloorPickerO1LowerHoleLocations, Bearings = $PixelFloorPickerO1LowerBearingLocations);
//PixelFloorPickerO1PlateLower(mount = 1, m = 1, HullBounds = $PixelFloorPickerO1LowerBearingLocations, Holes = $PixelFloorPickerO1LowerHoleLocations, Bearings = $PixelFloorPickerO1LowerBearingLocations);
//Lower guides, long version
//PixelFloorPickerO1PlateLower(mount = 0, m = 0, HullBounds = $PixelFloorPickerO2LowerBearingLocations, Holes = $PixelFloorPickerO2LowerHoleLocations, Bearings = $PixelFloorPickerO2LowerBearingLocations);

//Roller plug
//PixelFloorPickerO1RollerPlug();
//DroneLauncher(Version = 2);
//DroneLauncherPrint();

//  translate([$PixelFloorPickerO1LowerPlateSpacing / 2, 0, 0])
//    PixelFloorPickerO1PlateLower(mount = 1, m = 0, HullBounds = $PixelFloorPickerO1LowerBearingLocations, Holes = $PixelFloorPickerO1LowerHoleLocations, Bearings = $PixelFloorPickerO1LowerBearingLocations);
//  translate([-$PixelFloorPickerO1LowerPlateSpacing / 2, 0, 0])
//    PixelFloorPickerO1PlateLower(mount = 1, m = 1, HullBounds = $PixelFloorPickerO1LowerBearingLocations, Holes = $PixelFloorPickerO1LowerHoleLocations, Bearings = $PixelFloorPickerO1LowerBearingLocations);

//TRailPulleyClampLower();
//TRailPulleyClampUpper();
//PulleyCap();
//TeamToken();
//scale(25.4)
//PixelGripperOutline();
//PixelGripperUpperOutline();

//CreatePlateSet(stages = 2, returnstyle = 0, offset = 10);
//CreatePlate(show = $DisplaySelection, stages = 2, returnstyle = 0, offset = 10, width = 14);
//RailSupportPlate();
//FTCLifterSpindle($SpindleDiameter = 30, $SpindleLength = 25, $SpindleType = 1, $ShaftType = 1, $ShaftDiameter = 8 + 0.4, Splitter = true);
//SpindleCore(InnerD = 20, OuterD = 24, Height = $PixelFloorPickerO1SpindleHeight, RimHeight = .5, SlopeSpan = 1, ShaftD = 8, ShaftFaces = 6, ThreadD = 3, Center = true, Cord = true);
//translate([0, 230, 0])
//  Backdrop();

//PixelFloorPickerO2(actuatorangle = -20, supportspacing = 120, position = 00, offset = 10, stages = 2);
//PixelFloorPickerO2HopperArm(actuatorangle = -20, position = 0, offset = 10, stages = 2, width = 15);
//PixelFloorPickerO2HopperArm(actuatorangle = -20, position = 0, offset = 10, stages = 2, width = 12, motorposition = 184 - 24, channelholes = 5, offsetholes = 4);


//HopperSubsystem();


if ($DisplaySelection == 0)
  FullRobotV2(supportspacing = 109, offset = 10, stages = 2, width = 12);
else if ($DisplaySelection == 12)
  HopperBaseMount(showservo = false);
else if ($DisplaySelection == 13)
  PixelFloorPickerO1RollerPlug();
else if ($DisplaySelection == 14)
  FishboneGear(Teeth = 48, Depth = 9, Hub = 16);
else if ($DisplaySelection == 17)
  ConveyorTransferGear( type = 0);
else if ($DisplaySelection == 18)
  ConveyorTransferGear( type = 1);
else if ($DisplaySelection == 19)
  rotate(180, [1, 0, 0])
    LifterSpindle(RobotLifterSpindleStyle);
else if ($DisplaySelection == 20)
  Spacer(outer = SpacerOuter, inner = SpacerInner, sides = SpacerSides, thickness = SpacerThickness);
else if ($DisplaySelection == 21)
  RevMount(orientation = RevMountOrientation, dual = RevMountDual);
else if ($DisplaySelection == 22)
  DroneLauncherPrint(Version = 2, ToPrint = 1);//15
else if ($DisplaySelection == 23)
  projection(cut = false)
    Hook();
else if ($DisplaySelection == 24)
  ConveyorGuide();
else if ($DisplaySelection == 25)
  HopperPixelFunnel();
else if ($DisplaySelection == 26)
  DualHopperBin();
else if ($DisplaySelection == 27)
  RollerFlipper();
else
  CreatePlate(show = $DisplaySelection, stages = 2, returnstyle = 0, offset = 10, width = 14);

if (RobotShowBoundingBoxSmall)
  BoundingBox();


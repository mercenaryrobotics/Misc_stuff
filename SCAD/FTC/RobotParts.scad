//Make sure the system variable OPENSCADPATH  points to the Robotics\Library location

//use     <D:\3D Printer & Laser Cutter\3D models\Robotics\Library\Getriebe.scad>
//use <D:\3D Printer & Laser Cutter\3D models\Robotics\Library\RobotPrimitives.scad>
//use     <D:\3D Printer & Laser Cutter\3D models\Robotics\Library\Sprockets.scad>

//Included so global parameters are defined
//include <RobotPrimitives.scad>
//use <Getriebe.scad>
//use <Sprockets.scad>
//use <threads.scad>


// sprocket(size, teeth, bore, hub_diameter, hub_height, guideangle);
$fn = 100;
$Hex2Circle = 1/(sin(60));
$Inch2mm = 25.5;

$M4ThreadlockNutDiameterFlat = 6.4;
$M4ThreadlockNutDiameterRound = 7.9;
$M4ThreadlockNutHeight = 4.8;
$M4NonThreadedD = 4.3;
$M4ThreadedD = 4.00 - 0.05;

$M3NonThreadedD = 3.2;
$M3ThreadedD = 3.00 - 0.05;

$CChannelThickness = 2.4;

$ChannelSpacing = 40;

$WheelSectionThicknessInches = 0.5;
$WheelTireRim = 0;
$WheelRampH = 0.3;
$WheelRampW = 0.3;
//$WheelTireRim = 2;
//$WheelRampH = 10;
//$WheelRampW = 1;

$WheelAxleBlockDepth = 9.6;
$ChannelInnerSpacing = $ChannelSpacing + $WheelAxleBlockDepth + $WheelAxleBlockDepth;

$WheelDiametermm = 101;
$WheelSectionThicknessmm = 12.5;
$WheelSectionHubThickness = 0;
$WheelSectionHubDiameter = 35;
$WheelSprocketHubDiameter = $WheelDiametermm - 20;
$WheelSprocketHubThickness = 10;
$SprocketAlignmentHeight = 1;
$SprocketAlignmentDiameter = $WheelSprocketHubDiameter - 5;
$WheelAlignmentSides = 6;

$PusherWidth = 20;
$PusherDepth = 25;
$PusherHeight = 25;
$PusherOpeningDepth = 15;
$PusherShaftOffset = 2;
$PusherOpeningHeight = 12 + $PusherShaftOffset;
$PusherClearance = .6;
$PusherChannelHeight = 38;
$PusherShaftWidth = 15;
$PusherShaftDepth = 40;
$HousingWidth = 43;
$HousingDepth = $ChannelInnerSpacing;
$HousingHeight = 43 + $CChannelThickness;
$ChainGapDepth = 10;
$ChainGapHeight = 30;

$ChainSkidPlateWidth = 90;
$ChainSkidPlateDepth = $ChannelInnerSpacing;
$ChainSkidPlateHeight = 18;
$ChainSkidPlateMountHoleDiameter = 3.9;

$WheelAxleBlockWidth = 50;
$WheelAxleBlockHeight = 43;
$WheelBearingSpacerHeight = 2;
$WheelAxleSupportDiameter = 15;
$WheelAdjusterSpacing = 6;

$ChannelInsertBlockWidth = 43;

$IntakeWallThickness = 1.9;
$IntakeInnerWidth = 92;
$IntakeInnerHeight = 82;
$IntakeInnerDepth = 70;
$IntakeOuterWidth = $IntakeInnerWidth + (2 * $IntakeWallThickness);
$IntakeOuterHeight = $IntakeInnerHeight + (1 * $IntakeWallThickness);
$IntakeOuterDepth = $IntakeInnerDepth + (1 * $IntakeWallThickness);

$LifterCarriageSpacing = 32;
$LifterCarriageRailSpacing = 32;
$IntakeRailThickness = 20;
$IntakeRailSpacing = 152;//$IntakeOuterWidth + $IntakeRailThickness + 2 + 55;
$IntakeRailHorizontalOffset = 0;
$CarriageExtensionLength = 30;

$IntakeHopperZOffset = 55;
$IntakeHopperYOffset = 5;

$IntakeTipAngle = 0;
$IntakeTipPosition = 30;
$IntakeRailAngle = 30;

$ClawAxisDiameter = 50;
$ClawBaseOversize = 18;
$ExtensionLength = 60;
$ClawAngle = -17;
$ClawPivotOffset = 5;

//FTC 2023-2024 components
//$PixelFloorPickerO1ShaftDSnug = 6.1;//Aluminum 6mm shaft
$PixelFloorPickerO1ShaftDSnug = 8.56;//8mm shaft
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
$PixelFloorPickerO1SpindleHeight = 10;
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

//Drone launcher
$DroneLauncherRailW = 12.1;
$DroneLauncherRailL = 300;
$DroneLauncherL = 170;
$DroneLauncherRailThickness = 1.5;
$DroneLauncherRailClearance = .4;
$DroneLauncherCarriageClearance = .6;
$DroneLauncherExtensionCutout = 110;
 
//Pixel hopper 
hopperlowerwidth = 20;
hopperupperwidth = 30;
hopperheight = 90;
hopperwallthickness = 2;
hopperhingeblocksize = 10;
hoppersinglewidth = 90;
DualHopperWidth = (hoppersinglewidth * 2) + 3 + 5;
hopperlinkagethickness = 6;
hopperlinkagebasespacing = 77;
hopperlinkagehopperspacing = 71;
hopperlinkagetoplength = 118;
hopperlinkagebottomlength = 133;
hopperbaseplatethickness = 5;
hopperbaseplateheight = 150;
hopperedgeoffset = 40;//Distance that the servo is from the outer edge
hopperbackdisplacement = 18;//Distance from the front edge of the plate
hopperverticaldisplacement = hopperbaseplateheight - 20;//Distance from the bottom edge of the plate
hopperlinkageseperation = hopperlinkagethickness + hopperlinkagethickness + DualHopperWidth + .5;//Spacing between the linkage likewise edges. NEEDS TO CONSIDER THE HOPPER WIDTH + 1x LINKAGE THICKNESS + CLEARANCE
hopperbaseplatewidth = hopperlinkageseperation + hopperedgeoffset + 6;

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

module LightRingFrame()
{
  $fn = 40;
  difference()
  {
    cylinder(d = 2.55, h = 0.26);
    translate([0, 0, 0.08])
    {
      difference()
      {
        cylinder(d = 2.42, h = 0.26);
        cylinder(d = 1.65, h = 0.26);
      }
      cylinder(d = 1.5, h = 0.26);
    }
    cube([0.51, 0.77, 1], center = true);
    translate([2.035 / 2, 0, 0])
      cube([.3, .3, 1], center = true);
  }
}

module JeVoisMount()
{
  difference()
  {
    //Main base
    translate([0, 0, 3.5])
      cube([70, 70, 13], center = true);
    //Camera outline/mount holes
    translate([-14, 0, 2])
      JeVoisBottom();
    //Mount screw countersinks
    translate([-28.75, 12.5, 7])
      JeVoisHoles($D = 6, $L = 2);
    //Cable exit
    translate([13, 6, 7])
      cube([22, 20, 10], center = true);
    translate([29, 6, 7])
      cube([14, 10, 10], center = true);
    //Frame mount holes
    translate([-15, 25])
      cylinder(d = 3, h = 30, center = true, $fn = 20);
    translate([-15, -25])
      cylinder(d = 3, h = 30, center = true, $fn = 20);
    //Remove excess
    translate([30, -55, 0])
      rotate(30, [0, 0, 1])
        cube([80, 80, 80], center = true);
    translate([30, 61, 0])
      rotate(-20, [0, 0, 1])
        cube([80, 80, 80], center = true);
  }
}

module JeVoisHoles($D = 3, $L = 20)
{
  $fn = 20;
  translate([0, 0, -10])
    cylinder(d = $D, h = $L);
  translate([0, -25, -10])
    cylinder(d = $D, h = $L);
  translate([29.5, 0, -10])
    cylinder(d = $D, h = $L);
  translate([29.5, -25, -10])
    cylinder(d = $D, h = $L);
}

module JeVoisBottom()
{
  $fn = 20;
  translate([-29.5/2, 25/2, 0])
  {
  //  color([0.2, 0.4, 0.9, 0.5])
  //    rotate(90, [1, 0, 0])
  //      translate([-36, -2.0, -37.6])
  //        import("JeVoisA33-fanless-case-bottom-0.1mm.stl", convexity=3);
    //Mount holes
    JeVoisHoles($D = 3, $L = 20);
    //Body cutout
    hull()
    {
      translate([0, 0, 0])
        cylinder(d = 7, h = 8.5);
      translate([0, -25, 0])
        cylinder(d = 7, h = 8.5);
      translate([29.5, 0, 0])
        cylinder(d = 7, h = 8.5);
      translate([29.5, -25, 0])
        cylinder(d = 7, h = 8.5);
    }
    translate([-4, -12.5, 4.25])
      cube([5, 18, 8.5], center = true);
  }
}

module UltrasonicHousingPrint()
{
	scale(25.4)
	{
	rotate(180, [0, 1, 0])
		UltrasonicSensorMountFront();

	translate([0, 1.3, -.58])
    rotate(180, [1, 0, 0])
      UltrasonicSensorMountBackPlate();
	}
}

module UltrasonicSensorMountBackPlate()
{
  translate([0, -0.05, 0])
    difference()
    {
      translate([0, 0.02, 0])
      cube([2.1 + 0.2, 1.16 + 0.1, .2], center = true);
      translate([0, -0.05, -0.1])
        cube([2.1 + 0.01, 1.2 + 0.03, .2], center = true);
      translate([0, -0.27, 0])
        cube([0.6, .25, .5], center = true);
    }
    translate([0, -0.78, 0.05])
      cube([2.1 + 0.2, 0.24, .1], center = true);
}

module UltrasonicSensorMountFront()
{
  difference()
  {
    //Main block
    translate([0, -0.1, (.68 / 2)])
      cube([2.1, 1.2, .68], center = true);
    //Cut out the sensor
    translate([0, 0, 0.07])
      UltrasonicSensor();
  }
  difference()
  {
    //Mounting base
    translate([0, -0.8, (.68 / 2)])
      cube([4, .2, .68], center = true);
    //Mounting holes
    translate([1.5, -.5, (.68 / 2)])
      rotate(90, [1, 0, 0])
        cylinder(d = 1/4, h = 1, $fn = 40, center = true);
    translate([-1.5, -.5, (.68 / 2)])
      rotate(90, [1, 0, 0])
        cylinder(d = 1/4, h = 1, $fn = 40, center = true);
  }
}

module UltrasonicSensor()
{
  //PCB
  cube([1.95, .88, 0.15], center = true);
  //Transducer 1
  translate([1.02 / 2, 0, 0.145 / 2])
  {
    cylinder (d = .63 + 0.017, h = .49, $fn = 50);
    //Openings
    cylinder (d = 0.56, h = 1, $fn = 50);
  }
  //Transducer 2
  translate([-1.02 / 2, 0, 0.145 / 2])
  {
    cylinder (d = .63 + 0.017, h = .49, $fn = 50);
    //Openings
    cylinder (d = 0.56, h = 1, $fn = 50);
  }
  //Cyrstal
  translate([0, (.88 - .255) / 2, (0.15 / 2) + (0.15 / 2)])
    cube([0.55, .255, .15], center = true);
  //Connector
  translate([0, -(.88 - .255) / 2, (0.15 / 2) + (0.15 / 2)])
    cube([0.55, .255, .15], center = true);
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

module OpticalSensor()
{
  union()
  {
    //PCB
    cube([34, 2, 16]);
     //Sensor
    translate([0, 2, 2.5])
      cube([7, 8, 14]);//Z really 11 but extended to make opening on mount
    //LED stems
    translate([27, 0, 2.5])
      rotate(90, [1, 0, 0])
        cylinder(d = 2.5, h = 10, $fn = 50);
    translate([27, 0, 13.5])
      rotate(90, [1, 0, 0])
        cylinder(d = 2.5, h = 10, $fn = 50);
    //Pot
    translate([14, -6, 8])
      cube([8, 9, 8]);
    translate([18, -6, 12])
      rotate(90, [1, 0, 0])
        cylinder(d = 4, h = 10, $fn = 50);
    //Connector
    translate([30, -3, 2])
      cube([4, 6, 15]);//Z really 12 but extended to make opening on mount
    translate([30, -6, 2])
      cube([10, 4, 15]);//Z really 12 but extended to make opening on mount
    //"Stuff"
    translate([0, -2.5, 0])
      cube([34, 2.5, 16]);
  //Mounting hole
  translate([25, 15, 8])
    rotate(90, [1, 0, 0])
      cylinder(d = 4, h = 30, $fn = 50);
  //Mounting hole captive opening
  translate([25, 10, 8])
    rotate(90, [1, 0, 0])
      cylinder(d = 7, h = 4, $fn = 50);
  }
}

module OpticalLimitSwitchHolder()
{
  difference()
  {
    //Main holder
    cube([39, 20, 18]);
    translate([3, 10, 2])
      OpticalSensor();
    //Adjust connector opening
    translate([32, -0.1, 3])
      cube([10, 8, 20]);
  }
  translate([24, 17, 18])
    OpticalSensorTab();
  translate([0, 0, 18])
    OpticalSensorTab();
  translate([24, 0, 0])
    rotate(90, [1, 0, 0])
      OpticalSensorTab();
  translate([-15, 15, 0])
    rotate(90, [1, 0, 0])
      OpticalSensorTab();
  translate([0, 20, 18])
    rotate(-90, [0, 0, 1])
      OpticalSensorTab();
}

module OpticalSensorTab()
{
  difference()
  {
    cube([15, 3, 15]);
    translate([7.5, 0, 7.5])
      rotate(-90, [1, 0, 0])
        cylinder(d = 4, h = 5, $fn = 50);
  }
}

 
module SpindleCore(InnerD, OuterD, Height, RimHeight, SlopeSpan, ShaftD, ShaftFaces, ThreadD)
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
    }
    cylinder(d = ShaftD, h = Height, $fn = ShaftFaces);
    translate([InnerD / 4, 0, Height / 2])
      rotate(90, [1, 0, 0])
        cylinder(d = ThreadD, h = OuterD, center = true);
  }
}

module FTCLifterSpindle()
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


 module cylinder_outer(height,radius,fn)
 {
   fudge = 1/cos(180/fn);
   cylinder(h=height,r=radius*fudge,$fn=fn);
 }

 module cylinder_mid(height,radius,fn)
 {
   fudge = (1+1/cos(180/fn))/2;
   cylinder(h=height,r=radius*fudge,$fn=fn);
 }

module WheelSection($Style = 0)
{
  $InnerWheelHeight = $WheelSectionThicknessmm - (2 * ($WheelTireRim + $WheelRampW));
  
  translate([0, 0, $WheelSectionThicknessmm / 2])
    difference()
    {
      union()
      {
        //Central section
        cylinder(d = $WheelDiametermm, h = $InnerWheelHeight, center = true);
        //Ramps
        translate([0, 0, ($InnerWheelHeight + $WheelRampW) / 2])
          cylinder(d1 = $WheelDiametermm, d2 = $WheelDiametermm - $WheelRampH, h = $WheelRampW, center = true);
        translate([0, 0, -($InnerWheelHeight + $WheelRampW) / 2])
          cylinder(d2 = $WheelDiametermm, d1 = $WheelDiametermm - $WheelRampH, h = $WheelRampW, center = true);
        cylinder(d = $WheelDiametermm - $WheelRampH, h = $WheelSectionThicknessmm, center = true);
        //Center mount hub
        translate([0, 0, ($WheelSectionThicknessmm / 2)])
          cylinder(d = $WheelSectionHubDiameter, h = $WheelSectionHubThickness);
      }
      if ($Style == 0)
      {
      //Bearing mount
      translate([0, 0, ($WheelSectionThicknessmm / 2) + $WheelSectionHubThickness + 0.1])
        rotate(180, [1, 0, 0])
          BearingReceptical($Type="608", $DOversize = 0, $HOversize = 1);
      }
      //Sprocket alignment groove
      translate([0, 0, -($WheelSectionThicknessmm / 2) - 0.2])
        cylinder(d1 = $SprocketAlignmentDiameter + 1.0, d2 = $SprocketAlignmentDiameter + 0.5, h = $SprocketAlignmentHeight + .3, $fn = $WheelAlignmentSides);
      //Nut/bolt countersink
      translate([0, 0, ($WheelSectionThicknessmm / 2) - 4.9])
        RotatedShaftSet($D = 15, $H = 5, $Radius = 30, $Count = 6, $Rotate = 0);
      //Center axle opening. Note, if style = 0 then will be superceeded by bearing hole
      cylinder(d = $SmalHexShaftD, h = 30, $fn = 6, center = true);
      //Remaining holes
      //Shaft opening
      if ($Style == 0)
      {
        cylinder(d = 13, h = 100, center = true);
      }
      WheelHoleSet($Height = 100);
    }
}

module WheelHoleSet($Height = 100)
{
  translate([0, 0, -$Height / 2])
    RotatedShaftSet($D = 3.5, $H = $Height, $Radius = 30, $Count = 6, $Rotate = 0);
}

module WheelSprocketSection($Style = 0)
{
  difference()
  {
    union()
    {
      //Sprocket
      translate([0, 0, -2.794 / 2])
        sprocket(size = 25, teeth = 45, bore = 0, hub_diameter = 1, hub_height = 0, guideangle = 25); 
      //Sprocket hub
      cylinder(d = $WheelSprocketHubDiameter, h = $WheelSprocketHubThickness, center = true);
      //Alignment lip
      cylinder(d = $SprocketAlignmentDiameter, h = $WheelSprocketHubThickness + (2 * $SprocketAlignmentHeight), center = true, $fn = $WheelAlignmentSides);
    }
      //Center axle opening. Note, if style = 0 then will be superceeded by bearing hole
      cylinder(d = $SmalHexShaftD, h = 30, $fn = 6, center = true);
      //Remaining holes
      //Shaft opening
      if ($Style == 0)
      {
        cylinder(d = 13, h = 100, center = true);
      }
      WheelHoleSet($Height = 100);
  }
}

module WheelSet($Sprocket = true)
{
  //Main wheels
  translate([0, 0, ($WheelSprocketHubThickness/ 2)])
    WheelSection();
  rotate(180, [1, 0, 0])
    translate([0, 0, ($WheelSprocketHubThickness / 2)])
      WheelSection();
  if ($Sprocket == true)
  //Sprocket section
  WheelSprocketSection();
}

module WheelAxleBlock($WheelAxleBlockAxleOffset = 0, $Style = 1, $AdjustLength = 0)
{
  difference()
  {
    union()
    {
      RoundedBlock($XDim = $WheelAxleBlockWidth, $YDim = $WheelAxleBlockHeight, $ZDim = $WheelAxleBlockDepth, $CurveD = 4);
      if ($Style == 0)
        translate([0, $WheelAxleBlockAxleOffset, $WheelAxleBlockDepth / 2])
          cylinder(d = 16, h = $WheelBearingSpacerHeight);
    }

    //Shaft/bearing opening
    translate([0, $WheelAxleBlockAxleOffset, 0])
      if ($Style == 0)
        cylinder(d = $SmalHexShaftD, h = 30, $fn = 6, center = true);
      else if ($Style == 1)
      {
        cylinder(d = 15, h = 30,center = true);
        translate([0, 0, -3.2])
          BearingReceptical($Type="608", $DOversize = 0, $HOversize = 1);
      }
      else if ($Style == 2)
      {
        //Opening for spacer
        cylinder(d = 18, h = 20, center = true);
        translate([0, 0, -2.5])
          Rev5mmHexBearingBlock($BoltHeight = 20, $Cutout = 1);
      }
    
    //Mount holes, sized for M4
//    hull()
//      translate([16 - $AdjustLength, 16, $WheelAxleBlockDepth / 2])
//        Bolt($Shaft = 4.3, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $M4ThreadlockNutHeight, $Orientation = [1, 0, 0], $Angle = 180);
//      translate([16 + $AdjustLength, 16, $WheelAxleBlockDepth / 2])
//        Bolt($Shaft = 4.3, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $M4ThreadlockNutHeight, $Orientation = [1, 0, 0], $Angle = 180);
    translate([16, 16, $WheelAxleBlockDepth / 2])
      CaptiveBoltSlot($ShaftL = 20, $ShaftD = 4.3, $HeadD = $M4ThreadlockNutDiameterFlat * $HexToRScale, $HeadL = $M4ThreadlockNutHeight, $Spacing = $AdjustLength, $Angle = 180, $Orientation = [0, 1, 0]);

    translate([16, -16, $WheelAxleBlockDepth / 2])
      CaptiveBoltSlot($ShaftL = 20, $ShaftD = 4.3, $HeadD = $M4ThreadlockNutDiameterFlat * $HexToRScale, $HeadL = $M4ThreadlockNutHeight, $Spacing = $AdjustLength, $Angle = 180, $Orientation = [0, 1, 0]);
    translate([-16, 16, $WheelAxleBlockDepth / 2])
      CaptiveBoltSlot($ShaftL = 20, $ShaftD = 4.3, $HeadD = $M4ThreadlockNutDiameterFlat * $HexToRScale, $HeadL = $M4ThreadlockNutHeight, $Spacing = $AdjustLength, $Angle = 180, $Orientation = [0, 1, 0]);
    translate([-16, -16, $WheelAxleBlockDepth / 2])
      CaptiveBoltSlot($ShaftL = 20, $ShaftD = 4.3, $HeadD = $M4ThreadlockNutDiameterFlat * $HexToRScale, $HeadL = $M4ThreadlockNutHeight, $Spacing = $AdjustLength, $Angle = 180, $Orientation = [0, 1, 0]);
    /*
    //Close to hub so offset to ensure cleaing through hub too
    translate([12, 0, ($WheelAxleBlockDepth / 2) + 2])
      Bolt($Shaft = 4.3, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $M4ThreadlockNutHeight + 2, $Orientation = [1, 0, 0], $Angle = 180);
    translate([-12, 0, ($WheelAxleBlockDepth / 2) + 2])
      Bolt($Shaft = 4.3, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $M4ThreadlockNutHeight + 2, $Orientation = [1, 0, 0], $Angle = 180);
    */
    //Offset marker to make easier to identify orientation
    if ($WheelAxleBlockAxleOffset != 0)
    {
      translate([0, 15, ($WheelAxleBlockDepth / 2) - .5])
        cylinder(d = 5, h = .5);
    }
  }
}

module ChainTensionerPusher()
{
  difference()
  {
    translate([0, 0, $PusherHeight / 2])
      RoundedBlock($XDim = $PusherWidth, $YDim = $PusherDepth, $ZDim = $PusherHeight, $CurveD = 3);
    translate([-$PusherWidth / 2, -$PusherOpeningDepth / 2, 0])
      cube([$PusherWidth, $PusherOpeningDepth, $PusherOpeningHeight]);
    translate([0, 0, $PusherShaftOffset])
      rotate(90, [1, 0, 0])
        cylinder(d = 8, h = 35, center = true);
  }
}

module ChainTensionerHousingV2()
{
  difference()
  {
    //Housing block
    translate([0, 0, $HousingHeight / 2])
      RoundedBlock($XDim = $HousingWidth, $YDim = $HousingDepth, $ZDim = $HousingHeight, $CurveD = 3);
    //Bearinggap
    translate([-25 / 2, -16 / 2, 0])
      cube([25, 16, $ChainGapHeight]);
    //Chain gap
    translate([-$HousingWidth / 2, -$ChainGapDepth / 2, 0])
      cube([$HousingWidth, 10, $ChainGapHeight]);
    //Pusher channel
    translate([-(($PusherWidth / 2) + $PusherClearance), -(($PusherDepth / 2) + $PusherClearance), 0])
      cube([$PusherWidth + $PusherClearance + $PusherClearance, $PusherDepth + $PusherClearance + $PusherClearance, $PusherChannelHeight]);
    //Pusher shaft channel
    translate([-($PusherShaftWidth / 2), -($PusherShaftDepth / 2), 0])
      cube([$PusherShaftWidth, $PusherShaftDepth, $PusherChannelHeight]);
    //Tensioner nut and boltshaft
    translate([0, 0, $PusherChannelHeight])
      Bolt($Angle = 0, $Orientation = [0, 0, 0], $Units = 1, $Shaft = 5, $ShaftLength = 30, $Head = 0, $HeadFlat = 8, $HeadDepth = 5.4);
    //Upper crossbar bolt clearances
    translate([0, ($HousingDepth / 2) - 5, $HousingHeight - 5])
      cube([$HousingWidth, 10, 10], center = true);
    translate([0, -(($HousingDepth / 2) - 5), $HousingHeight - 5])
      cube([$HousingWidth, 10, 10], center = true);
    //Locating holes
    translate([16, 0, 0])
      cylinder(d = 3, h = 60);
    translate([-16, 0, 0])
      cylinder(d = 3, h = 60);
    //Chop a chunk off the bottom since not really needed. Possibly keep extra as a chain guide later?
    translate([-50, -50, 0])
      cube([100, 100, 10]);
    /*
    //Housing mounting holes
    translate([0, 0, $HousingHeight / 2])
      rotate(90, [1, 0, 0])
      {
        translate([16, 16, 0])
          cylinder(d = 4, h = $HousingDepth + 2, center = true);
        translate([-16, 16, 0])
          cylinder(d = 4, h = $HousingDepth + 2, center = true);
        translate([16, -16, 0])
          cylinder(d = 4, h = $HousingDepth + 2, center = true);
        translate([-16, -16, 0])
          cylinder(d = 4, h = $HousingDepth + 2, center = true);
      }
      */
  }
}

module ChainTensionerHousingSection()
{
  difference()
  {
    ChainTensionerHousing();
    //Chop off the side since using 2x should be easier to assemble
    //Shave a little off the width too to allow clearance to push together
    translate([-50, -0.5, 0])
      cube([100, 100, 100]);
  }
}

module ChainTensionerHousing()
{
  difference()
  {
    //Housing block
    translate([0, 0, $HousingHeight / 2])
      RoundedBlock($XDim = $HousingWidth, $YDim = $HousingDepth, $ZDim = $HousingHeight, $CurveD = 3);
    //Bearinggap
    translate([-25 / 2, -16 / 2, 0])
      cube([25, 16, $ChainGapHeight]);
    //Chain gap
    translate([-$HousingWidth / 2, -$ChainGapDepth / 2, 0])
      cube([$HousingWidth, 10, $ChainGapHeight]);
    //Pusher channel
    translate([-(($PusherWidth / 2) + $PusherClearance), -(($PusherDepth / 2) + $PusherClearance), 0])
      cube([$PusherWidth + $PusherClearance + $PusherClearance, $PusherDepth + $PusherClearance + $PusherClearance, $PusherChannelHeight]);
    //Pusher shaft channel
    translate([-($PusherShaftWidth / 2), -($PusherShaftDepth / 2), 0])
      cube([$PusherShaftWidth, $PusherShaftDepth, $PusherChannelHeight]);
    //Tensioner nut and boltshafts
    translate([0, 13, $PusherChannelHeight])
      Bolt($Angle = 0, $Orientation = [0, 0, 0], $Units = 1, $Shaft = 3.1, $ShaftLength = 30, $Head = 0, $HeadFlat = 5.4, $HeadDepth = 3.9);
    translate([0, -13, $PusherChannelHeight])
      Bolt($Angle = 0, $Orientation = [0, 0, 0], $Units = 1, $Shaft = 3.1, $ShaftLength = 30, $Head = 0, $HeadFlat = 5.4, $HeadDepth = 3.9);
    //Upper crossbar bolt clearances
    translate([0, ($HousingDepth / 2) - 5, $HousingHeight - 5])
      cube([$HousingWidth, 10, 10], center = true);
    translate([0, -(($HousingDepth / 2) - 5), $HousingHeight - 5])
      cube([$HousingWidth, 10, 10], center = true);
    //Locating holes
    translate([16, 16, 0])
      cylinder(d = 3.9, h = 60);
    translate([-16, 16, 0])
      cylinder(d = 3.9, h = 60);
    translate([16, -16, 0])
      cylinder(d = 3.9, h = 60);
    translate([-16, -16, 0])
      cylinder(d = 3.9, h = 60);
    //Chop a chunk off the bottom since not really needed. Possibly keep extra as a chain guide later?
    translate([-50, -50, 0])
      cube([100, 100, 10]);
  }
}

module ChainTensioner()
{
  ChainTensionerPusher();
  ChainTensionerHousing();
}

module DriveMotorMount()
{
  $DriveMountWidth = 43;
  $DriveMountDepth = 39;
  $DriveMountHeight = 60;
  $DriveMountSprocketGap = 16;
  $MotorMountAxleOffset = 33;
  
//  translate([0, -55.5, $MotorMountAxleOffset])
//    rotate(-90, [1, 0, 0])
//      HDAndGearbox($Stages = 2);
  difference()
  {
    //Main body
    translate([0, 0, $DriveMountHeight / 2])
      RoundedBlock($XDim = $DriveMountWidth, $YDim = $DriveMountDepth, $ZDim = $DriveMountHeight, $CurveD = 4);
    //Sprocket opening
    translate([0, 0, $MotorMountAxleOffset])
      cube([$DriveMountWidth + 2, $DriveMountSprocketGap, 45], center = true);
    //Outer bearing
    translate([0, ($DriveMountDepth / 2) + 0.1, $MotorMountAxleOffset])
      rotate(90, [1, 0, 0])
        BearingReceptical($Type="608", $DOversize = 0.2, $HOversize = 0);
    //Axle opening
    translate([0, ($DriveMountDepth / 2) + 0.1, $MotorMountAxleOffset])
      rotate(90, [1, 0, 0])
        cylinder(d = 15, h = $DriveMountDepth + 5);
    //Motor hub opening
    translate([0, 0, $MotorMountAxleOffset])
      rotate(90, [1, 0, 0])
        cylinder(d = 24, h = ($DriveMountDepth / 2) + 0.1);
    //Motor grub screw hex key opening
    translate([0, -($DriveMountDepth / 2) + 1.5 + 0.4, $MotorMountAxleOffset])
      rotate(30, [0, 1, 0])
        cylinder(d = 3, h = 50);
    //Motor mount bolt openings
    translate([0, 0, $MotorMountAxleOffset])
    {
      rotate(30, [0, 1, 0])
      {
        //Motor side bolt openings
        rotate(90, [1, 0,0])
          RevMountPattern($D = 3.1, $H = ($DriveMountDepth / 2) + 1, $R = 16);
        //Bolt head insets
        translate([0, -$DriveMountSprocketGap / 2, 0])
          rotate(90, [1, 0,0])    
            RevMountPattern($D = 6.5, $H = 3, $R = 16);
        //Tool opening
        rotate(-90, [1, 0,0])    
          RevMountPattern($D = 6.5, $H = ($DriveMountDepth / 2) + 1, $R = 16);
      }
    }
    //Lower fixing holes
    translate([8, 0, 0])
    {
      cylinder(d = 4.2, h = 20);
      translate([0, 0, 7])
        cylinder(d = 7.8, h = 20, $fn = 6);
    }
    translate([-8, 0, 0])
    {
      cylinder(d = 4.2, h = 20);
      translate([0, 0, 7])
        cylinder(d = 7.8, h = 20, $fn = 6);
    }
    //Sprocket shaft channel
    translate([-15, 0, $MotorMountAxleOffset])
      cube([30, 22, 9.5], center = true);
  }
}

module WheelAxleBlockSplitOuter()
{
  //Inside bolt captive side
  difference()
  {
    //Main outer base
//    WheelAxleBlock($WheelAxleBlockWidth = 50);
    RoundedBlock($XDim = $WheelAxleBlockWidth, $YDim = $WheelAxleBlockHeight, $ZDim = $WheelAxleBlockDepth, $CurveD = 4);
    
    //Mount holes
    //Mount holes, sized for M4
    translate([16, 16, $WheelAxleBlockDepth / 2])
      Bolt($Shaft = 4.3, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $M4ThreadlockNutHeight, $Orientation = [1, 0, 0], $Angle = 180);
    translate([16, -16, $WheelAxleBlockDepth / 2])
      Bolt($Shaft = 4.3, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $M4ThreadlockNutHeight, $Orientation = [1, 0, 0], $Angle = 180);
    translate([-16, 16, $WheelAxleBlockDepth / 2])
      Bolt($Shaft = 4.3, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $M4ThreadlockNutHeight, $Orientation = [1, 0, 0], $Angle = 180);
    translate([-16, -16, $WheelAxleBlockDepth / 2])
      Bolt($Shaft = 4.3, $HeadFlat = $M4ThreadlockNutDiameterFlat, $HeadDepth = $M4ThreadlockNutHeight, $Orientation = [1, 0, 0], $Angle = 180);
    
    //Axle support channel
    hull()
    {
      translate([-$WheelAdjusterSpacing, 0, 0])
        cylinder(d = $WheelAxleSupportDiameter + 1, h = 30);
      translate([$WheelAdjusterSpacing, 0, 0])
        cylinder(d = $WheelAxleSupportDiameter + 1, h = 30);
    }

    //Chop off the bottom
    translate([-50, -50, -20])
      cube([100, 100, 20]);
    //Open the axle channel
    hull()
    {
      translate([-5, 0, 0])
        cylinder(d = 5.3, h = 20);
      translate([5, 0, 0])
        cylinder(d = 5.3, h = 20);
    }
  }
}

module  WheelAxleBlockHoleSet($BoltShaftDiameter = 4.2)
{
  //Shaft opening
    translate([0, $WheelAxleBlockAxleOffset, 0])
      cylinder(d = $SmalHexShaftD, h = 30, $fn = 6, center = true);
  
  //Mount holes, sized for M4
  hull()
  {
    translate([16 - $WheelAdjusterSpacing, 16, -$WheelAxleBlockDepth / 2])
      cylinder(d = $BoltShaftDiameter, h = 20);
    translate([16 + $WheelAdjusterSpacing, 16, -$WheelAxleBlockDepth / 2])
      cylinder(d = $BoltShaftDiameter, h = 20);
  }  
  
  
  hull()
  {
   translate([16 - $WheelAdjusterSpacing, -16, -$WheelAxleBlockDepth / 2])
      cylinder(d = $BoltShaftDiameter, h = 20);
   translate([16 + $WheelAdjusterSpacing, -16, -$WheelAxleBlockDepth / 2])
      cylinder(d = $BoltShaftDiameter, h = 20);
  }  
  
  
  hull()
  {
    translate([-16 - $WheelAdjusterSpacing, 16, -$WheelAxleBlockDepth / 2])
      cylinder(d = $BoltShaftDiameter, h = 20);
    translate([-16 + $WheelAdjusterSpacing, 16, -$WheelAxleBlockDepth / 2])
      cylinder(d = $BoltShaftDiameter, h = 20);
  }  
  
  
  hull()
  {
    translate([-16 - $WheelAdjusterSpacing, -16, -$WheelAxleBlockDepth / 2])
      cylinder(d = $BoltShaftDiameter, h = 20);
    translate([-16 + $WheelAdjusterSpacing, -16, -$WheelAxleBlockDepth / 2])
      cylinder(d = $BoltShaftDiameter, h = 20);
  }  
}

module WheelAxleBlockSplitInner()
{
  //Outer  axle mount side
  difference()
  {
    union()
    {
      RoundedBlock($XDim = $WheelAxleBlockWidth + 20, $YDim = $WheelAxleBlockHeight, $ZDim = $WheelAxleBlockDepth, $CurveD = 4);
      cylinder(d = $WheelAxleSupportDiameter, h = ($WheelAxleBlockDepth / 2) + $WheelBearingSpacerHeight);
    }
    //Chop off the top
      difference()
      {
        translate([-50, -50, 0])
          cube([100, 100, 20]);
        cylinder(d = $WheelAxleSupportDiameter, h = 30);
      }

    WheelAxleBlockHoleSet($Spacing = 5, $BoltShaftDiameter = 4.3);
  }
}

module WheelAxleBlockSplit()
{
  WheelAxleBlockSplitOuter($WheelAxleBlockAxleOffset = 0);
  WheelAxleBlockSplitInner($WheelAxleBlockAxleOffset = 0);
}

module ChainSkidPlate()
{
  difference()
  {
    union()
    {
      //Main body
      translate([-$ChainSkidPlateWidth / 2, -$ChainSkidPlateDepth / 2, 0])
        cube([$ChainSkidPlateWidth, $ChainSkidPlateDepth, $ChainSkidPlateHeight]);
      //Alignment guide
      translate([-$ChainSkidPlateWidth / 2, -$ChannelSpacing / 2, $ChainSkidPlateHeight])
        cube([$ChainSkidPlateWidth, $ChannelSpacing, 2]);
    }
    //Pusher/chain clearance opening
    translate([-$ChainSkidPlateWidth / 2, -10, 10])
      cube([$ChainSkidPlateWidth, 20, 10]);
    //Wheel clearances
    translate([-57, 0, 30])
      rotate(30, [0, 1, 0])
        cube([50, $ChainSkidPlateDepth + 2, 50], center = true);
    translate([57, 0, 30])
      rotate(-30, [0, 1, 0])
        cube([50, $ChainSkidPlateDepth + 2, 50], center = true);
    //Side slips
    translate([0, $ChainSkidPlateDepth / 2, 0])
      rotate(45, [1, 0, 0])
        cube([$ChainSkidPlateWidth, 20, 20], center = true);
    translate([0, -$ChainSkidPlateDepth / 2, 0])
      rotate(45, [1, 0, 0])
        cube([$ChainSkidPlateWidth, 20, 20], center = true);
    //Mount holes
    for ( i = [0 : 3] )
    {
      translate([-4 - (i * 8), -24, 0])
        cylinder(d = $ChainSkidPlateMountHoleDiameter, h = 30);
      translate([+4 + (i * 8), -24, 0])
        cylinder(d = $ChainSkidPlateMountHoleDiameter, h = 30);
      translate([-4 - (i * 8), 24, 0])
        cylinder(d = $ChainSkidPlateMountHoleDiameter, h = 30);
      translate([+4 + (i * 8), 24, 0])
        cylinder(d = $ChainSkidPlateMountHoleDiameter, h = 30);
    }
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

module SensorOpenings()
{
  rotate(90, [0, 1, 0])
  {
    cube([16, 26, 30], center = true);
    translate([0, 16, 0])
      cylinder(d = 2.9, h = 30, center = true);
//    translate([0, -16, 0])
//      cylinder(d = 2.9, h = 30, center = true);
  }
}

module FreightIntakeBox($Extend = 0, $DoTipper = 1, $HingeCountStart = 5, $HingeCountStop = 5, $TipperExtension = 0, $DoPushoutServo = 0)
{
  $MotorFulcrumSpacing = 20;
  
  difference()
  {
    //Main box
    translate([-$IntakeOuterWidth / 2, 0, 0])
    {
      translate([0, $Extend, 0])
      {
        difference()
        {
          union()
          {
            //Main body
            cube([$IntakeOuterWidth, $IntakeOuterDepth , $IntakeOuterHeight]);
            //Sensor mount blocks
            translate([-12, 43, 20])
              cube([12, 9, 16]);
            translate([$IntakeOuterWidth, 43, 20])
              cube([12, 9, 16]);
          }
          
          //Sensor mount openings()
          translate([0, 30, 20 + 8])
            SensorOpenings();
          translate([$IntakeOuterWidth, 30, 20 + 8])
            SensorOpenings();

          
          translate([$IntakeWallThickness, $IntakeWallThickness, $IntakeWallThickness])
            cube([$IntakeInnerWidth, $IntakeOuterDepth, $IntakeOuterHeight]);

          //Floor guide bearing mount holes
          translate([-30, $IntakeOuterDepth - 5, 5])
            rotate(90, [0, 1, 0])
              cylinder(d = 4, h = $IntakeOuterWidth + 50);
        }
      //Intake motor stop  platform
      translate([$IntakeOuterWidth, $IntakeOuterDepth - 20, 25])
        difference()
        {
          cube([20, 20, 30]);
          rotate(33, [0, 1, 0])
            cube([20, 20, 40]);
          translate([7, -1, 22])
            rotate(-90, [1, 0, 0])
              cylinder(d = 6, h = 40);
        }
      
      //Side intake guides
      translate([0, $IntakeOuterDepth - 1, 10])
        rotate(30, [0, 0, 1])
          translate([-0.2, 0, 0])
            cube([2, 30, 35]);
      translate([$IntakeOuterWidth - 1, $IntakeOuterDepth - 1, 10])
        mirror([1, 0, 0])
          rotate(30, [0, 0, 1])
            translate([-0.2, 0, 0])
              cube([2, 30, 35]);

        //Bumper bearing mounts
        difference()
        {
          union()
          {
            translate([-5, $IntakeOuterDepth - 10, 0])
              cube([10, 10, 10]);
            translate([$IntakeOuterWidth - 5, $IntakeOuterDepth - 10, 0])
              cube([10, 10, 10]);
          }
          //Bumper bearing mount holes
          translate([-30, $IntakeOuterDepth - 5, 5])
            rotate(90, [0, 1, 0])
              cylinder(d = 4, h = $IntakeOuterWidth + 50);
        }
      }      
      
      //Rear tip hinge(s)
      for (a = [$HingeCountStart:$HingeCountStop])
      {
        translate([0, -12, a * 10])
          difference()
          {
            cube([$IntakeOuterWidth + $TipperExtension, 12, 10]);
            translate([0, 7, 5])
              rotate(90, [0, 1, 0])
                rotate(30, [0, 0, 1])
                  cylinder(d = $SmalHexShaftD * 1.03, h = $IntakeOuterWidth + $TipperExtension, $fn = 6);
          }
      }
      
      //Tip hinge support frame when extended
      hull()
      {
        translate([0, 0, $IntakeOuterHeight - 17 - 17])
          cube([$IntakeOuterWidth, .1, 20]);
        translate([0, $Extend, 0])
          cube([$IntakeOuterWidth, .1, $IntakeOuterHeight - 14]);
      }
      //Rail tip rider
      cube([20, $Extend, $IntakeOuterHeight - 17 - 17]);
      
      $Adjust = 36;
      //Intake motor fulcrum and capture bar
      translate([$Adjust, -15, $IntakeOuterHeight - 15])
        difference()
        {
          hull()
          {
            if ($DoTipper == 1)
            {
              translate([0, -40, 5])
                rotate(90, [0, 1, 0])
                  cylinder(d = 15, h = $IntakeOuterWidth - $Adjust);
            }
            translate([0, $Extend + 3, -1])
              cube([$IntakeOuterWidth - $Adjust, 13.9, 16]);
          }
          for (i = [0 : ($Extend / $MotorFulcrumSpacing)])
          {
            translate([0, 9.5 + $Extend - (i * $MotorFulcrumSpacing), 7.5])
              rotate(90, [0, 1, 0])
              {
                cylinder(d = 8.0, h = $IntakeOuterWidth);
              }
          }
        }
    }
    //Intake motor arm clearance
    translate([($IntakeOuterWidth / 2) + 15, -5.5, 76.4])
      cube([30, 30, 30], center = true);
    //Rail clearance
    translate([-51.9, -10, 77])
      rotate(35, [1, 0, 0])
        cube([80, 60, 30], center = true);
    
  }
  
  if ($DoPushoutServo == 1)
  {
    //Pushout servo
    difference()
    {
      translate([-17, -22, 57.8])
        cube([10, 24, 65]);
      //Pushout servo opening
      translate([-16, -10, 84])
        rotate(90, [0, 1, 0])
          StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 15, $DoHoles = true, $ServoMountHoleDiameter = 3.9, $ServoMountHoleLength = 30);  
    }
  }
}

module CheckChannelSpacing()
{
  //Left
  translate([0.0, ($ChannelSpacing / 2), -24.0])
    CChannel($Length = 100);
  //Right
  mirror([0, 1, 0])
    translate([0.0, ($ChannelSpacing / 2), -24.0])
      CChannel($Length = 100);
  rotate(90, [1, 0,0])
    WheelSet($Sprocket = false);
  /*
  //Reference C channel
  translate([0, ($Spacing / 2) + 12.0, (48.2/2) + 12.0])
    rotate(-90, [0, 0, 1])
      rotate(-90, [1, 0, 0])
        CChannel($Length = 100);
  translate([0, ($ChannelSpacing / 2) + (9.5 / 2), 0])
  rotate(90, [1, 0, 0])
  WheelAxleBlock($WheelAxleBlockAxleOffset = 0);
  
  translate([8 * 10, 0, -$HousingHeight / 2])
    ChainTensionerHousing();
  */
  translate([10.5 * 8, 0, -$ChainSkidPlateHeight - 24])
    ChainSkidPlate();
}

module CheckChannelSpacing2()
{
  rotate(90, [1, 0,0])
    CChannel($Length = 100);
  
  translate([8, -12.2 + 4, 0])
  {
    cylinder(d = 4, h = 15);
    translate([0, -32, 0])
      cylinder(d = 4, h = 15);
  }
}

module IntakeWheelCoupler()
{
  difference()
  {
    cylinder(d = 13, h = 70, $fn =6);
    cylinder(d = $SmalHexShaftD, h = 70, $fn =6);
  }
}

module IntakeBearingMount()
{
  $HexBearingLength = 33;
  $HexBearingWidth = 22.5;
  $HexBearingHeight = 5;
  
  difference()
  {
    //Main body
    translate([-20, 0, 0])
      cube([40, 30, 30]);
    //Rear cutout
    translate([-16, 7, 3])
      cube([32, 30, 30]);
    //Rear slope
    translate([-30, 30, 3])
      rotate(40.5, [1, 0, 0])
        cube([60, 60, 60]);
    //Bearing locator and mount holes
    translate([0, 0, 15])
    {
      translate([-$HexBearingLength / 2, 0, -$HexBearingWidth / 2])
        cube([$HexBearingLength, $HexBearingHeight, $HexBearingWidth]);
      rotate(-90, [1, 0, 0])
      {
        //Shaft opening
        cylinder(d = 8, h = 40);
        //Mount holes
        translate([-10, -8, 0])
          cylinder(d = 3.2, h = 40);
        translate([10, -8, 0])
          cylinder(d = 3.2, h = 40);
        translate([-10, 8, 0])
          cylinder(d = 3.2, h = 40);
        translate([10, 8, 0])
          cylinder(d = 3.2, h = 40);
      }
    }
  }
}

module IntakeLifterRails()
{
  color("lightgray")
  {
    translate([($IntakeRailSpacing-$IntakeRailThickness) / 2, 0, 0])
      cube([$IntakeRailThickness, 400, $IntakeRailThickness]);
    translate([(-$IntakeRailSpacing-$IntakeRailThickness) / 2, 0, 0])
      cube([$IntakeRailThickness, 400, $IntakeRailThickness]);
  }
}

module CoreHexMotor()
{
  color("lightgreen")
    import("../../../Robotics/Library/CoreHex.stl");
}

module IntakeLifter()
{
  rotate($IntakeRailAngle, [1, 0, 0])
  {
    translate([-$IntakeRailHorizontalOffset, 0, 0])
      rotate(-0, [0, 1, 0])
        IntakeLifterRails();
    
    translate([0, $IntakeTipPosition, 5])
    {
      translate([($IntakeRailSpacing / 2) - $IntakeRailHorizontalOffset, 0, $IntakeRailThickness / 4])
        rotate(90, [0, 1, 0])
          IntakeRailCarriage();
      mirror([1, 0, 0])
        translate([($IntakeRailSpacing / 2) + $IntakeRailHorizontalOffset, 0, $IntakeRailThickness / 4])
          rotate(90, [0, 1, 0])
            IntakeRailCarriage();

      //Align with carriage tipper openings
      translate([0, -15 - $CarriageExtensionLength, 29.5])
      {
        rotate(-$IntakeTipAngle - $IntakeRailAngle, [1, 0, 0])
          translate([0, -$IntakeHopperYOffset, -$IntakeHopperZOffset])
          {
            rotate(180, [0, 0, 1])
            {
              FreightIntakeBox();           

              translate([($IntakeOuterWidth / 2) + 20, $IntakeOuterDepth + 25, 70])
                rotate(90, [0, 1, 0])
                  rotate(90, [0, 0, 1])
                    CoreHexMotor();
            }
          }
          //Display rotation axis
#            rotate(90, [0, 1, 0])
              cylinder(d = 6, h = 250, center = true);
        }
    }
  }
}

module IntakeRailCarriageBody($HDepth = 0, $ExcentricDiameter = 4.9, $ExcentricHeight = 7, $BearingShaftDiameter = 4.9, $Servo = 0, $BeltClamp = 0, $BlockOffset = 0)//Shaft = 7.3 for excentric nut
{  
  $SpacerDiameter = 8.0;
  $SpacerOversize = 4.0;
  
  difference()
  {
    union()
    {
      //Main body
      if ($BlockOffset < 30)
      {
        translate([0, -(($CarriageExtensionLength  - $BlockOffset)/ 2), 2])
          RoundedBlock($XDim = 10, $YDim = 50 + $CarriageExtensionLength - $BlockOffset, $ZDim = 50, $CurveD = 3);
      }
      else
      {
        translate([0, -(($CarriageExtensionLength  - 30)/ 2), 2])
          RoundedBlock($XDim = 10, $YDim = 50 + $CarriageExtensionLength - 30, $ZDim = 50, $CurveD = 3);
      }
      //Bearing spacers
      translate([5, $LifterCarriageSpacing / 2, -$LifterCarriageRailSpacing / 2])
        rotate(90, [0, 1, 0])
          cylinder(d1 = $SpacerDiameter + $SpacerOversize, d2 = $SpacerDiameter, h = 7);
      translate([5, -$LifterCarriageSpacing / 2, -$LifterCarriageRailSpacing / 2])
        rotate(90, [0, 1, 0])
          cylinder(d1 = $SpacerDiameter + $SpacerOversize, d2 = $SpacerDiameter, h = 7);
      translate([5, 0, $LifterCarriageRailSpacing / 2])
        rotate(90, [0, 1, 0])
          cylinder(d1 = $SpacerDiameter + $SpacerOversize, d2 = $SpacerDiameter, h = $ExcentricHeight);
      //Hopper top side 'bearing' block
      translate([-9, -15 - $CarriageExtensionLength + $BlockOffset, -11])
        RoundedBlock($XDim = 18, $YDim = 20, $ZDim = 24, $CurveD = 3);
      //Servo block
      if ($Servo == 1)
      {
        //Hinge side
        translate([-10, -45, 16])
          RoundedBlock($XDim = 30, $YDim = 34, $ZDim = 18, $CurveD = 3);
        //Roller side
        translate([-3, -45, 19])
          RoundedBlock($XDim = 30, $YDim = 34, $ZDim = 12, $CurveD = 3);
      }
      if ($BeltClamp == 1)
      {
        translate([13.5, 2, 33])
          RoundedBlock($XDim = 37, $YDim = 46, $ZDim = 12, $CurveD = 3);
        translate([0, 2, 29])
          RoundedBlock($XDim = 10, $YDim = 46, $ZDim = 20, $CurveD = 3);
      }
    }
    //Bearing mount openings
    translate([-5, $LifterCarriageSpacing / 2, -$LifterCarriageRailSpacing / 2])
      Bolt($ShaftLength = 20, $HeadDepth = $HDepth, $Shaft = $BearingShaftDiameter, $Head = 10, $Sides = 40, $Orientation = [0, 1, 0], $Angle = 90);
    translate([-5, -$LifterCarriageSpacing / 2, -$LifterCarriageRailSpacing / 2])
      Bolt($ShaftLength = 20, $HeadDepth = $HDepth, $Shaft = $BearingShaftDiameter, $Head = 10, $Sides = 40, $Orientation = [0, 1, 0], $Angle = 90);
    //Excentric mount opening
    translate([-5, 0, $LifterCarriageRailSpacing / 2])
      Bolt($ShaftLength = 20, $HeadDepth = $HDepth, $Shaft = $ExcentricDiameter, $Head = 14, $Sides = 40, $Orientation = [0, 1, 0], $Angle = 90);
    translate([-11, -15 - $CarriageExtensionLength + $BlockOffset, -15])
    {
    //Hopper top side 'bearing' shaft opening
      
      cylinder(d = 6.2, h = 40, center = true);
      //Servo mount opening
      if ($Servo == 1)
      {
        translate([0, 0, 40])
          rotate(180, [1, 0, 0])
            StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 15, $DoHoles = true, $ServoMountHoleDiameter = 3.9, $ServoMountHoleLength = 30);  
        hull()
        {
          translate([0, 0, 14])
            cylinder(d = 24, h = 16);
          translate([-20, 0, 14])
            cylinder(d = 24, h = 16);
        }
      }
    }
    if ($BeltClamp == 1)
    {
      translate([-6, 17, 33])
        rotate(90, [0, 1, 0])
          cylinder(d = 3.9, h = 50);
      translate([-6, -1, 33])
        rotate(90, [0, 1, 0])
          cylinder(d = 3.9, h = 50);
    }
  }
}

module IntakeCarriageBearing()
{
  color([0.1, 0.1, 0.1])
    rotate(90, [0, 1, 0])
      cylinder(d = 12, h = 9, center = true);//12mm is the rail runner diameter, not the wheel outer diameter
}

module IntakeRailCarriage()
{
  translate([-5 - 6 - 4.5, 0, 0])
  {
    IntakeRailCarriageBody();
    translate([4.5 + 5 + 6, $LifterCarriageSpacing / 2, $LifterCarriageRailSpacing / 2])
      IntakeCarriageBearing();
    translate([4.5 + 5 + 6, -$LifterCarriageSpacing / 2, $LifterCarriageRailSpacing / 2])
      IntakeCarriageBearing();
    translate([4.5 + 5 + 6, 0, -$LifterCarriageRailSpacing / 2])
      IntakeCarriageBearing();
  }
}

module HopperTipperCoupler()
{
  $M3AttachDiameter = 3.9;
  $M25AttachDiameter = 2.4;
  
  difference()
  {
    cylinder(d = 22, h = 9);
    rotate(15, [0, 0, 1])
      cylinder(d = $SmalHexShaftD, h = 9, $fn = 6);
    translate([8, 0, 0])
      cylinder(d = $M3AttachDiameter, h = 10);
    translate([-8, 0, 0])
      cylinder(d = $M3AttachDiameter, h = 10);
    translate([0, 8, 0])
      cylinder(d = $M3AttachDiameter, h = 10);
    translate([0, -8, 0])
      cylinder(d = $M3AttachDiameter, h = 10);
    translate([0, 0, 4.5])
      rotate(-45, [0, 0, 1])
        rotate(90, [1, 0, 0])
          cylinder(d = $M25AttachDiameter, h = 20);
  }
}

module MechanicatsText()
{
  rotate(-90, [0, 0, 1])
    rotate(90, [1, 0, 0])
      linear_extrude(2)
        text("13227",halign="center",size=13); 
}

module MechanicatsIcon()
{
  $UpperD = 35;
  $LowerD = 65;
  $HoleHeight = 60;
  
  difference()
  {
    union()
    {
      scale([1.7, 1.5, 1.0])
      {
        translate([-125, -117.5, 0])
          import ("D:/3D Printer & Laser Cutter/3D models/Characters/Schrodinky/files/loubie_cat_in_box_v8_100mm-17K.stl");
        translate([-20, 2, 4])
          MechanicatsText();
        rotate(180, [0, 0, 1])
        translate([-20, -2, 4])
          MechanicatsText();
      }
      translate([0.1, 3, 1.5])
        //cube([63, 76, 3], center = true);
        RoundedBlock($XDim = 70, $YDim = 76, $ZDim = 3, $CurveD = 1);
      cylinder(d1 = $LowerD, d2 = $UpperD, h = $HoleHeight);
    }
//    translate([0, 5, 0])
      cylinder(d1 = $LowerD - 3, d2 = $UpperD - 3, h = $HoleHeight);
  }
//  translate([-2 * 25.4, -2 * 25.4,  0])
//    cube([4 * 25.4, 4 * 25.4, 4 * 25.4]);
}

module RedScareFunnelSection()
{
  translate([0, 0, 20])
    cylinder(d2 = $PoleBaseDiameter, d1 = $PoleDiameter, h = $FunnelHeight, $fn = 40);
  cylinder(d = $PoleDiameter, h = $SectionHeight, $fn = 40);
}

module RedScareFunnel()
{
  difference()
  {
    RedScareFunnelSection();
    scale([0.9, 0.9, 1.0])
      RedScareFunnelSection();
  }
}

module RedScareIconV1()
{
  $SectionHeight = 50;
  $FunnelHeight = 30;
  
  $PoleDiameter = 50;
  $PoleBaseDiameter = 100;

  difference()
  {
    union()
    {
      RedScareFunnel();
      rotate(180, [1, 0, 0])
        RedScareFunnel();
      rotate(90, [1, 0, 0])
        RedScareFunnel();
      rotate(-90, [1, 0, 0])
        RedScareFunnel();
      rotate(90, [0, 1, 0])
        RedScareFunnel();
      rotate(-90, [0, 1, 0])
        RedScareFunnel();
    }
    cylinder(d = $PoleDiameter - 3, h = $SectionHeight * 2, center = true);
    rotate(90, [1, 0, 0])
      cylinder(d = $PoleDiameter - 3, h = $SectionHeight * 2, center = true);
    rotate(90, [0, 1, 0])
      cylinder(d = $PoleDiameter - 3, h = $SectionHeight * 2, center = true);
  }
}

module RedScareText()
{
  translate([-40, 0, 0])
    cube([80, 3, 25]);
  translate([0, 0, 2])
    rotate(90, [1, 0, 0])
      linear_extrude(2)
        text($Number,halign="center",size=20); 
}

module IconCap()
{
  difference()
  {
    translate([0, 0, 105])
    {
      cylinder(d = 60, h = 3);
    }
    translate([0, 0, 105])
    {
#      cylinder(d1 = 17, d2 = 9, h = 3);
    }
    RedScareIconV2();
  }
}

module RedScareIconV2($DoCap = 2, $DoBase = 1)
{
  translate([0, 0, -5])
  {
    difference()
    {
      union()
      {
        difference()
        {
          scale([1.8, 1.8, 1.65])
            translate([-275.5, -223, 0])
              import ("../Ghost_Updated.STL");
          translate([0, 0, -5 + 5])
            cube([200, 200, 10], center = true);
        }
        if ($DoCap == 3)
          translate([-1, -2.5, 105])
              cylinder(d = 19, h = 20);
      }
      if ($DoCap == 2)
      {
        translate([-1, -2.5, 95])
          rotate(90, [0, 1, 0])
            cylinder(d = 3.5, h = 3.5*25.4, center = true);
        translate([-1, -2.5, 102])
          rotate(90, [1, 0, 0])
            cylinder(d = 3.5, h = 3.5*25.4, center = true);
      }
    }
    
    translate([5, -32, 45])
      rotate(-7, [0, 1, 0])
        RedScareText();

    if ($DoCap == 1)
      translate([0, 0, 105])
        cylinder(d = 60, h = 3);


  }
    
  if ($DoBase == 1)
  {
    difference()
    {
      cube([3.9*25.4, 3.9*25.4, 1], center = true);
      translate([-2, -6, 0.5])
        scale([1.2, 1.0, 1.0])
        cylinder(d = 68, h = 5, center = true);
    }
  }
//#  translate([-2 * 25.4, -2 * 25.4,  0])
//    cube([4 * 25.4, 4 * 25.4, 6 * 25.4]);
}

module RedScareIconV3()
{
  scale(3/4)
  {
    translate([0, -(95 / 2), -(95 / 2)])
      scale([.9, 1.0, .7])
        RedScareText($Number = "13227");
    rotate(180, [0, 0, 1])
      translate([0, -(95 / 2), -(95 / 2)])
        scale([.9, 1.0, .7])
          RedScareText($Number = "13227");
        
    difference()
    {
      cube([95, 95, 95], center = true);
      cylinder(d = 80, h = 120, center = true);
      rotate(90, [1, 0, 0])
        cylinder(d = 80, h = 120, center = true);
      rotate(90, [0, 1, 0])
        cylinder(d = 80, h = 120, center = true);
    }
  }
}

module CarouselSpinnerMount()
{
  $BaseDiameter = 40;
  $HeadDiameter = 9;
  $MountShaftDiameter = 4.3;
  
  difference()
  {
    union()
    {
      translate([0, 0, 6])
        RoundedBlock($XDim = 47, $YDim = 47, $ZDim = 12, $CurveD = 2);
      translate([0, 0, 12])
        cylinder(d1 = $BaseDiameter, d2 = 25, h = 15);
      translate([0, 0, 17])
        cube([2, 47, 20], center = true);
    }
    //Spring opening
    cylinder(d = 18, h = 40);
    //Bolt shaft openings
    translate([25 / 2, 25 / 2, 0])
      cylinder(d = $MountShaftDiameter, h = 40);
    translate([-25 / 2, 25 / 2, 0])
      cylinder(d = $MountShaftDiameter, h = 40);
    translate([25 / 2, -25 / 2, 0])
      cylinder(d = $MountShaftDiameter, h = 40);
    translate([-25 / 2, -25 / 2, 0])
      cylinder(d = $MountShaftDiameter, h = 40);
    //Bolt headopenings
    translate([25 / 2, 25 / 2, 8])
      cylinder(d = $HeadDiameter, h = 40);
    translate([-25 / 2, 25 / 2, 8])
      cylinder(d = $HeadDiameter, h = 40);
    translate([25 / 2, -25 / 2, 8])
      cylinder(d = $HeadDiameter, h = 40);
    translate([-25 / 2, -25 / 2, 8])
      cylinder(d = $HeadDiameter, h = 40);
  }
}

module CarouselSpinnerCoupler()
{
  difference()
  {
    cylinder(d1 = 15.2, d2 = 14.9, h = 20);
    cylinder(d = $SmalHexShaftD * 0.97, h = 30, $fn = 6);
  }
}

module MendelPatched()
{
  translate([0, 0, -30])
    import("x-carriage-lid-1off.stl");
  translate([0, 0, 2.0])
    cube([50, 22, 4], center = true);
  translate([-40, -8, 2.0])
    cube([9, 45, 4], center = true);
}

module RailSupportMountCap($SupportWidth = 20, $Style = 0, $InlineHoles = 0, $InsetDepth = 0, $Narrow = 0, $BlockHeight = 15, $XAdjust = 0, $YAdjust = 0)
{
  difference()
  {
    hull()
    {
      translate([0, 0, 2.5 - ($BlockHeight / 2)])
      if ($Narrow == 0)
        RoundedBlock($XDim = $SupportWidth + 10 - $XAdjust, $YDim = $SupportWidth + 10 - $YAdjust, $ZDim = $BlockHeight, $CurveD = 2);
      else
        RoundedBlock($XDim = $SupportWidth + 10 - $XAdjust, $YDim = $SupportWidth -11 - $YAdjust, $ZDim = $BlockHeight, $CurveD = 2);
      translate([0, 0, 15])
        rotate(90, [1, 0, 0])
          cylinder(d = 12, h = 10, center = true);
    }
    //Side cutaways
    if ($Style == 0)
    {
      translate([-25, 5, 8])
        cube([50, 20, 50]);
      translate([-25, -20 - 5, 8])
        cube([50, 20, 50]);
    }
    else
    {
      translate([-25, 5, 3])
        cube([50, 20, 50]);
      translate([-25, -20 - 5, 3])
        cube([50, 20, 50]);
    }
    //Bolt hole
    translate([0, 0, 15])
      rotate(90, [1, 0, 0])
        cylinder(d = 4.2, h = 10, center = true);
    if ($Style == 0)
    {
      //Bar clamp holes
      translate([0, 0, -8])
      {
        rotate(90, [1, 0, 0])
          cylinder(d = 3.2, h = 40, center = true);
        rotate(90, [0, 1, 0])
          cylinder(d = 3.2, h = 40, center = true);
      }
      //Vertical support cutout
      translate([0, 0, -8])
        cube([$SupportWidth + .5, $SupportWidth + .5, 10], center = true);
    }
    else
    {
      //C-channel mounting holes
      if ($InlineHoles == 1)
      {
        translate([12, 0, 0])
        {
          cylinder(d = 4.2, h = 50, center = true);
          translate([0, 0, 3 - $InsetDepth])
            cylinder(d = 8.2, h = 50);
        }
        translate([-12, 0, 0])
        {
          cylinder(d = 4.2, h = 50, center = true);
          translate([0, 0, 3 - $InsetDepth])
            cylinder(d = 8.2, h = 50);
        }
      }
      else
      {
        translate([0, 12, 0])
        {
          cylinder(d = 4.2, h = 50, center = true);
          translate([0, 0, 3 - $InsetDepth])
            cylinder(d = 8.2, h = 50);
        }
        translate([0, -12, 0])
        {
          cylinder(d = 4.2, h = 50, center = true);
          translate([0, 0, 3 - $InsetDepth])
            cylinder(d = 8.2, h = 50);
        }
      }

    }
  }
}

module RailSupportAnchor($Align = 1, $MountHoleDiameter = 5.2, $CountersinkHeight = 0, $MountDirection = 0)
{
  $ShaftLength = 17;
  
  difference()
  {
    union()
    {
      hull()
      {
        if ($MountDirection == 0)
          translate([0, 0, ($ShaftLength - 15) / 2])
            RoundedBlock($XDim = 32, $YDim = 24, $ZDim = $ShaftLength, $CurveD = 2, $CaptiveDiameter = 9.2);
        else
          translate([0, 0, ($ShaftLength - 15) / 2])
            RoundedBlock($XDim = 20, $YDim = 24, $ZDim = $ShaftLength, $CurveD = 2, $CaptiveDiameter = 9.2);
        translate([0, 0, $ShaftLength + 2])
          rotate(90, [1, 0, 0])
            cylinder(d = 12, h = 24, center = true);
      }
      if ($MountDirection == 1)
        translate([0, 0, ($ShaftLength - 15) / 2])
          RoundedBlock($XDim = 20, $YDim = 44, $ZDim = $ShaftLength, $CurveD = 2, $CaptiveDiameter = 9.2);
    }
    //Hinge hole
    translate([0, 0, $ShaftLength + 2])
      rotate(90, [1, 0, 0])
        cylinder(d = 4.2, h = 24, center = true);
    //Hinge captive nuthole
    translate([0, -12 + 2, $ShaftLength + 2])
      rotate(90, [1, 0, 0])
        cylinder(d = $CaptiveDiameter, h = 5, $fn = 6);
    //Hinge gap
    translate([0, 0, $ShaftLength + 1])
      RoundedBlock($XDim = 35, $YDim = 10.2, $ZDim = 17, $CurveD = 2);
    //Rail alignment
    translate([0, 0, -7.5 + 1])
      if ($Align == 1)
        cube([35, 20.5, 2], center = true);
      else
        cube([90, 90, 2], center = true);
    if ($MountDirection == 0)
    {
      //Rail mount bolt holes
      translate([12, 0, -5.5])
        cylinder(d = $MountHoleDiameter, h = $ShaftLength);
      translate([-12, 0, -5.5])
        cylinder(d = $MountHoleDiameter, h = $ShaftLength);
      //Rail mount bolt hole countersinks
      translate([12, 0, ($ShaftLength / 2) + 1.01 - $CountersinkHeight])
        cylinder(d = 10, h = $CountersinkHeight + 3);
      translate([-12, 0, ($ShaftLength / 2) + 1.01 - $CountersinkHeight])
        cylinder(d = 10, h = $CountersinkHeight + 3);
    }
    else
    {
      //Rail mount bolt holes
      translate([0, 16, -5.5])
        cylinder(d = $MountHoleDiameter, h = $ShaftLength);
      translate([0, -16, -5.5])
        cylinder(d = $MountHoleDiameter, h = $ShaftLength);
      //Rail mount bolt hole countersinks
      translate([0, 16, ($ShaftLength / 2) + 1.01 - $CountersinkHeight])
        cylinder(d = 10, h = $CountersinkHeight + 20);
      translate([0, -16, ($ShaftLength / 2) + 1.01 - $CountersinkHeight])
        cylinder(d = 10, h = $CountersinkHeight + 20);
    }
  }
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

module WheelAxleAdapters()
{
  $SpacerHeight = 2.8;
  
  difference()
  {
    union()
    {
      cylinder(d = 12.7, h = (33 / 2) + $SpacerHeight);
      translate([0, 0, $SpacerHeight])
        cylinder(d = 21.8, h = 7.2);
      cylinder(d = 15, h = $SpacerHeight);
    }
    cylinder(d = $SmalHexShaftD + .2, h = 30, $fn = 6);
  }
}

module WheelAxleAdapterSpacer()
{
  difference()
  {
      cylinder(d = 15, h = 1.6);
    cylinder(d = $SmalHexShaftD + .4, h = 30);
  }
}

module ShimPunch()
{
  difference()
  {
    cylinder(d = 12, h = 30);
    cylinder(d = 6.5, h = 30);
  }
}

module ClawArm()
{
  rotate($ClawAngle, [0, 0, 1])
  difference()
  {
    union()
    {
      //Upper cable connector
      hull()
      {
        cylinder(d = 10, h = 5, center = true);
        translate([15, 5, 0])
          cylinder(d = 10, h = 5, center = true);
      }
      //Vertical extender
      hull()
      {
        cylinder(d = 10, h = 5, center = true);
        translate([0, -$ExtensionLength, 0])
          cylinder(d = 10, h = 5, center = true);
      }
      //Icon clamp
      hull()
      {
        translate([0, -$ExtensionLength, 0])
          cylinder(d = 10, h = 5, center = true);
        translate([20, 10 - $ExtensionLength, 0])
          cube([.1, 5, 5], center = true);
      }
    }
    //Pivot hole
    cylinder(d = 3.5, h = 20, center = true);
    //Cable attatch
    translate([15, 5, 0])
      rotate(90, [1, 0, 0])
        cylinder(d = 2.0, h = 20, center = true);

  }
}

module ClawArmSet()
{
  for (i = [0:3])
    rotate(90 * i, [0, 0, 1])
      translate([-$ClawAxisDiameter / 2, 0, 0])
        rotate(90, [1, 0, 0])
          ClawArm();
}

module ClawFrame()
{
  difference()
  {
    union()
    {
      difference()
      {
        cylinder(d1 = $ClawAxisDiameter + $ClawBaseOversize, d2 = $ClawAxisDiameter + $ClawBaseOversize - 22, h = 15);
        //Claw axle access
        for (i = [0:3])
          rotate(90 * i, [0, 0, 1])
          {
            translate([10, 10, -1])
              cube([40, 40, 40]);
            translate([$ClawAxisDiameter / 2, 0, $ClawPivotOffset])
              rotate(90, [1, 0, 0])
                cylinder(d = 3, h = 40, center = true);
          }
      }
      cylinder(d = 46, h = 15);
    }
    //Center cable access
    cylinder(d = 35, h = 17);
    //Claw arm openings
    cube([6, $ClawAxisDiameter + 11 + $ClawBaseOversize, 40], center = true);
    cube([$ClawAxisDiameter + 11 + $ClawBaseOversize, 6, 40], center = true);
  }
  //Upper section support and servo mount
  translate([0, 0, 15])
    difference()
    {
      cylinder(d1 = 46, d2 = 30, h = 5);
      cylinder(d = 3.5, h = 10);
    }
  
  /*
  //Upper section support and cable guide V1
  translate([0, 0, 15])
    difference()
    {
      cylinder(d1 = $ClawAxisDiameter + $ClawBaseOversize - 10, d2 = 40, h = 15);
      for (i = [0:3])
        rotate(90 * i, [0, 0, 1])
          translate([8, 0, 0])
            cylinder(d = 4, h = 50, center = true);
    }
  //Claw pivot attatch
  rotate(45, [0, 0, 1])
    translate([0, 12, 30])
      ClawPivotAttatch();
  rotate(45, [0, 0, 1])
    translate([0, -12, 30])
      ClawPivotAttatch();
  */
}

module ClawPivotAttatch()
{
      difference()
      {
        hull()
        {
          translate([0, 0, 10])
            rotate(90, [1, 0, 0])
              cylinder(d = 12, h = 7, center = true);
          cube([20, 7, .1], center = true);
        }
        translate([0, 0, 10])
          rotate(90, [1, 0, 0])
            cylinder(d = 4.5, h = 7, center = true);
      }
}

module ClawPushPlate()
{
  difference()
  {
    union()
    {
      cylinder(d = 25, h = 3);
      translate([0, 0, -10])
        cylinder(d1 = 5, d2 = 8, h = 10);
    }
    for (i = [0:3])
      rotate(90 * i, [0, 0, 1])
        translate([8, 0, 0])
          cylinder(d = 4, h = 10, center = true);
    translate([0, 0, -11])
      cylinder(d = 3.0, h = 20);
  }
}

module Claw()
{

  translate([0, 0, -$ClawPivotOffset])
    ClawFrame();
  ClawArmSet();
  translate([0, 0, 5])
    ClawPushPlate();
#  cylinder(d = 3, h = 50);
  translate([10, 0, 58])
    rotate(-90, [0, 1, 0])
      StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 15, $DoHoles = true, $ServoMountHoleDiameter = 3.9, $ServoMountHoleLength = 30);  
}

module IconUpperCapture()
{
  //Upper capture
  translate([0, 0, 5])
  {
    mirror([1, 0, 0])
    {
      difference()
      {
        union()
        {
          translate([0, -10, 0])
            cylinder(d = 80, h = 5);
          translate([4, 0, 0])
            rotate(15, [0, 0, 1])
              cube([30, 71, 5]);
        }
        translate([5, -10, 0])
          hull()
          {
            translate([5, 0, 0])
              cylinder(d = 35, h = 15, center = true);
            translate([-30, -35, 0])
              cylinder(d = 35, h = 15, center = true);
            translate([-40, 20, 0])
              cylinder(d = 35, h = 15, center = true);
          }
        hull()
        {
          translate([-22, 30, 0])
            cylinder(d = 15, h = 15, center = true);
          translate([7, 39, 0])
            cylinder(d = 15, h = 15, center = true);
          translate([-3, 85, 0])
            cylinder(d = 15, h = 15, center = true);
          translate([-20, 85, 0])
            cylinder(d = 15, h = 15, center = true);
        }
        //Cable attatch hole(s)
        for (i = [0:3])
          translate([0, 46 + (i * 5), 2.5])
            rotate(90, [0, 1, 0])
              cylinder(d = 1.5, h = 50);
        //Pivot
        translate([11, 70, 0])
          cylinder(d = 3.3, h = 20, center = true);
      }  
    }
    //Spring attatch
    translate([-22, 40, 0])
    {
      difference()
      {
        hull()
        {
          cylinder(d = 10, h = 5);
          translate([-5, 0, 0])
            cylinder(d = 10, h = 3);
        }
      translate([-5, -10, 0])
        rotate(10, [0, 0, 1])
          cube([1, 10, 10]);
      }
    }
  }
}

module IconLowerCapture()
{
  //Lower capture
  difference()
  {
    union()
    {
      translate([0, -10, 0])
        cylinder(d = 80, h = 5);
      translate([-15, 0, 0])
        cube([30, 80, 5]);
      //Bearing support
      translate([0, 100, 7.5])
        difference()
        {
          rotate(90, [1, 0, 0])
            hull()
            {
              cylinder(d = 34, h = 20);
              translate([12.5, -5, 40])
                cylinder(d = 5, h = 20);
            }
          translate([-28, -70, -2.5])
            cube([30, 50, 30]);
          rotate(90, [1, 0, 0])
            BearingReceptical($Type="608", $DOversize = 0.1, $HOversize = 8);
          rotate(90, [1, 0, 0])
            cylinder(d = 3, h = 80);
        }
    }
    //Capture cutout
    translate([5, -10, 0])
      hull()
      {
        translate([5, 0, 0])
          cylinder(d = 35, h = 15, center = true);
        translate([-30, -35, 0])
          cylinder(d = 35, h = 15, center = true);
        translate([-40, 20, 0])
          cylinder(d = 35, h = 15, center = true);
      }
    //Upper pivot
    translate([-11, 70, 0])
      cylinder(d = 3.0, h = 20, center = true);
    //Cable fulcrum(s)
    for (i = [0:2])
      translate([-3, 50 + (i * 6), -20])
        cylinder(d = 2.4, h = 40);
  }
  //Spring Attatch
  translate([-17, 90, 5])
  {
    difference()
    {
      hull()
      {
        cylinder(d = 10, h = 5);
        translate([-10, 0, 0])
          cylinder(d = 10, h = 3);
      }
      translate([-11, 1, 0])
        rotate(-30, [0, 0, 1])
          cube([1, 10, 10]);
    }
  }
}

module IconSideGrabber()
{
  IconLowerCapture();
  IconUpperCapture();
}

module IconCaptureServoMount()
{
  difference()
  {
    translate([-51, -30, 0])
      union()
      {
        cube([72, 42, 10]);
        translate([0, 0, 6])
          cube([30, 20, 20]);
      }
    translate([0, -20, 7.5 + 7])
      cube([130, 15.4, 15.3], center = true);
    StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 15, $DoHoles = true, $ServoMountHoleDiameter = 3.9, $ServoMountHoleLength = 30);  
    translate([-25, -20, 0])
      cylinder(d = 3, h = 60, center = true);
    translate([-45, -20, 0])
      cylinder(d = 3, h = 60, center = true);
    translate([14.15, 5, 10 - 2.6])
      cylinder(d = 6.2, h = 2.6);
    translate([14.15, -5, 10 - 2.6])
      cylinder(d = 6.2, h = 2.6);
    translate([-33.85, 5, 10 - 2.6])
      cylinder(d = 6.2, h = 2.6);
    translate([-33.85, -5, 10 - 2.6])
      cylinder(d = 6.2, h = 2.6);
  }
}

module IconCaptureServoHorn($Diameter = 40)
{
  difference()
  {
    union()
    {
      cylinder(d = $Diameter, h = 1, center = true);
      translate([0, 0, 0.5])
        cylinder(d1 = $Diameter, d2 = $Diameter + 4, h = 2.5);
      translate([0, 0, -3])
        cylinder(d2 = $Diameter, d1 = $Diameter + 4, h = 2.5);
    }
    translate([0, 0, -1])
    {
      cube([9, 52, 4.2], center = true);
      cube([52, 9, 4.2], center = true);
    }
    cylinder(d = 8, h = 1.7);
    cylinder(d = 3, h = 20);
    translate([16, 0, 0])
      cylinder(d = 2, h = 20);
    translate([16 - 3, 0, 0])
      cylinder(d = 2, h = 20);
    translate([16 - 3 - 3, 0, 0])
      cylinder(d = 2, h = 20);
    translate([0, 0, -20 + 1.1])
      cylinder(d = 15, h = 20);
  }
}

module IconCaptureMotorMount()
{
  difference()
  {
    hull()
    {
      cylinder(d = 25, h = 25);
      translate([-15, 4, 0])
        cube([30, 20, 25]);
    }
    cylinder(d = 21.2, h = 4);
    translate([8, 0, 0])
      cylinder(d = 3.4, h = 9);
    translate([-8, 0, 0])
      cylinder(d = 3.4, h = 9);
    rotate(30, [0, 0, 1])
      cylinder(d = 6.3, h = 30, $fn = 6);
    translate([0, 11.5, 25/2])
      cube([50, 15.2, 15.2], center = true);
    translate([10, 11.5, 0])
      cylinder(d = 3.0, h = 30);
    translate([-10, 11.5, 0])
      cylinder(d = 3.0, h = 30);
    translate([0, -8, 0])
      cylinder(d = 3.4, h = 30);
    translate([0, -8, 25 - 5])
      cylinder(d = 6.3, h = 5);
  }
}

module AxleSpacer($Inner = 5.2, $Outer = 8, $L = 20)
{
  difference()
  {
    cylinder(d = $Outer, h = $L);
    cylinder(d = $Inner, h = $L);
  }
}

module ArmMotorMount($FrontBack = 2, $BearingType = 1, $SLotD = 4.2)
{
  difference()
  {
    //Main body
    RoundedBlock($XDim = 52, $YDim = 52, $ZDim = 100, $CurveD = 4);
    //Pillar opening
    cube([32.5, 32.5, 100], center = true);
    //Motor mount holes
    translate([10, 0, 0])
      rotate(90, [0, 1, 0])
      {
        rotate(-30, [0, 0, 1])
          RevMountPattern($D = 3.2, $H = 20, $R = 16, $Count = 2);
        rotate(-210, [0, 0, 1])
          RevMountPattern($D = 3.2, $H = 20, $R = 16, $Count = 2);
      }
    //Countersinks
    translate([6.5 + 3.5, 0, 0])
      rotate(90, [0, 1, 0])
      {
        rotate(-30, [0, 0, 1])
          RevMountPattern($D = 6.5, $H = 10, $R = 16, $Count = 2);
        rotate(-210, [0, 0, 1])
          RevMountPattern($D = 6.5, $H = 10, $R = 16, $Count = 2);
      }
    //Motor collar opening
    rotate(90, [0, 1, 0])
      cylinder(d = 23.5, h = 30);
      
    //Support bearing
    translate([-18.5, 0, 0])
      rotate(90, [0, 1, 0])
        rotate(90, [0, 0, 1])
      {
        if ($BearingType ==1)
        {
          Rev5mmHexBearingBlock($BoltHeight = 20, $Cutout = 1);
        }
        else
        {
          cylinder(d = 8.1, h = 30, center = true);
          translate([0, 0, 2.3 - 2.5])
            cylinder(d = 20, h = 30);
        }
      }
      
    //Grub screw access
    translate([23.6, 0, 0])
      rotate(90, [1, 0, 0])
        cylinder(d = 3.5, h = 50);
      
    //Fixing slots
    $SlotL = 13;
    //Top Bottom
    translate([0, 0, 36])
      rotate(90, [0, 1, 0])
        Slot($Width = $SLotD, $Length = $SlotL, $Height = 70, $Centered = 1);
    translate([0, 0, -36])
      rotate(90, [0, 1, 0])
        Slot($Width = $SLotD, $Length = $SlotL, $Height = 70, $Centered = 1);
    //Left
    translate([0, -8, 36 - 8])
      rotate(90, [0, 1, 0])
        Slot($Width = $SLotD, $Length = $SlotL, $Height = 70, $Centered = 1);
    translate([0, -8, -36 + 8])
      rotate(90, [0, 1, 0])
        Slot($Width = $SLotD, $Length = $SlotL, $Height = 70, $Centered = 1);
    //Right
    translate([0, 8, 36 - 8])
      rotate(90, [0, 1, 0])
        Slot($Width = $SLotD, $Length = $SlotL, $Height = 70, $Centered = 1);
    translate([0, 8, -36 + 8])
      rotate(90, [0, 1, 0])
        Slot($Width = $SLotD, $Length = $SlotL, $Height = 70, $Centered = 1);
    
    //Chop down if only need front or back
    if ($FrontBack == 1)
    {
      translate([-16, 0, 0])
        cube([60, 60, 120], center = true);
    }
    else if ($FrontBack == 2)
    {
      translate([16, 0, 0])
        cube([60, 60, 120], center = true);
    }
  }
  
  /*
  translate([62, 0, 0])
    rotate(-90, [0, 1, 0])
    {
      HDAndGearbox($Stages = 2);
    }
  */
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

module ArmHopper1()
{
  translate([0, 65, 0])
  {
    //Center origin on rotation point
    translate([5, 0, -35])
      rotate(-90, [0, 0, 1]) 
        FreightIntakeBox($Extend = 0, $DoTipper = 0, $HingeCountStart = 0, $HingeCountStop = 6, $TipperExtension = 5, $DoPushoutServo = 0);
    //Axis indicator
    rotate(-90, [1, 0, 0]) 
  #    cylinder(d = 5, h = 400, center = true);  
  }
}

module ServoArmGrabberBase()
{
  difference()
  {
    //Main body
    union()
    {
      //Grabber servo block
      translate([-10, 0, 6])
        RoundedBlock($XDim = 60, $YDim = $ServoSpacing + 20, $ZDim = 10, $CurveD = 4);
      //Rotation servo attatch block
      translate([-49 - ($RotateExtension / 2), 16, 17])
        intersection()
        {
          RoundedBlock($XDim = 50 + $RotateExtension, $YDim = 14, $ZDim = 32, $CurveD = 4);
          union()
          {
            translate([7, 0, 0])
              cube([50 + $RotateExtension - 14, 14, 32], center = true);
            translate([-14, 0, 0])
              rotate(90, [1, 0, 0])
                cylinder(d = 32, h = 14, center = true);
          }
        }
      //Rotation supports
      translate([-53 - ($RotateExtension / 2), ($ServoSpacing + 20 - 10) / 2, 14])
        RoundedBlock($XDim = 30 + $RotateExtension, $YDim = 10, $ZDim = 26, $CurveD = 4);
      mirror([0, 1, 0])
        translate([-53 - ($RotateExtension / 2), ($ServoSpacing - 10) / 2, 14])
          RoundedBlock($XDim = 30 + $RotateExtension, $YDim = 10, $ZDim = 26, $CurveD = 4);
      //Distance sensor block
      translate([0, 0, 18])
        RoundedBlock($XDim = 5, $YDim = 42, $ZDim = 19, $CurveD = 4);
    }
    //Grabber servo cutouts
    translate([0, $ServoSpacing / 2, -2])
      rotate(180, [1, 0, 0])
        StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 15, $DoHoles = true, $ServoMountHoleDiameter = 3.9, $ServoMountHoleLength = 40, $HolesOffset = 10);  
    translate([0, -$ServoSpacing / 2, -2])
      rotate(180, [1, 0, 0])
        StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 15, $DoHoles = true, $ServoMountHoleDiameter = 3.9, $ServoMountHoleLength = 40, $HolesOffset = 10);  
    //Rotation servo clearance
    translate([-40, -11, 0])
      cube([14, 20, 20]);
    //Rotation servo attatch
    translate([-60-$RotateExtension, 9, 17])
    {
      rotate(90, [1, 0, 0])
        RoundMetalServoHornCutout();
      translate([0, ($ServoSpacing + 20 - 10) / 2, 0])
        rotate(90, [1, 0, 0])
          cylinder(d = 4.4, h = 20);
      mirror([0, 1, 0])
        translate([0, ($ServoSpacing + 20 - 10) / 2, 0])
          rotate(90, [1, 0, 0])
            cylinder(d = 4.4, h = 40, center = true);
    }
    //Sensor mount holes
    translate([0, 16, 11 + 8])
      rotate(90, [0, 1, 0])
        cylinder(d = 4, h = 10, center = true);
    translate([0, -16, 11 + 8])
      rotate(90, [0, 1, 0])
        cylinder(d = 4, h = 10, center = true);
  }
}

module ArmDriveSprocket($RealSprocket = 1, $Teeth = 40, $InnerD = 27.8, $OuterD = 32, $AxleD = 4.8)//4.8 = D shaft axle
{
  //32T = 37R
  //40T = 44R
  
//  translate([-14, -20.5 + 2.5, -50])
//#  cube([28, 28, 100]);
  difference()
  {
    union()
    {
      translate([0, -11, 0])
      {
        rotate(90, [1, 0, 0])
        {
          translate([0, 0, -18.5 + 15 + (($InnerD - 15 - 2.794) / 2)])// Center the sprocket on the remaining space
          {
            if ($RealSprocket == 1)
              sprocket(size = 25, teeth = $Teeth, bore = .5, hub_diameter = 1, hub_height = 0.0, guideangle = 25); 
            else
              cylinder(d = $Teeth * 2 * 1.1, h = 2.794);
          }
          translate([0, 0, -18.5])
          {
            difference()
            {
              cylinder(d = $Teeth * 1.7, h = $InnerD);
              translate([-50, 7.5 - 15, 0])
                cube([100, 80, 15.5]);
            }
          }
        }
      }
    }
    //Main axle
    rotate(90, [1, 0, 0])
      cylinder(d = $AxleD, h = 60, center = true);
    
    //Horizontal bolts
    translate([-24, -7.5 + 11, 0])
      rotate(90, [1, 0, 0])
      {
        cylinder(d = 3.2, h = 20);
        translate([0, 0, 20 - 3])
          cylinder(d = 6.5, h = 20);
      }
    translate([24, -7.5 + 11, 0])
      rotate(90, [1, 0, 0])
      {
        cylinder(d = 3.2, h = 20);
        translate([0, 0, 20 - 3])
          cylinder(d = 6.5, h = 20);
      }
    //Undercut bolts
    translate([20, 0, 0])
      cylinder(d = 3.2, h = 100, center = true);
    translate([-20, 0, 0])
      cylinder(d = 3.2, h = 100, center = true);
    translate([20, 0, -100 + 3.5 - 20])
      cylinder(d = 6.4, h = 100);
    translate([-20, 0, -100 + 3.5 - 20])
      cylinder(d = 6.4, h = 100);
  }
}



/////////////////////////////////////////////
// Still to sort
/////////////////////////////////////////////

module ArmUpperSupport()
{
  rotate(90, [1, 0, 0])
    cylinder(d = 5, h = 20, center = true);
}


module RotationClearance($VSpacing = 50, $HSpacing = 20)
{
  rotate(90, [1, 0, 0])
    hull()
    {
      cylinder(d = 5, h = 50, center = true);
      translate([-$HSpacing, -$VSpacing / 2, 0])
        cylinder(d = 5, h = 50, center = true);
      translate([-$HSpacing, $VSpacing / 2, 0])
        cylinder(d = 5, h = 50, center = true);
    }
}

module RedScareIconV4Core()
{
  if ($Type == 0)
  {
    cube([$CoreD, $CoreD, $CoreD], center = true);
  }
  else if ($Type == 1)
  {
    cylinder(d = $CoreD, h = $CoreD, center = true);
    rotate(90, [1, 0, 0])
      cylinder(d = $CoreD, h = $CoreD, center = true);
    rotate(90, [0, 1, 0])
      cylinder(d = $CoreD, h = $CoreD, center = true);
  }
  else if ($Type == 2)
  {
    sphere(d = $CoreD + 20);
  }
}

module RedScareIconV4()
{
  $XDim = 4.2 * 25.4;
  $YDim = 3.5 * 25.4;
  $ZDim = 3.5 * 25.4;
  $CoreD = 75;
  $CoreShaft = 55;
  $StrutD = 15;
  
  $Angle1 = 50.2;
  $Angle2 = 57.3;
  
  intersection()
  {
    union()
    {
//      translate([0, -($YDim / 2) + 10, -($YDim / 2)])
      translate([0, -($CoreD / 2) - 2, -($YDim / 2)])
        scale([.92, 1.0, .7])
          RedScareText();
          
      difference()
      {
        union()
        {
          RedScareIconV4Core();
          rotate($Angle1, [0, 0, 1])
            rotate($Angle2, [1, 0, 0])
              cylinder(d = $StrutD, h = 200, center = true);
          rotate(-$Angle1, [0, 0, 1])
            rotate($Angle2, [1, 0, 0])
              cylinder(d = $StrutD, h = 200, center = true);
          rotate($Angle1, [0, 0, 1])
            rotate(-$Angle2, [1, 0, 0])
              cylinder(d = $StrutD, h = 200, center = true);
          rotate(-$Angle1, [0, 0, 1])
            rotate(-$Angle2, [1, 0, 0])
              cylinder(d = $StrutD, h = 200, center = true);
        }
        cylinder(d = $CoreShaft, h = 120, center = true);
        rotate(90, [1, 0, 0])
          cylinder(d = $CoreShaft, h = 120, center = true);
        rotate(90, [0, 1, 0])
          cylinder(d = $CoreShaft, h = 120, center = true);
      }
    }
    cube([$XDim, $YDim, $ZDim], center = true);
  }
}
  
  //Display items
/*

  //Rotation servo
  translate([-60, 0, 17])
    rotate(-90, [1, 0, 0])
      StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 15, $DoHoles = true, $ServoMountHoleDiameter = 3.9, $ServoMountHoleLength = 30);  

    
  //Grabber servos
  translate([0, $ServoSpacing / 2, 0])
    rotate(180, [1, 0, 0])
      StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 15, $DoHoles = true, $ServoMountHoleDiameter = 3.9, $ServoMountHoleLength = 30);  
  translate([0, -$ServoSpacing / 2, 0])
    rotate(180, [1, 0, 0])
      StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 15, $DoHoles = true, $ServoMountHoleDiameter = 3.9, $ServoMountHoleLength = 30);  
  
  //Axis indicator
//  rotate(-90, [1, 0, 0]) 
//#    cylinder(d = 5, h = 400, center = true);  

*/

module AxleBearingCutout()
{
  rotate(90, [1, 0, 0])
  {
    cylinder(d = 22, h = 6.75);
    cylinder(d = 8.2, h = 9.7);
    translate([8, 0, 0])
      cylinder(d = 4, h = 40, center = true);
    translate([-8, 0, 0])
      cylinder(d = 4, h = 40, center = true);
    translate([0, 8, 0])
      cylinder(d = 4, h = 40, center = true);
    translate([0, -8, 0])
      cylinder(d = 4, h = 40, center = true);
  }
}

module AxleBearingHexCutout()
{
  rotate(90, [1, 0, 0])
  {
    cylinder(d = 21.2, h = 6.75);
    cylinder(d = 12.4, h = 6.75 + 1.1);
    cylinder(d = 9.2, h = 6.75 + 4.6);
    translate([8, 0, 0])
      cylinder(d = 3.2, h = 40, center = true);
    translate([-8, 0, 0])
      cylinder(d = 3.2, h = 40, center = true);
    translate([0, 8, 0])
      cylinder(d = 3.2, h = 40, center = true);
    translate([0, -8, 0])
      cylinder(d = 3.2, h = 40, center = true);
  }
}

module ArmPylonSupport()
{
  $StubHeight = 30;
  $BlockWidth = 36;
  $BlockDepth = 46;
  $ChannelOuter = 32.6;
  $ChannelInner = 27.5;
  $BlockHeight = 120;
  
  difference()
  {
    translate([-$BlockWidth / 2, -$BlockDepth / 2, -45 - $StubHeight])
    {
      difference()
      {
        cube([$BlockWidth, $BlockDepth, $BlockHeight + $StubHeight]);
        translate([($BlockWidth - $ChannelOuter) / 2, ($BlockDepth - $ChannelOuter) / 2, 0])
          cube([$ChannelOuter, $ChannelOuter, $StubHeight]);
      }
      //Channel inner plug
      translate([($BlockWidth - $ChannelInner) / 2, ($BlockDepth - $ChannelInner) / 2, 0])
      {
        intersection()
        {
          cube([$ChannelInner, $ChannelInner, $StubHeight]);
          translate([$ChannelInner / 2, $ChannelInner / 2, 0])
            cylinder(d = 36, h = $StubHeight, $fn = 150);
        }
      }
    }
    //Arm opening
    translate([-30, -2, -30])
      cube([60, 17, $BlockHeight - 20]);
    //Sprocket opening
    translate([-30, - 15, -40])
      cube([60, 13, 82]);
    //Drive "bearing" openings
    translate([0, -15, 0])
      AxleBearingCutout();
    translate([0, 15, 0])
      rotate(180, [1, 0, 0])
        AxleBearingCutout();
    //Support arm "bearing" openings
    translate([8, 0, 48])
      rotate(90, [1, 0, 0])
        cylinder(d = 3.2, h = 100, center = true);
    //Channel for lower arm clearance
    translate([0, 6.5, 0])
      rotate(83, [0, 1, 0])
        Extrusion($Size = 17, $Length = 100, $Offset = 0);
    translate([10, 6.5, 0])
      rotate(83, [0, 1, 0])
        Extrusion($Size = 17, $Length = 100, $Offset = 0);
  }
  //Print support aids
  translate([($BlockWidth / 2) - 5, -2.8, (-$BlockHeight - $StubHeight) / 2])
    cube([5, .8, $StubHeight]);
  translate([-$BlockWidth / 2, -$ChannelInner / 2, (-$BlockHeight - $StubHeight) / 2  ])
    cube([7, $ChannelInner, .8]);
}

module ArmMotorDriveSprocket($RealSprocket = 1)
{
  difference()
  {
    if ($RealSprocket == 1)
      sprocket(size = 25, teeth = 16, bore = 0, hub_diameter = 1, hub_height = 0.444, guideangle = 25); 
    else
      cylinder(d = 16 * 2 * 1.1, h = 2.794);
    translate([0, 0, 11.3])
    rotate(90, [1, 0, 0])
      AxleBearingHexCutout();
  }
}

module RobotArm()
{
  $RealSprocket = 0;
//  $ArmAngle = $t*360;
  $ArmAngle = 0; //82 to -52 => range ~ 650mm = 25". Can scale arm lengths as necessary
  
  $ArmSize = 15;
  $ArmSpacing = 40;
  $ArmCentersLength = 363;
  $VerticalSpacing = 48;
  $HorizontalSpacing = 8;
  
  $DriveMotorOffset = 4.454508478712505 * 25.4; //Calculated at https://botlanta.org/converters/dale-calc/sprocket.html, 32/16/60
  
//  translate([0, -16 + 7.5 + ((32 - 27.8) / 2), 150])
//    cube([32, 32, 300], center = true);

  translate([0, 0, 8.4*25.4])
  {
    //Arm pylon support
    translate([0, 7.5 - (27.8 / 2), 0])
      ArmPylonSupport();
    //Lower drive arm
    rotate($ArmAngle, [0, 1, 0])
    {
      ArmDriveSprocket($RealSprocket = 1, $Teeth = 36);
      Extrusion($Size = 15, $Length = 420, $Offset = 50);
    }
    //Upper stabilizer arm
    translate([$HorizontalSpacing, 0, $VerticalSpacing])
      rotate($ArmAngle, [0, 1, 0])
        Extrusion($Size = 15, $Length = 420, $Offset = 50);
    
    //Motor drive sprocket
    translate([0, 0, -$DriveMotorOffset])
      rotate(90, [1, 0, 0])
      if ($RealSprocket == 1)
        sprocket(size = 25, teeth = 16, bore = .5, hub_diameter = 1, hub_height = 0.5, guideangle = 25); 
      else
        cylinder(d = 16 * 2 * 1.1, h = 2.794);

  }
//          ArmHopper1();
//          ArmHopper2();
//    ArmUpperSupport();
}

module QuadHoles()
{
    translate([-$HSpace / 2, - $VSpace / 2, 0])
      cylinder(d = $D, h = $H);
    translate([$HSpace / 2, - $VSpace / 2, 0])
      cylinder(d = $D, h = $H);
    translate([-$HSpace / 2,  $VSpace / 2, 0])
      cylinder(d = $D, h = $H);
    translate([$HSpace / 2,  $VSpace / 2, 0])
      cylinder(d = $D, h = $H);
}

module CChannelCarriage()
{
  $VerticalCenter = 22;
  $HorizontalCenter = 48 - 16;
  $OuterDiameter = 13;
  $FrameThickness = 5;
  $MountHoleDiameter = 4.1;
  
  if ($Type == 1)
  {
    difference()
    {
      hull()
        QuadHoles($D = $OuterDiameter, $H = $FrameThickness, $VSpace = $VerticalCenter, $HSpace = $HorizontalCenter);
      translate([0, 0, -0.1])
        QuadHoles($D = $MountHoleDiameter, $H = $FrameThickness + .2, $VSpace = $VerticalCenter, $HSpace = $HorizontalCenter);
    }
  }
  else 
  {
    difference()
    {
      translate([0, -6, 0])
        hull()
          QuadHoles($D = $OuterDiameter, $H = $FrameThickness, $VSpace = $VerticalCenter + 12, $HSpace = $HorizontalCenter);
      translate([0, 0, -0.1])
        QuadHoles($D = $MountHoleDiameter, $H = $FrameThickness + .2, $VSpace = $VerticalCenter, $HSpace = $HorizontalCenter);
      translate([-$HorizontalCenter / 2, -($VerticalCenter / 2) - 14, -0.1])
        cylinder(d = $MountHoleDiameter, h = $FrameThickness + .2);
      translate([$HorizontalCenter / 2, -($VerticalCenter / 2) - 14, -0.1])
        cylinder(d = $MountHoleDiameter, h = $FrameThickness + .2);
    }
  }
}

module ChannelCarriageBearings()
{
  $Spacing = ($Type == 1) ? 2.5 : 0;
  
  color("lightgray")
  {
    translate([16, 11, 5 + $Spacing])
      cylinder(d = 10, h = 5);
    translate([-16, 11, 5 + $Spacing])
      cylinder(d = 10, h = 5);
    translate([16, 11 - 22, 5])
      cylinder(d = 10, h = 5);
    translate([-16, 11 - 22, 5])
      cylinder(d = 10, h = 5);
  }
}

module CChannelCarriageWithBearings()
{
    CChannelCarriage($Type = $Type);
    ChannelCarriageBearings($Type = $Type);
}

module CChannelSliderSection()
{
    translate([0, 1, 0])
    {
      color("silver")
        CChannel($Length = $L);
    }
    translate([$L - 24, 30, -5])
      CChannelCarriageWithBearings($Type = 2);
    translate([$L - 24, 30, 53])
      mirror([0, 0, 1])
        CChannelCarriageWithBearings($Type = 2);
}

module CChannelLifterStage1($Length)
{
  rotate(-90, [0, 1, 0])
  {
    CChannelSliderSection($L = $Length);
      translate([24, -6, -5])
        CChannelCarriageWithBearings($Type = 1);
    translate([24, -6, 53])
      mirror([0, 0, 1])
        CChannelCarriageWithBearings($Type = 1);    
  }
}

module CChannelLifter()
{
  $Section1Travel = 100;
  $Section2Travel = 120;
  
  color("silver")
    rotate(-90, [0, 1, 0])
      CChannel($Length = 200);
  translate([0, 12, $Section1Travel])
    CChannelLifterStage1($Length = 150);
  translate([0, 35, $Section1Travel + $Section2Travel])
    rotate(-90, [0, 1, 0])
      CChannelSliderSection($L = 200);
}

module CChannelPulleyBlock($Help = false)
{
  $BlockXDim = 22;
  $BlockZDim = 22;
  if ($Help)
  {
    //C-Channel visual guide
    color("silver")
      translate([24, -12, -24])
        rotate(-90, [0, 1, 0])
          CChannel($Length = 50);

    translate([0, 8, 0])
      PulleyWheel();
  }
  
  difference()
  {
    translate([-$BlockXDim / 2, 0, -$BlockZDim / 2])
      cube([$BlockXDim, 15, $BlockZDim]);
    //Corner alligned mount holes
    translate([-16 / 2, -0.5, -16 / 2])
      rotate(-90, [1, 0, 0])
        cylinder(d = 3.0, h = 20);
    translate([16 / 2, -0.5, -16 / 2])
      rotate(-90, [1, 0, 0])
        cylinder(d = 3.0, h = 20);
    translate([-16 / 2, -0.5, 16 / 2])
      rotate(-90, [1, 0, 0])
        cylinder(d = 3.0, h = 20);
    translate([16 / 2, -0.5, 16 / 2])
      rotate(-90, [1, 0, 0])
        cylinder(d = 3.0, h = 20);
    //Pulley channel
    hull()
    {
      translate([0, 8, 0])
        rotate(90, [0, 1, 0])
          cylinder(d = 13, h = 4.5, center = true);
      translate([0, 8, -10])
        rotate(90, [0, 1, 0])
          cylinder(d = 13, h = 4.5, center = true);
    }   
    //Cable port
    translate([0, 8, 10])
      cube([2, 13, 20], center = true);
    //Pulley shaft
    translate([0, 8, 0])
      rotate(90, [0, 1, 0])
        cylinder(d = 3.1, h = 40, center = true);
  }
  
}

module CChannelPulleyCapper($Help = false)
{
  if ($Help)
  {
    //C-Channel visual guide
    color("silver")
      translate([-24, 0, 0])
        rotate(90, [0, 1, 0])
          CChannel($Length = 40);

    translate([0, 7.5, 6])
      PulleyWheel();
  }

  difference()
  {
    union()
    {
      //Outer cap
      translate([-47 / 2, 0, 0])
        cube([47, 12, 12]);
      //Inner aligner
      translate([-42.7 / 2, 0, -12])
        cube([42.7, 9.5, 12]);
    }
    //Pulley channel
    translate([0, 7.5, 6])
    {
      rotate(90, [0, 1, 0])
        hull()
        {
          cylinder(d = 13.6, h = 4.8, center = true);
          translate([6, 10, 0])
            cylinder(d = 13.6, h = 4.8, center = true);
        }
    }
    translate([0, -1.5, -4])
      cube([3, 10, 25], center = true);
    
    //Pulley shaft hole
    translate([0, 7.5, 6])
      rotate(90, [0, 1, 0])
        cylinder(d = 3.1, h = 50, center = true);


    //Attatch fixing holes
    //Side
    translate([10.5, 4, -8.3])
      rotate(90, [0, 1, 0])
        cylinder(d = 3.0, h = 12, $fn = 20);
    translate([-10.5, 4, -8.3])
      rotate(-90, [0, 1, 0])
        cylinder(d = 3.0, h = 12, $fn = 20);
    //Front
    translate([8, -5, -8.3])
      rotate(-90, [1, 0, 0])
        cylinder(d = 3.0, h = 20, $fn = 20);
    translate([-8, -5, -8.3])
      rotate(-90, [1, 0, 0])
        cylinder(d = 3.0, h = 20, $fn = 20);
  }
  
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

module PulleyGaurd()
{
  $SpindleCutout = 24;
  $SlotCutout = 30;
  $SideWall = 8;
  $TopWall = 2;
  $BackWall = 2;
  $Outer = 22;
  $Inner = $Outer - $SideWall - $SideWall;
  $DoAttach = false;
  $Height = 65;
  
  difference()
  {
    union()
    {
      translate([-$Outer / 2, -24, 0])
        cube([$Outer, 48, $Height]);
      if ($DoAttach)
      {
        translate([-6, 24 - 3, $Height])
          cube([12, 3, 12]);
      }
    }
    translate([-$Inner / 2, -24 - $BackWall, -$TopWall])
      cube([$Inner, 48, $Height]);
    
    hull()
    {
      translate([0, 0, 23])
        rotate(90, [0, 1, 0])
          cylinder(d = $SpindleCutout, h = 30, center = true);
      translate([0, 0, -23])
        rotate(90, [0, 1, 0])
          cylinder(d = $SpindleCutout, h = 30, center = true);
    }
    translate([0, 20, $Height + 6])
      rotate(-90, [1, 0, 0])
        cylinder(d = 3.4, h = 10);
    
    translate([-2, -(48 / 2) - 0.1, $Height - $TopWall - 1])
      cube([4, $SlotCutout, $TopWall + 5]);
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

module BoundingBox()
{
  color([0.9, 0.9, 0.9, 0.3])
    translate([-9 * $Inch2mm, 0, 0])
      cube([18 * $Inch2mm, 18 * $Inch2mm, 13.5 * $Inch2mm]);
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

module PixelFloorPickerO1MountBlockHolesOld(d = $M4ThreadedD, h = 30)
{
  //Plate mount holes
  translate([-4, 4, -1])
    cylinder(d = d, h = h);
  translate([-4 - 32, 4, -1])
    cylinder(d = d, h = h);
  translate([-4, 4 + 64, -1])
    cylinder(d = d, h = h);
  translate([-4 - 32, 4 + 64, -1])
    cylinder(d = d, h = h);
}

module PixelFloorPickerO1MountBlockHoles(d = $M4ThreadedD, h = 30)
{
  //Plate mount holes
  translate([-4, 5 + 4 + 16, -1])
    cylinder(d = d, h = h);
  translate([-4 - 24 , 4 + 5 + 16, -1])
    cylinder(d = d, h = h);
//  translate([-4, 4 + 64, -1])
//    cylinder(d = d, h = h);
//  translate([-4 - 32, 4 + 64, -1])
//    cylinder(d = d, h = h);
}

module PixelFloorPickerO1MountBlockOld()
{
  translate([0, -72 / 2, -40 / 2])
  {
    difference()
    {
      cube([11, 72, 40]);
      rotate(90, [0, 1, 0])
      {
        PixelFloorPickerO1MountBlockHoles();
        //Bearing nut holes
        translate([-4, 4 + 16, 4])
          cylinder(d = 8.5, h = 8);
        translate([-4 - 32 + 8, 4 + 16, 4])
          cylinder(d = 8.5, h = 8);
        translate([-4, 4 + 64 - 16, 4])
          cylinder(d = 8.5, h = 8);
        translate([-4 - 32 + 8, 4 + 64 - 16, 4])
          cylinder(d = 8.5, h = 8);
      }
    }
//    translate([16, 130, 16])
//    cube([10, 200, 18], center = true);
  }
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
                      SpindleCore(InnerD = 30, OuterD = 34, Height = $PixelFloorPickerO1SpindleHeight, RimHeight = .5, SlopeSpan = 1, ShaftD = 0, ShaftFaces = 6, ThreadD = 3);
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
              cylinder(d = $PixelFloorPickerO1ShaftDSnug, h = 100, $fn = 6, center = true); 
      
      /*
      //Upper plate clearance cutout small
      translate([0, 112, 230])
        rotate(90, [0, 1, 0])
          cylinder(d = 400, h = 10, center = true);
          
      //Upper plate clearance cutout extended
      translate([0, 40, 525])
        rotate(90, [0, 1, 0])
          cylinder(d = 1000, h = 10, center = true);
        */  
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
  PixelFloorPickerO1DriveGearFixHub(Depth = 9,ShaftD = $PixelFloorPickerO1ShaftDSnug, ShaftShape = 1, DoGub = true, GrubNut = 0, Hub = 20)
    pfeilrad (modul=1, zahnzahl=54, breite=$PixelFloorPickerO1DriveGearThickness, bohrung=10, eingriffswinkel=20, schraegungswinkel=30, optimiert=true);
}

module PixelFloorPickerO1DriveGearBottom()
{
  mirror([0, 1, 0])
    PixelFloorPickerO1DriveGearFixHub(Depth = 9,ShaftD = $PixelFloorPickerO1ShaftDSnug, ShaftShape = 1, DoGub = true, GrubNut = 0, Hub = 20)
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
      translate([0, 0, 2])
        cylinder(d1 = 16.6, d2 = 15.9, h = 15);
      cylinder(d = 21, h = 2);
    }
    cylinder(d = $PixelFloorPickerO1ShaftDSnug, h = 20, $fn = 6);
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
 
module DroneLauncherCarriage()
{
  difference()
  {
    //Core
    translate([($DroneLauncherL / 2), 0, 4])
      cube([$DroneLauncherL - 0.1, 40, 35], center = true);
    //Drone cutout
    translate([($DroneLauncherL / 2) - 2, 0, 23])
      cube([$DroneLauncherL - 0.1, 35, 30], center = true);
    //Front extension cutout
    translate([$DroneLauncherExtensionCutout / 2, 0, -9.5])
      cube([$DroneLauncherExtensionCutout, 45, 30], center = true);
    //Elastic hook holes
    translate([$DroneLauncherExtensionCutout + 50, 10, -34.5 + 15])
        cylinder(d = 3, h = 20);
    translate([$DroneLauncherExtensionCutout + 50, -10,  -34.5 + 15])
        cylinder(d = 3, h = 12);
    //Launch release
    translate([$DroneLauncherL, -6, 12])
      cube([7, 12, 10]);
    //Rail slider
    translate([$DroneLauncherL / 2, 0, -1])
      cube([$DroneLauncherL, $DroneLauncherRailW + $DroneLauncherCarriageClearance, $DroneLauncherRailW + $DroneLauncherCarriageClearance], center = true);
  }
  //Inside guides
  difference()
  {
    translate([($DroneLauncherL / 2), 0, 9])
      cube([$DroneLauncherL - 0.1, 10, 5], center = true);
    translate([($DroneLauncherL / 2), 0, 15])
    rotate(45, [1, 0, 0])
      cube([$DroneLauncherL, 10, 10], center = true);

  }
  
}
 
module DroneLauncherCap()
{
  difference()
  {
    //Core
    translate([5, 0, 5])
      cube([20, $DroneLauncherRailW + 12, $DroneLauncherRailW + 25], center = true);
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
    translate([8, 0, 0])
      rotate(90, [1, 0, 0])
        cylinder(d = $M4ThreadedD, h = 40, center = true);
    //Latch cutout
    translate([5, 0, 19])
      cube([21, 6, 20], center = true);
  }
}
 
module DroneLauncharTrigger()
{
  rotate(90, [1, 0, 0])
    difference()
    {
      linear_extrude(height = 5,  center = true, convexity = 10, twist = 0)
        polygon([[-3, 5], [-13, 14], [-20, 14], [-19, 11], [-23, 11], [-25, 19],[-5, 19],[5, 12],[25, 12],[25, 5]]);
      translate([0, 10, 0])
        cylinder(d = $M4NonThreadedD, h = 20, center = true);
    }
}
 
module DroneLauncherFrontCap()
{
  rotate(180, [0, 0, 1])
    difference()
    {
      DroneLauncherCap();
      translate([0, 0, 15])
        cube([50, 50, 20], center = true);
    }
}

module DroneLauncher()
{
  color("lightgray")
    DroneLauncherRailProfile(Width = $DroneLauncherRailW, Height = $DroneLauncherRailW, Thickness = $DroneLauncherRailThickness, Length = $DroneLauncherRailL);
  //Rear cap
  translate([$DroneLauncherRailL - 5, 0, 0])
    DroneLauncherCap();
  //Front cap
  translate([0, 0, 0])
    DroneLauncherFrontCap();
  //Launch carriage
  translate([117, 0, 1])
    DroneLauncherCarriage();
  //Trigger
  translate([$DroneLauncherRailL + 3, 0, 9])
    DroneLauncharTrigger();
}

module DroneLauncherPrint()
{
  translate([100, 10, 15])
    rotate(90, [0, 1, 0])
      DroneLauncherCap();
  translate([10, 10, 13.5])
    DroneLauncherFrontCap();
  translate([-15, 50, 13.5])
    DroneLauncherCarriage();
  translate([50, 20, 2.5])
    rotate(90, [1, 0, 0])
      DroneLauncharTrigger();
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

/*
#translate([-300, 0, 0])
  cube([17*25.4, 1, 17.5*25.4]);
RobotArm();
*/


module IntakeRoller(d = 22, l = 240)
{
  rotate(90, [1, 0, 0])
    cylinder(d = d, h = l, center = true);
}

module SmallRoborBounds()
{
  translate([0, -(17 * $Inch2mm / 2), 0])
    cube([17 * $Inch2mm, 17 * $Inch2mm, 13 * $Inch2mm]);
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
  translate([0, (l + 4) / 2, 0])
    HopperOpening(wl = wl, wu = wu, l = l, h = h);
  translate([0, -((l + 4) / 2), 0])
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
  
  //Center around the hinge for the moment : ToDo need to fix this
  translate([(hopperhingeblocksize + hopperupperwidth) / 2, 0, (hopperhingeblocksize / 2) - hopperheight])
  {
    difference()
    {
      union()
      {
        //Outer frame
        HopperOpening(wl = hopperlowerwidth + (hopperwallthickness * 2), wu = hopperupperwidth + (hopperwallthickness * 2), l = DualHopperWidth , h = hopperheight - 0.1);
        translate([-22.3, -21, 21.2])
          ServoMountPillarSet();
      }
      //Pixel cutout
      DualHopperOpening(wl = hopperlowerwidth, wu = hopperupperwidth, l = hoppersinglewidth, h = hopperheight + 1);
      //Linkage mount holes
      //Lower hole
      translate([0, 0, 10])
      {
        rotate(90, [1, 0, 0])
          cylinder(d = $M4NonThreadedD, h = DualHopperWidth + 2, center = true);
        translate([0, 0, 71])
          rotate(90, [1, 0, 0])
            cylinder(d = $M4NonThreadedD, h = DualHopperWidth + 2, center = true);
      }
    }
  }
  
  if (showservo)
  {
    color("purple")
      translate([-7.25, -5.5, -39.75])
        rotate(-90, [1, 0, 0])
          rotate(-90, [0, 0, 1])      
            import("GoBildaServoLoRes.stl");
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

module PixelFloorPickerO2(actuatorangle, supportspacing, position, offset, stages, width)
{
 
  translate([supportspacing, 20, 0])
    mirror([1, 0, 0])
      PixelFloorPickerO2HopperArm(actuatorangle, position, offset, stages, width);
  translate([-supportspacing, 20, 0])
    PixelFloorPickerO2HopperArm(actuatorangle, position, offset, stages, width);
    
  //translate and rotate the hopper about the slider and position arms
  //Move the entire system horizontally wrt slider anchor
  translate([0, 40, 0])
    //Rotate at the slider mount angle
    rotate(-30, [1, 0, 0])
      //Move up the slider
      translate([0, 0, position + 390])
        //Rotate back to robot referenced angle
        rotate(30, [1, 0, 0])  
          //Rotate to the actuator angle
          rotate(-actuatorangle, [1, 0, 0])
            //Move along the actuator arm
            translate([0, 125, 0])
              //Rotate back to robot referenced angle and rotate a little further so pixel slides down the backdrop rather than bounce off it
              rotate(actuatorangle - 20, [1, 0, 0])
                //Base hopper rotation is 90 degrees rotated in Z
                rotate(90, [0, 0, 1])
                {
                  DualHopperBin(showservo = true);
                  DualHopperGate();
                }
    
   
  //Conveyor
  translate([0, 0, 115])
    rotate(35, [1, 0, 0])
      cube([180, 380, 10], center = true);
}

module FullRobotV2(actuatorangle, supportspacing, position, offset, stages, width)
{
  rotate(90, [0, 0, 1])
    DriveBase(FrontOffset = 8, HHoles = 9);
  PixelFloorPickerO2(actuatorangle, supportspacing, position, offset, stages, width);
}

module PixelFloorPickerO2HopperArm(actuatorangle, position, offset, stages, width)
{
  //Linear rail
  translate([0, -10, 80])
    rotate(-30, [1, 0, 0])
      MisumiRailSet(support1 = true, length = 300, stages = stages, position = position, offset = offset, width = width);
 
  rotate(-30, [1, 0, 0]) 
    translate([0, 0, position + (offset * stages)])
      rotate(30, [1, 0, 0])
      {
        //End actuator upper
        translate([0, 190, 320])
          rotate(270 - actuatorangle, [1, 0, 0])
            cube([10, 10, 136]);
        //End actuator lower
        translate([0, 145, 240])
          rotate(270 - (actuatorangle / 1.4), [1, 0, 0])
            cube([10, 10, 153]);
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
 
module MisumiPulleyReturnPlate(showpulley, holespacing, extension, voffset, width)
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
 
module MisumiRailSet(support1 = true, length = 300, stages = 2, position = 100, returnstyle = 0, offset = 0, width)
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
    MisumiPulleyReturnPlate(showpulley = true, extension = returnextension, holespacing = 16, voffset = 15, width = width);
  //Coupler plate
  translate([10, (15/2), 85])
    MisumiPulleyCouplerPlate();
  //Motor mount plate
  translate([10, (15/2), 50])
    MisumiPulleyMotorMountPlate();
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
        cylinder(d = $M3NonThreadedD, h = 4);
      translate([8, 0, -.1])
        cylinder(d = $M3NonThreadedD, h = 4);
      translate([-8, 0, -.1])
        cylinder(d = $M3NonThreadedD, h = 4);
      translate([16, 0, -.1])
        cylinder(d = $M3NonThreadedD, h = 4);
      translate([-16, 0, -.1])
        cylinder(d = $M3NonThreadedD, h = 4);
      //Motor shaft hole
      translate([0, -29, -.1])
        cylinder(d = 9, h = 4);
      //Motor mount holes
      translate([0, -29 + 8, -.1])
        cylinder(d = $M4NonThreadedD, h = 4);
      translate([0, -29 - 8, -.1])
        cylinder(d = $M4NonThreadedD, h = 4);
      translate([8, -29, -.1])
        cylinder(d = $M4NonThreadedD, h = 4);
      translate([-8, -29, -.1])
        cylinder(d = $M4NonThreadedD, h = 4);
     
    }
}
 
module CreateMisumiPlate(show, stages, returnstyle = 0, offset, width)
{
  vspacing = 45;
  hoffset = 15;
  returnextension = (returnstyle == 0) ? ((15/2) + (stages * 16) + (hoffset * (stages - 1)) - 3) :
                                         ((15/2) + (stages * 16) + (hoffset * (stages - 1)) - 13);

  projection(cut = true)
  {
    rotate(90, [0, 1, 0])
    {
      //Return pulley plate
      if (bitset(show, 0))
        MisumiPulleyReturnPlate(showpulley = false, extension = returnextension, holespacing = 16, voffset = 15, width = width);
      //Regular pulley plate
      if (bitset(show, 1))
        MisumiPulleyPlate(showpulley = false, holespacing = 8, extension = 0, offset = offset, width = width);
      //Final 'last' plate that is ties to the carriage and not via a pulley
      if (bitset(show, 2))
        MisumiPulleyPlate(showpulley = false, holespacing = 8, extension = 5, offset = offset, width = width);
      //Coupler plate
      if (bitset(show, 3))
          MisumiPulleyCouplerPlate();
      //Motor mount plate
      if (bitset(show, 4))
        MisumiPulleyMotorMountPlate();
      //8mm centered double spacer
      if (bitset(show, 5))
        MisumiPulleyPlateSpacer(holespacing = 8, width = width, count = 2);
      //16mm centered double spacer
      if (bitset(show, 6))
        MisumiPulleyPlateSpacer(holespacing = 16, width = width, count = 2);
      //8mm centered motor mount spacer
      if (bitset(show, 7))
        MisumiPulleyPlateSpacer(holespacing = 8, width = width, count = 5);
      //8mm centered coupler mount spacer
      if (bitset(show, 8))
        MisumiPulleyPlateSpacer(holespacing = 8, width = width, count = 3);
    }
  }
}

module CreateMisumiPlateSet(stages, returnstyle, offset, width)
{
  vspacing = 45;
  hoffset = 15;
  returnextension = (returnstyle == 0) ? ((15/2) + (stages * 16) + (hoffset * (stages - 1)) - 3) :
                                         ((15/2) + (stages * 16) + (hoffset * (stages - 1)) - 13);

                                         
  projection(cut = true)
    rotate(90, [0, 1, 0])
    {
      //Return plate
      translate([0, -5, -20])
          MisumiPulleyReturnPlate(showpulley = false, extension = returnextension, holespacing = 16, voffset = 15, width = width);
      //'Regular' plate (2 per stage)
      for (i = [0 : stages - 1])
      {
        translate([0, 15 + (vspacing * i), 35])
          MisumiPulleyPlate(showpulley = false, holespacing = 8, extension = 0, offset = offset, width = width);
        translate([0, vspacing - 4 + (vspacing * i), 0])
          rotate(180, [1, 0, 0])
            MisumiPulleyPlate(showpulley = false, holespacing = 8, extension = 0, offset = offset, width = width);
      }
      //Final 'last' plate that is ties to the carriage and not via a pulley
      translate([0, -5, 55])
        MisumiPulleyPlate(showpulley = false, holespacing = 8, extension = 5, offset = offset, width = width);
      //Coupler plate
      translate([0, 5, 80])
        MisumiPulleyCouplerPlate();
      //Motor mount plate
      translate([0, 70, 70])
        MisumiPulleyMotorMountPlate();
    }
}

module CChannelTRail(Holes)
{
  CChannel(Holes = Holes, Depth = 12, Rx = -1, Ry = -1);
  translate([-12.5, 0, -5])
    cube([10, (Holes + 1)*24, 10]);
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

module DriveBase(FrontOffset = 0, BackOffset = 0, HHoles = 7, VHoles = 17)
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
      MecanumWheel();
    translate([((VHoles - 1) * 24), -(48 + 40) / 2, -24])
      MecanumWheel();
    //Wheels, right
    translate([48,((HHoles + 3) * 24) + (48 + 40) / 2, -24])
      MecanumWheel();
    translate([((VHoles - 1) * 24), ((HHoles + 3) * 24) + (48 + 40) / 2, -24])
      MecanumWheel();
  }
}

module DualHopperGate()
{
  //Lower gate
  translate([17, 0, -hopperheight + 2])
    cube([hopperlowerwidth, hoppersinglewidth, 3], center = true);
  //Gate lower support
  hull()
  {
    //Top center
    translate([0, 0, -70])
      cube([3, 4, 4], center = true);
    //Left lower
    translate([5.5, (hoppersinglewidth - 4) / 2, -hopperheight + 2.5])
      cube([3, 4, 4], center = true);
    //right lower
    translate([5.5, -(hoppersinglewidth - 4) / 2, -hopperheight + 2.5])
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

module HopperBaseMount(showservo)
{  
  extrawidth = 10;
  //Base plate
  difference()
  {
    cube([hopperbaseplatewidth + extrawidth, hopperbaseplatethickness, hopperbaseplateheight]);
    //Slider mount holes
    translate([10, 0, hopperbaseplateheight - 5])
    {
      rotate(90, [1, 0, 0])
        {
          cylinder(d = $M3NonThreadedD, h = 10, center = true);
          translate([0, -135, 0])//Spacing of misumi mount holes
            cylinder(d = $M3NonThreadedD, h = 20, center = true);
        }
    }
    //Excess plate pt 1
    translate([30, 0, 0])
      cube([hopperbaseplatewidth - 20 + extrawidth, 10, 45]);
    //Excess plate pt 2
    translate([40, 0, 0])
      cube([hopperbaseplatewidth - 40 - 6, 10, 110]);
  }
  
  //Servo side upper pivot
  translate([hopperedgeoffset - 6, 0, hopperverticaldisplacement - 8 - hopperlinkagebasespacing])
  {
    difference()
    {
      cube([6, 26, 16]);
      translate([0, hopperbackdisplacement, 8])
        rotate(90, [0, 1, 0])
          cylinder(d = $M4NonThreadedD, h = 20, center = true);
    }    
  }
  //Far side upper pivot
  translate([hopperedgeoffset + hopperlinkageseperation, 0, hopperverticaldisplacement - 8])
  {
    difference()
    {
      cube([6, 26, 16]);
      translate([0, hopperbackdisplacement, 8])
        rotate(90, [0, 1, 0])
          cylinder(d = $M4NonThreadedD, h = 20, center = true);
    }    
  }
  //Far side lower pivot
  translate([hopperedgeoffset + hopperlinkageseperation, 0, hopperverticaldisplacement - 8 - hopperlinkagebasespacing])
  {
    difference()
    {
      cube([6, 26, 16]);
      translate([0, hopperbackdisplacement, 8])
        rotate(90, [0, 1, 0])
          cylinder(d = $M4NonThreadedD, h = 20, center = true);
    }    
  }
  
  translate([hopperedgeoffset - 18.2, hopperbackdisplacement - hopperbaseplatethickness, hopperverticaldisplacement - 34])
    rotate(-90, [0, 0, 1])
      ServoMountPillarSet();
  
  if (showservo)
    color("purple")
      translate([hopperedgeoffset - 2, hopperbackdisplacement, hopperverticaldisplacement - 10])
        rotate(90, [0, 1, 0])
          import("GoBildaServoLoRes.stl");

}

module HopperLinkage(length, servo)
{
  difference()
  {
    hull()
    {
      cylinder(d = 12, h = hopperlinkagethickness);
      translate([length, 0, 0])
        cylinder(d = 12, h = hopperlinkagethickness);
    }
    cylinder(d = 3, h = hopperlinkagethickness + 1);
    if (servo)
      cylinder(d = 5.8, h = 3.5);
    else
      cylinder(d = $M4NonThreadedD, h = hopperlinkagethickness + 1);
    translate([length, 0, 0])
      cylinder(d = $M4NonThreadedD, h = hopperlinkagethickness + 1);
  }
}


module BoundingBox()
{
  color([0.9, 0.9, 0.9, 0.3])
    translate([-9 * $Inch2mm, -9 * $Inch2mm, 0])
      cube([18 * $Inch2mm, 18 * $Inch2mm, 13.7 * $Inch2mm]);
}

//translate([0, 40, 0])

//  Pixel("GREEN");

 

//PixelFloorPickerO1Subsystem1();

//PixelFloorPickerO1Subsystem2();

//Display items

//RobotArm();

//Extrusion($Size = 15, $Length = 300, $Offset = 15 / 2);

//Printables
//Grabber pieces
//ServoArmGrabberBase($RotateExtension = 10, $ServoSpacing = 100);
//ArmMotorMount($FrontBack = 1, $BearingType = 0);
//ArmMotorMount($FrontBack = 2, $BearingType = 1);
//ArmDriveSprocket($RealSprocket = 1, $Teeth = 32);
//ArmPylonSupport();
//ArmMotorDriveSprocket();
//RedScareIconV3();
//RedScareIconV4($Type = 2);

//Wheels and drive train
//WheelAxleBlock($WheelAxleBlockAxleOffset = 0, $Style = 1);// 4x
//WheelAxleBlock($WheelAxleBlockAxleOffset = 1.2, $Style = 1);// 4x
//WheelAxleBlock($WheelAxleBlockAxleOffset = 0, $Style = 1, $AdjustLength = 7);// 4x
//WheelSection($Style = 1);//Style 0 = bearings on wheel, style 1 = bearings on supports
//WheelSprocketSection($Style = 1); //Note, style not really critical if used with outer wheel pair
//ChainTensionerPusher();
//ChainTensionerHousingSection();
//ChainSkidPlate();
//DriveMotorMount();
//WheelAxleBlockSplitOuter($WheelAxleBlockAxleOffset = 0);
//WheelAxleBlockSplitInner($WheelAxleBlockAxleOffset = 0, $Style = 0);
//PlanetaryGearChecker();
//FreightIntakeBox($Extend = 50);

//IntakeWheelCoupler();
//IntakeBearingMount(); // not used
//mirror([1, 0,0])
//IntakeRailCarriageBody($HDepth = 0, $ExcentricDiameter = 4.9, $ExcentricHeight = 7, $BearingShaftDiameter = 4.9);//Shaft = 4.9 for non-excentric nut, height = 6 to form pillar

//Left
//IntakeRailCarriageBody($HDepth = 0, $ExcentricDiameter = 7.3, $ExcentricHeight = 0, $BearingShaftDiameter = 4.9, $BeltClamp = 0);//Shaft = 7.3 for excentric nut, height = 0 since using nut
//Right
//mirror([1, 0, 0])
//  IntakeRailCarriageBody($HDepth = 0, $ExcentricDiameter = 7.3, $ExcentricHeight = 0, $BearingShaftDiameter = 4.9, $BeltClamp = 1);//Shaft = 7.3 for excentric nut, height = 0 since using nut
//Left for extended intake
//IntakeRailCarriageBody($HDepth = 0, $ExcentricDiameter = 7.3, $ExcentricHeight = 0, $BearingShaftDiameter = 4.9, $BeltClamp = 0, $BlockOffset = 45);//Shaft = 7.3 for excentric nut, height = 0 since using nut
//Right for extended intake
//mirror([1, 0, 0])
//  IntakeRailCarriageBody($HDepth = 0, $ExcentricDiameter = 7.3, $ExcentricHeight = 0, $BearingShaftDiameter = 4.9, $BeltClamp = 1, $BlockOffset = 45);//Shaft = 7.3 for excentric nut, height = 0 since using nut

//HopperTipperCoupler();
//MechanicatsIcon();
//RedScareIconV1();
//RedScareIconV2();
//IconCap();
//MechanicatsIcon();
//CarouselSpinnerMount();
//CarouselSpinnerCoupler();
//HexShaftBearingShimSpacer($SpacerHeight = 0, $Sides = 20, $InnerD = 5.60 + .25, $Height = 21);//Long shaft, no cap, steel shaft
//HexShaftBearingShimSpacer($SpacerHeight = .8, $Sides = 6, $InnerD = 5.60 + .25, $Height = 7);//Short shaft for 608, with cap, steel shaft
//HexShaftBearingShimSpacer($SpacerHeight = .8, $Sides = 6, $InnerD = 5.30 + .25, $Height = 7);//Short shaft for 608, with cap, slightly tighter for aluminum shaft

//translate([0, 0, 32])
//  rotate(180, [0, 1, 0])
//    RailSupportMountCap($SupportWidth = 15, $Style = 0); //For Mounting on 15mm extrusion pole
//    RailSupportMountCap($SupportWidth = 20, $Style = 0); //For Mounting on 20mm extrusion pole
//    RailSupportMountCap($SupportWidth = 22, $Style = 1, $InlineHoles = 0, $InsetDepth = 0);//For direct mounting to C-channel, side holes
//    RailSupportMountCap($SupportWidth = 22, $Style = 1, $InlineHoles = 1, $InsetDepth = 0);//For direct mounting to C-channel, inline holes
//RailSupportAnchor($Align = 1, $MountHoleDiameter = 5.2);//For T-nut on extrusion
//RailSupportAnchor($Align = 0, $MountHoleDiameter = 5.2);//For T-nut on extrusion
//RailSupportAnchor($Align = 0, $MountHoleDiameter = 4.2, $CaptiveDiameter = 7.9, $CountersinkHeight = 2, $MountDirection = 0);//For direct mount to C-channel, countesink allows threadlock with M4-20
//RailSupportAnchor($Align = 0, $MountHoleDiameter = 4.2, $CaptiveDiameter = 7.9, $CountersinkHeight = 2, $MountDirection = 1);//For direct mount to C-channel, countesink allows threadlock with M4-20, holes on outside of hinge
//CChannelInsert($NutHeight = 0, $Width = $ChannelInsertBlockWidth, $Height = $ChannelInsertBlockWidth);//Full width, full height
//CChannelInsert($NutHeight = 0, $Width = 20);//Narrow C-channel spacers
//CChannelInsert($NutHeight = 0, $Width = 20, $Height = $ChannelInsertBlockWidth, $Depth = 10);//Narrow C-channel spacers

//WheelAxleAdapters();
//WheelAxleAdapterSpacer();
//ShimPunch();
//ClawArm();
//ClawPushPlate();
//IconLowerCapture();
//IconUpperCapture();
//IconCaptureServoMount();
//translate([0, 0, 7 + 7.5])
//  IconCaptureServoHorn($Diameter = 26.0);
//IconCaptureMotorMount();
//DrillTemplate($Position = 3, $Text = "3");
//ArmDriveSprocket();
//AxleSpacer($Inner = 5.2, $Outer = 8, $L = 20);
//ArmMotorMount($FrontBack = 1, $BearingType = 0);
//ArmMotorMount($FrontBack = 2, $BearingType = 1);
//FTCLifterSpindle($SpindleDiameter = 20, $SpindleLength = 25, $SpindleType = 1, $ShaftType = 1, $ShaftDiameter = 6 + 0.4);
//MendelPatched();

//Display items
//ChainTensionerHousing();
//CheckChannelSpacing();
//CheckChannelSpacing2();
//WheelSet($Sprocket = true);
//ChainTensioner();
//WheelAxleBlockSplit();
//IntakeLifter();
//translate([-9, -45, 25])
//rotate(180, [1, 0, 0])
//StandardServo($DoPillars = 1, $Gap = 1, $ShaftDiameter = 5, $DoHoles = true);
//Claw();
//IconSideGrabber();
//CChannelCarriage();
//CChannelSliderSection($L = 200);
//CChannelLifter();
//CChannelCarriage($Type = 2);
//CChannelPulleyCapper();
//CChannelPulleyBlock();

//PulleyGaurd();

//OpticalLimitSwitchHolder();
//LightRingFrame();
//JeVoisMount();
//UltrasonicHousingPrint();
//CamerMountLogitec();
//PrintCamerMountLogitec();
//CamerMountLogitec();


//FTCDriverHubModed();
//GolfBotClub();

//GolfBotClubAttatch();

//translate([0, 40, 0])
//  Pixel("GREEN");

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
//DroneLauncher();
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

//CreateMisumiPlateSet(stages = 2, returnstyle = 0, offset = 10);
CreateMisumiPlate(show = (2^7), stages = 2, returnstyle = 0, offset = 10, width = 14);



//translate([0, 230, 0])
//  Backdrop();

//FullRobotV2(actuatorangle = 90, supportspacing = 120, position = 0, offset = 10, stages = 2);

//PixelFloorPickerO2(actuatorangle = -20, supportspacing = 120, position = 00, offset = 10, stages = 2);
//PixelFloorPickerO2HopperArm(actuatorangle = -20, position = 0, offset = 10, stages = 2, width = 15);
//BoundingBox();


//hopperlinkagethickness = 6;
//hopperlinkagebasespacing = 77;
//hopperlinkagehopperspacing = 71;
//hopperlinkagetoplength = 118;
//hopperlinkagebottomlength = 133;

//translate([hopperedgeoffset + (DualHopperWidth / 2) + hopperlinkagethickness, 0, 0])
//  rotate(90, [0, 0, 1])
//    DualHopperBin(showservo = false);

//DualHopperGate();

//Upper passive linkage
//translate([hopperedgeoffset + DualHopperWidth + hopperlinkagethickness, hopperbackdisplacement, hopperverticaldisplacement])
//  rotate(90, [0, 1, 0])
//    HopperLinkage(length = hopperlinkagetoplength, servo = false);
//Upper servo linkage
//translate([hopperedgeoffset, hopperbackdisplacement, hopperverticaldisplacement])
//  rotate(90, [0, 1, 0])
//    HopperLinkage(length = hopperlinkagetoplength, servo = true);
//Lower servo linkage
//HopperLinkage(length = hopperlinkagebottomlength, servo = false);
//  HopperBaseMount(showservo = false);


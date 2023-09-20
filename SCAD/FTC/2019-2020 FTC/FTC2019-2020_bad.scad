use <sprockets.scad>

$StoneGripperExtension = 4.7;
$StoneGripperLength    = 6;
$GripperPlateThickness = .15;
$GripperPlateLength    = 4;
$GripperPlateHeight    = 2;
$GripperMountWidth     = 1.5;
$GripperServoAngle     = 0;
$GripperDiscRadius     = 0.57;
$GripperArticulationShaftDiameter = 0.2;
$GripperArmLength      = 14;
$GripperArmAngle       = 0;

$ServoWidth            = 0.78;
$ServoHeight           = 1.57;
$ServoMountOffset      = 0.368;
$ServoDepth            = 1.05 + $ServoMountOffset;
$ServoMountLength      = 2.08;
$ServoMountThickness   = 0.15;
$ServoRidgeThickness   = 0.1;
$ServoRidgeDepth       = 0.18;
$ServoMountHoleX       = 0.4;
$ServoMountHoleY       = 0.53 + 1.33;
$ServoMountHoleD       = 0.172;
$ServoShaftOffset      = 0.38;
$ServoShaftD           = 0.23;
$ServoShaftL           = 0.12;

$PullWheelDiameter = 4;
$IntakeSpacing = $PullWheelDiameter + 4;

$Stage1Length = 10;
$Stage2Length = 10;
$LiftArmLength = 15;

//Pickup location
$Stage2Position = 0;
$LiftArmAngle = 213;
//Highest location
//$Stage2Position = 8;
//$LiftArmAngle = 80;


//CheckArmSetWide();
//CheckArmSetNarrow();
//StoneGripperPlateAndServoMountNarrow();
//translate([0, 0, 2])//Set wheels to zero height
//  IntakeCheck();
//StoneGripperServoHorn();

//RevBearingBlock();
RevOmniMount();

module RevOmniMount()
{
  difference()
  {
    union()
    {
      //Main wheel attach
      cylinder(d = 42, h = 6, $fn = 6);
      //Sprocket
      translate([0, 0, 6])
    //  sprocket(size, teeth, bore, hub_diameter, hub_height, guideangle);
        sprocket(25,   30,    0,    0,            0,  30);
    }
  }
}

module RevBearingBlock()
{
  $BearingBlockDepth        = 13;
  $BearingBlockWidth        = 25;
  $BearingBlockHeight       = 25;
  $BearingBlockAlignerDepth = 1;
  $BearingDiameter          = 13.2;
  $BearingDepth             = 5.1;
  $MountBoltholeDiameter    = 3.8;
  $MountBoltDepth           = 3.2;
  $MountChannelLength       = 15;
  $MountBoltWidth           = 6;
  
  difference()
  {
      //Base block
    translate([0, 0, $BearingBlockDepth / 2])
      cube([$BearingBlockWidth, $BearingBlockHeight, $BearingBlockDepth], center = true);
    //Shaft opening
    cylinder(d = 6.5, h = 20, $fn = 60);
    //Channel insert aligner
    translate([0, 0, $BearingBlockDepth - $BearingBlockAlignerDepth])
      difference()
      {
        translate([0, 0, $BearingBlockDepth / 2])
          cube([$BearingBlockWidth + 0.01, $BearingBlockHeight + 0.01, $BearingBlockDepth], center = true);
        cylinder(d = 8, h = 20, $fn = 60);
      }
    
    //Bearing opening
    cylinder(d = $BearingDiameter, h = $BearingDepth, $fn = 60);
    //Mounting holes
    translate([8, 0, -0.01])
      cylinder(d = $MountBoltholeDiameter, h = $BearingBlockDepth, $fn = 40);
    translate([-8, 0, -0.01])
      cylinder(d = $MountBoltholeDiameter, h = $BearingBlockDepth, $fn = 40);
    translate([0, 8, -0.01])
      cylinder(d = $MountBoltholeDiameter, h = $BearingBlockDepth, $fn = 40);
    translate([0, -8, -0.01])
      cylinder(d = $MountBoltholeDiameter, h = $BearingBlockDepth, $fn = 40);      
    //Catch bolt openings
    translate([8 + ($MountChannelLength / 2) - ($MountBoltWidth / 2) - 0.5, 0, ($MountBoltDepth/2) + $BearingDepth + .2])
      cube([$MountChannelLength, $MountBoltWidth, $MountBoltDepth], center = true);
    rotate(90, [0, 0, 1])
    translate([8 + ($MountChannelLength / 2) - ($MountBoltWidth / 2) - 0.5, 0, ($MountBoltDepth/2) + $BearingDepth + .2])
      cube([$MountChannelLength, $MountBoltWidth, $MountBoltDepth], center = true);
    rotate(180, [0, 0, 1])
    translate([8 + ($MountChannelLength / 2) - ($MountBoltWidth / 2) - 0.5, 0, ($MountBoltDepth/2) + $BearingDepth + .2])
      cube([$MountChannelLength, $MountBoltWidth, $MountBoltDepth], center = true);
    rotate(-90, [0, 0, 1])
    translate([8 + ($MountChannelLength / 2) - ($MountBoltWidth / 2) - 0.5, 0, ($MountBoltDepth/2) + $BearingDepth + .2])
      cube([$MountChannelLength, $MountBoltWidth, $MountBoltDepth], center = true);
  }
}

module Lift()
{
  //Slide rails
  translate([0, -0.5, 0])
    cube([.5, 1, $Stage1Length]);
  translate([0.55, 0, $Stage1Length - $Stage2Length + $Stage2Position])
  {
    LiftStage2();
    translate([1.1, -1.2, $Stage2Length - 0.8])
      LiftArm();
  }
}

module LiftArm()
{
  $LiftArmLengthSpacing = $LiftArmLength - 1;
  rotate($LiftArmAngle, [1, 0, 0])
  {
    UChannel($L = $LiftArmLength);
    translate([-1, $LiftArmLengthSpacing, 0])
    {
      rotate(-$LiftArmAngle, [1, 0, 0])
        rotate(90, [0, 0, 1])
          mirror([1, 0, 0])
            translate([-0.75, -2.8, 1.2])
              StoneGripperNarrow();
    }
  }
}

module LiftStage2()
{
  //Slider rail
  translate([0, -0.5, 0])
    cube([.2, 1, $Stage2Length]);
  //Motor mount plate
  translate([0.2, -2, 0])
    cube([0.1, 2.5, 2]);
  //Motor
  translate([-0.5, -1.5, 0])
  {
    CoreHex();
    //Sprocket
    translate([.9, 0.1, 0.5])
      rotate(90, [0, 1, 0])
        cylinder(d = .75, h = .15, $fn = 20);
  }
  //Upper arm mount
  translate([0.2, -2, $Stage2Length - 2])
    cube([0.1, 2.5, 2]);
  //Arm support strenghtner, shaft and sprocket
  translate([-0.3, -1.2, $Stage2Length - .8])
  {
    UChannel($L = 1);
    //Shaft
    translate([-0.8, 0, 0])
      rotate(90, [0, 1, 0])
        cylinder(d = 0.2, h = 3, $fn = 20);
    translate([0.7, 0, 0])
      rotate(90, [0, 1, 0])
        cylinder(d = 0.75 * 3, h = .15, $fn = 20);
  }
}

module IntakeCheck()
{
  translate([0, -6.5, 2])
    Intake();
  translate([0, -1.6, 0])
    Stone();
  translate([-4.5, 6.5, 1.2])
    Lift();
  SimpleBase();
}

module Intake()
{
  translate([$IntakeSpacing / 2, 0, 0])
    IntakeSide();
  translate([-$IntakeSpacing / 2, 0, 0])
    mirror([1, 0, 0])
      IntakeSide();
  //Bottom ramp rear
  translate([0, 6, -2.1])
    cube([5, 6, 0.1], center = true);
  //Bottom ramp front
  translate([0, .5, -2.93])
    rotate(21, [1, 0,0])
      cube([5, 5.1, 0.1], center = true);
  //Backstop
  translate([0, 9, -1])
    cube([5, 0.1, 2], center = true);
}

module IntakeSide()
{
  $FlapWheelDiameter = 3;
  $FlapLength = 1;
  $FlapDepth = .7;
  $FlapCount = 8;
  $IntakeOpenerAngle = 10;

  //Puller wheel
    Wheel($D = $PullWheelDiameter, $T = 1, $R = 0);
  //Flapper wheel
  rotate($IntakeOpenerAngle, [0, 0, 1])
  {
    translate([0, -4.5, -1])
      rotate(25, [1, 0, 0])
      {  
        Wheel($D = $FlapWheelDiameter, $T = 1, $R = 0);
        for (a =[0:$FlapCount - 1])
        {
          rotate((360 / $FlapCount) * a, [0, 0, 1])
            translate([0, ($FlapLength + $FlapWheelDiameter) / 2, 0])
              cube([0.05, $FlapLength, $FlapDepth], center = true);
        }
        //Wheel support
        color("Silver")
          translate([0, 0, -0.6])
            hull()
            {
              cylinder(d = 1, h = 0.05, $fn = 20, center = true);
              translate([0, 2.25, 0])
                cube([1, 0.001, 0.05], center = true);
            }
      }
    //Wheel support
      color("Silver")
        translate([0, 0, -0.6])
          hull()
          {
            cylinder(d = 1, h = 0.05, $fn = 20, center = true);
            translate([0, -2.25, 0])
              cube([1, 0.001, 0.05], center = true);
          }
  }
  //Stone guide
  //Straight section
  translate([(-$PullWheelDiameter / 2) + 0.2, 5, -2])
    cube([0.1, 4, 3]);
  //Funnel section
  translate([-0.25, -0.8, -2])
    rotate(15, [0, 0, 1])
      cube([0.1, 6, 3]);
}

module CoreHex()
{
  resize(newsize=[36.47/25.4,34.5/25.4,95.72/25.4])
    rotate(180/8, [0, 0, 1])
      cylinder(d = 1.5, h = 3.77, $fn = 8);
  translate([-.2, 0.1, .5])
    rotate(90, [0, 1, 0])
    {
      cylinder(d = 1, h = 1, $fn = 6);
      cylinder(d = .2, h = 1.5, $fn = 20);
    }
}

module Wheel()
{
  rotate($R, [0, 1, 0])
    cylinder(d = $D, h = $T, $fn = 40, center = true);
}

module SimpleBase()
{
  color([0.2, 0.1, 0.3, 0.9])
  difference()
  {
    cube([18, 18, 2], center = true);
    translate([0, -5.1, 0])
      cube([6, 8, 5], center = true);
  }
  
  translate([8, 7, 0])
    Wheel($D = 4, $T = 1, $R = 90);
  translate([8, -7, 0])
    Wheel($D = 4, $T = 1, $R = 90);
  translate([8, 0, 0])
    Wheel($D = 4, $T = 1, $R = 90);

  translate([-8, 7, 0])
    Wheel($D = 4, $T = 1, $R = 90);
  translate([-8, -7, 0])
    Wheel($D = 4, $T = 1, $R = 90);
  translate([-8, 0, 0])
    Wheel($D = 4, $T = 1, $R = 90);
}

module CheckArmSetWide()
{
  translate([10, 0, 0])
    CheckBasic($GripperArmAngle = 0,    $RaisedPlatformHeight  = 3.3, $GripperArmLength     = 15, $Type = 0);
  translate([10, 0, 0])
    CheckBasic($GripperArmAngle = -120, $RaisedPlatformHeight  = 3.3, $GripperArmLength     = 15, $Type = 0);

  CheckBasic($GripperArmAngle = 31,    $RaisedPlatformHeight  = 12,  $GripperArmLength     = 18, $Type = 0);
  CheckBasic($GripperArmAngle = -120,  $RaisedPlatformHeight  = 12,  $GripperArmLength     = 18, $Type = 0);
}

module CheckArmSetNarrow()
{
  translate([10, 0, 0])
    CheckBasic($GripperArmAngle = 0,    $RaisedPlatformHeight  = 3.3, $GripperArmLength     = 14.7, $Type = 1);
  translate([10, 0, 0])
    CheckBasic($GripperArmAngle = -120, $RaisedPlatformHeight  = 3.3, $GripperArmLength     = 14.7, $Type = 1);

  CheckBasic($GripperArmAngle = 31,    $RaisedPlatformHeight  = 12,  $GripperArmLength     = 18, $Type = 1);
  CheckBasic($GripperArmAngle = -120,  $RaisedPlatformHeight  = 12,  $GripperArmLength     = 17, $Type = 1);
}

module GripperAndStoneWide()
{
  translate([-.4 - $GripperMountWidth, -.3, 1])
  {
    translate([-2, 0, -4])
      Stone();
    StoneGripperWide();
  }
}

module GripperAndStoneNarrow()
{
  translate([-1.3, 0.75, 1.2])
    rotate(-90, [0, 0, 1])
    {
      translate([-4, -1.1, -4])
        rotate(90, [0, 0, 1])
          Stone();
      StoneGripperNarrow();
    }
}

module CheckBasic()
{
  $GripperArmSpacing     = $GripperArmLength - 1;
  translate([0, 0, $RaisedPlatformHeight])
  {
    translate([0, -cos($GripperArmAngle) * $GripperArmSpacing, -sin($GripperArmAngle) * $GripperArmSpacing])
    {
      mirror([0, 1, 0])
      if ($Type == 0)
        GripperAndStoneWide();
      else
      {
        mirror([0, 1, 0])
        GripperAndStoneNarrow();
      }
      rotate($GripperArmAngle, [1, 0, 0])
        translate([0.5, 0, 0])
          UChannel($L = $GripperArmLength);
    }
    translate([-0.35, 0, 0])
      StoneGripperArticulateSupport($Fudge = 0);
  }
}

module StoneCap()
{
  rotate(45, [0, 0, 1])
  cylinder(d1 = (2.0*1.44), d2 = (2.0*1.44 * .8), h = 1, $fn = 4);
}

module Stone()
{
  translate([-2, -4, 0])
    cube([4,8,4]);
  translate([0, -2, 4])
    StoneCap();
  translate([0, 2, 4])
    StoneCap();
}

module StoneGripperBarT()
{
  color("Silver")
  {
    rotate(-90, [0, 1, 0])
      cylinder(d = 0.2, h = $StoneGripperExtension, $fn = 10);
    translate([-$StoneGripperExtension, -($StoneGripperLength / 2), 0])
      rotate(-90, [1, 0, 0])
        cylinder(d = 0.2, h = $StoneGripperLength, $fn = 10);
  }
}

module StoneGripperBarn()
{
  color("Silver")
  {
    rotate(-90, [0, 1, 0])
      cylinder(d = 0.2, h = $StoneGripperExtension, $fn = 10);
    translate([-$StoneGripperExtension, -2.2, 0])
      rotate(-90, [1, 0, 0])
        cylinder(d = 0.2, h = 2.2, $fn = 10);
    translate([-$StoneGripperExtension + 2, -2.2, 0])
      rotate(-90, [0, 1, 0])
        cylinder(d = 0.2, h = 2, $fn = 10);
  }
}

module ArticulationHub()
{
  //Hub
  cylinder(d = $D - 0.2, h = .25, $fn = 40);
  //Shamfers
  cylinder(d1 = $D, d2 = $D - 0.8, h = .25, $fn = 40);
  cylinder(d1 = $D - 0.8, d2 = $D, h = .25, $fn = 40);
  //Outer rims
  translate([0, 0, 0.25])
    cylinder(d = $D, h = .05, $fn = 40);
  translate([0, 0, -0.05])
    cylinder(d = $D, h = .05, $fn = 40);
}

module StoneGripperArticulateSupportNarrow()
{
  difference()
  {
    union()
    {
      translate([-.75 , -0.75, -0.8])
        cube([0.7 , 1.5, 1.3]);
      rotate(90, [0, 1, 0])
        ArticulationHub($D=1.5);
    }
    //Rotation shaft opening
#    translate([-3, 0, 0])
      rotate(90, [0, 1, 0])
        cylinder(d = $GripperArticulationShaftDiameter, h = 5, $fn = 30);
    //Shaft collar access opening
    translate([-0.6, -.6, -0.5])
      cube([0.4, 1.2, 2]);
  }
}

//Stone gripper designed for side capture on wide edge
module StoneGripperPlateAndServoMountWide()
{
  StoneGripperPlateAndServoMountBase($PlateOffset = 0);
  color("Green")
    translate([3.05 - $GripperMountWidth, 0.35, -1.0])
      StoneGripperArticulateSupport($Fudge = $GripperMountWidth - 1.0);
}


//Stone gripper designed for end capture on narrow edge
module StoneGripperPlateAndServoMountNarrow()
{
  StoneGripperPlateAndServoMountBase($PlateOffset = 0.9);
  color("Green")
    translate([0.75, 1.15, 0.4])
      rotate(90, [0, 0, 1])
        StoneGripperArticulateSupportNarrow();
}


module StoneGripperPlateAndServoMountBase()
{
  difference()
  {
    union()
    {
      //Stone support plate
      color("Green")
        translate([0, (-$GripperPlateLength / 2) - $PlateOffset, -$GripperPlateHeight])
          cube([$GripperPlateThickness, $GripperPlateLength, $GripperPlateHeight]);
      //Servo mount
      translate([$GripperMountWidth / 2, -.8, -0.1])
        color("Green")
          difference()
          {
            translate([0, 0.05, -0.3])
              cube([$GripperMountWidth , .4, 3.2], center = true);
            translate([0, 0.2, .1])
            {
              $preview = false;
              if ($preview == true)
              {
                Servo($HoleShafts = 1);
              }
              else
              {
                minkowski()
                {
                  Servo($HoleShafts = 1);
                  rotate(90, [1, 0, 0])
                  cylinder(d = 0.04, h = 0.101, $fn = 20, center = true);
                  //sphere(d = 0.04, $fn = 20);
                }
              }
            }
          }
      //Arm support
      color("Green")
      {
        //Vertical plate
        translate([$GripperMountWidth - $GripperPlateThickness - 0.05, -0.95, -$GripperPlateHeight])
          cube([.2, 2.05, 2.0]);
        //Bottom plate
        translate([0, -0.95, -$GripperPlateHeight])
          cube([$GripperMountWidth, 2.05, .2]);
      }
    }
    translate([-0.1, -0.55, -0.6])
      cube([1.7, 0.95, 1]);
  }
}

module StoneGripperServoHorn()
{
  $PinOffset = 0;
  difference()
  {
    //Base horn
    translate([0, 0, 0.1])
      cylinder(d = ($GripperDiscRadius * 2) + .2, h = 0.6, $fn = 20);
    //Pusher/lifter opening
    translate([0, 0, -.01])
      linear_extrude(height = .35)
        //           TR           BR           BL         TL         CT
        polygon([[-1,0.0], [-0.1,-0.85], [1.3, 0], [-0.4, 1.1], [0, 0.1]]);
    //Attatch holes
    //Screw shaft hole
    cylinder(d = 0.11, h = 1, $fn = 20);
    //Screw head opening
    translate([0, 0, -0.1])
      cylinder(d = 0.4, h = .55, $fn = 20);
    //Servo shaft
#    translate([0, 0, 0.55])
      cylinder(d = $ServoShaftD, h = .15, $fn = 20);
      //Gripper pin screw hole
      rotate($GripperServoAngle + $PinOffset, [0, 0, 1])
        translate([$GripperDiscRadius - 0.01, 0, -0.1])
          cylinder(d = .12, h = 1, $fn = 20);
  }
}

module StoneGripperServo()
{
  rotate(90, [1, 0, 0])
  {
    //Servo horn disc
    color("DarkGray")
    {
      translate([0, 0, -0.13])
        StoneGripperServoHorn();
    }
  }
  translate([0, -.7, -0.4])
    Servo($HoleShafts = 0);
}



module ServoHoleSet()
{
  translate([$ServoMountHoleX / 2, $ServoMountHoleY / 2, -.75])
    cylinder(d = $ServoMountHoleD, h = 2, $fn = 20);
  translate([-$ServoMountHoleX / 2, $ServoMountHoleY / 2, -.75])
    cylinder(d = $ServoMountHoleD, h = 2, $fn = 20);
  translate([$ServoMountHoleX / 2, -$ServoMountHoleY / 2, -.75])
    cylinder(d = $ServoMountHoleD, h = 2, $fn = 20);
  translate([-$ServoMountHoleX / 2, -$ServoMountHoleY / 2, -.75])
    cylinder(d = $ServoMountHoleD, h = 2, $fn = 20);
}

module Servo()
{
  color([.32, .32, .25])
  {
    difference()
    {
      union()
      {
        //Servo body
        translate([-$ServoWidth / 2, -$ServoDepth / 1, -$ServoHeight / 2])
          cube([$ServoWidth, $ServoDepth, $ServoHeight]);
        //Mount plate
        translate([-$ServoWidth / 2, -$ServoMountOffset, -$ServoMountLength / 2])
          cube([$ServoWidth, $ServoMountThickness, $ServoMountLength]);
        //Mount ridges
        translate([-$ServoRidgeThickness / 2, -$ServoMountOffset, -$ServoMountLength / 2])
          cube([$ServoRidgeThickness, $ServoMountThickness + $ServoRidgeDepth, $ServoMountLength]);
      }
      rotate(90, [1, 0, 0])
        ServoHoleSet();
    }
    //Shaft ring
    translate([0, 0, ($ServoHeight / 2) - $ServoShaftOffset])
      rotate(-90, [1, 0, 0])
        cylinder(d = $ServoWidth - .1, h = .46 - $ServoMountOffset, $fn = 40);
  }
  //Shaft 
  color([.82, .82, .85])
  translate([0, .46 - $ServoMountOffset, ($ServoHeight / 2) - $ServoShaftOffset])
    rotate(-90, [1, 0, 0])
      cylinder(d = $ServoShaftD, h = $ServoShaftL, $fn = 40);


  if ($HoleShafts == 1)
  {
    rotate(90, [1, 0, 0])
      ServoHoleSet($ServoMountHoleD = .05);
  }
}

module StoneGripperWide()
{
  translate([1.6, 0, .2])
    StoneGripperBarT();
  StoneGripperPlateAndServoMountWide();
  translate([$GripperMountWidth / 2, 0.1, .4])
    StoneGripperServo();
}

module StoneGripperNarrow()
{
  translate([1.6, 0, .2])
    StoneGripperBarn();
  translate([0, -0.2, 0])
    StoneGripperPlateAndServoMountNarrow();
  translate([$GripperMountWidth / 2, -0.1, .4])
    StoneGripperServo();
}

module UChannel()
{
  $Thickness = 0.05;
  
  color("LightGray")
    translate([-0.5, -0.5, -0.5])
      difference()
      {
        cube([1, $L, 1]);
        translate([$Thickness, -0.005, $Thickness])
          cube([1 - ($Thickness * 2), $L + 0.01, 1]);
      }
}



use <./threads.scad>
use <./servo.scad>

$BallSize = 2.8;
$ExtraSpacing = .2;//Was 1
$BandSpacing = 1.5;
$BoxThickness = 0.1;
$BoxClearance = 1/8;
$BoxHeight = 2.8;//Was 3.2
$HingeShaftOffset = 0.2;
$HingeMountWidth = $HingeShaftOffset * 2;
$HingeMountLength = 0.3;
$HingeMountHeight = 0.8;
$HingeShaftDiameter = (4 / 25.4);//1/8;
$HingeClearance = 0.05;
$HingeShaftClearance = 0.02;
$ServoPlateWidth = 1.5;
$ServoPlateHeight = .3;
$BandDiameter = 1/6;

$BoxColor = [0.4, 0.1, 0.8, 0.7];

$BoxInnerWidth = $BallSize + $BoxClearance + $BoxClearance + 1;//Added +1
$BoxInnerLength = $BallSize + $BallSize + $ExtraSpacing + $BoxClearance + $BoxClearance;
$BoxOuterWidth = $BoxInnerWidth + $BoxThickness + $BoxThickness;
$BoxOuterLength = $BoxInnerLength + $BoxThickness + $BoxThickness;

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

//RoundCaptureCheck();

//RoundCapturePrint();

//RenderAllRectangular();
scale(25.4)
PrintFlapper();//Scaled in inches

//PrintBox();//Scaled in inches

//FTCLifterSpindle($SpindleDiameter = 18,$SpindleLength = 25,$ThreadSize = 2,$Pitch = 2.5, $DoRatchetBottom = 0, $DoRatchetTop = 0, $DoThread = 1);
//translate([35, 0, 0])
//  FTCLifterSpindle($SpindleDiameter = 20,$SpindleLength = 30,$ThreadSize = 2,$Pitch = 3, $DoRatchetBottom = 1, $DoRatchetTop = 1, $DoThread = 1);
//translate([0, 35, 0])
//  FTCLifterSpindle($SpindleDiameter = 25,$SpindleLength = 25,$ThreadSize = 2,$Pitch = 3, $DoRatchetBottom = 1, $DoRatchetTop = 1, $DoThread = 0);
//translate([35, 35, 0])
//  FTCLifterSpindle($SpindleDiameter = 20,$SpindleLength = 30,$ThreadSize = 2,$Pitch = 3, $DoRatchetBottom = 1, $DoRatchetTop = 1, $DoThread = 0);

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

module RoundCapturePrint()
{
  RoundCapture();
  translate([2, 0.5, 5.7])
    rotate(180, [1, 0, 0])
      RoundFlap();
}

module RoundCaptureCheck()
{
	//Arm
	translate([-$BallSize / 2, ($BallSize / 2) + .6, 1.2])
		rotate(-30, [0, 1, 0])
			cube([20, .1, 1.2]);
	RoundCapture();
	RoundFlap();
	translate([(($BallSize + 0.5) / 2) + .3, 0, 4.65])
		rotate(180, [0, 1, 0])
			Servo();
}

module RoundFlap()
{
	translate([(($BallSize + 0.5) / 2) + .3, 0, 4.65])
//	rotate(10, [0, 1, 0])
		translate([0, -.3, -0.5])
		{
			//Servo attatch
      difference()
      {
			  translate([0, -.2, 0])
          cube([.8, .2, 1.5]);
        translate([.394, .5, .493])
          rotate(90, [1, 0, 0])
            cylinder(d = .45, h = 1, $fn = 50);
      }
			intersection()
			{
				translate([-1.85, -1.35, 1.45])
					difference()
					{
						cube([(($BallSize + 0.5) / 2) + 1, $BallSize + 0.5, .1]);
						translate([0, ($BallSize + 0.5) / 2, 0])
							scale([3, 1.5, 1])
								cylinder(d = 1, h = 1, $fn = 20);
					}
				translate([-1, .3, 1.45])
					scale([1.3, 1, 1])
						cylinder(d = ($BallSize + 0.5), h = 1, $fn = 90, center = true);
			}
		}
}

module RoundCapture()
{
	difference()
	{
		union()
		{
			//Main cylinder
			cylinder(d = $BallSize + 0.5 + (2.5/25.4), h = $BallSize * 2, $fn = 100);//2.5mm shell
			//Arm mount
			translate([-1.5, ($BallSize + 0.5) / 2, 1])
				cube([3, .3, 3]);
			//Servo plate
			translate([(($BallSize + 0.5) / 2) - .3, 0, 3])
				cube([.5, 1, 2.5]);
			translate([(($BallSize + 0.5) / 2) - .3 + .5, 0, 3])
				cube([1, 1, .43]);
			translate([(($BallSize + 0.5) / 2) - .3 + .5, 0, 5.07])
				cube([1, 1, .43]);
		}
		cylinder(d = $BallSize + 0.5, h = $BallSize * 2, $fn = 100);
		$Strands = 12;
		translate([0, 0, .15])
	    	for (i = [0:$Strands - 1])
   	 	{
				rotate(i * 360 / $Strands, [0, 0, 1])
					rotate(90, [1, 0, 0])
						cylinder(d = $BandDiameter, h = $BallSize + 1, center = true, $fn = 20);
			}
		//Servo mounting gaps
		translate([(($BallSize + 0.5) / 2) - .3 + .5, .32, 5.07])
			cube([1, .12, .43]);
		translate([(($BallSize + 0.5) / 2) - .3 + .5, .32, 3])
			cube([1, .12, .43]);
		//Servo mounting bolt holes
		translate([(($BallSize + 0.5) / 2) + .468, 0, 3.267])
			rotate(90, [1, 0, 0])
				cylinder(d = 0.19, h = 3, $fn = 20, center = true);
		translate([(($BallSize + 0.5) / 2) + .468 + .453, 0, 3.267])
			rotate(90, [1, 0, 0])
				cylinder(d = 0.19, h = 3, $fn = 20, center = true);
		translate([(($BallSize + 0.5) / 2) + .468, 0, 3.267 + 1.95])
			rotate(90, [1, 0, 0])
				cylinder(d = 0.19, h = 3, $fn = 20, center = true);
		translate([(($BallSize + 0.5) / 2) + .468 + .453, 0, 3.267 + 1.95])
			rotate(90, [1, 0, 0])
				cylinder(d = 0.19, h = 3, $fn = 20, center = true);
		//Flap clearance
			translate([(($BallSize + 0.5) / 2) - .3 + .4 , 0, 5.5])
				rotate(05, [0, 1, 0])
				cube([2, 1, 1]);


	}
}

module PrintBox()
{
	CaptureBox();
}

module PrintFlapper()
{
	rotate(180, [1, 0, 0])
		Flapper();
}

module RenderAllRectangular()
{
	translate([0, 0, $BoxHeight])
		Flapper();
	ElementCapture();

	translate([3.71, 0.3, 0.7])
		Servo();
}

module Servo()
{
	translate([0, 1.445, 1.2])
	rotate(180, [0, 1, 0])
	rotate(90, [1, 0, 0])
	scale([1/25.4, 1/25.4, 1/25.4])
		RenderServo();
}

module ElementCapture()
{
	translate([0, -(($ExtraSpacing / 4) + ($BallSize / 2)), 0])
		SilverFlat();
	translate([0, (($ExtraSpacing / 4) + ($BallSize / 2)), 0])
		SilverFlat();
	translate([$BandSpacing / 2, 0, 0])
		Band();
	translate([-$BandSpacing / 2, 0, 0])
		Band();
	CaptureBox();
}

module Flapper()
{
	color($BoxColor)
	{
		//Main flap
		translate([1, 0, $BoxThickness / 2])
      cube([$BoxOuterWidth - 2, $BoxOuterLength, $BoxThickness], center = true);
		//Hinge
		difference()
		{
			//Main hinge
			union()
			{
				translate([($BoxOuterWidth / 2) + $HingeShaftOffset, 0, -(($HingeShaftOffset - $BoxThickness) / 2)])
					cube([$HingeMountWidth - ($HingeClearance * 2), $BoxOuterLength - (($HingeClearance + $HingeMountLength) * 2), $HingeShaftOffset + $BoxThickness], center = true);
				translate([($BoxOuterWidth / 2) + $HingeShaftOffset, 0, -$HingeShaftOffset])
					rotate(90, [1, 0, 0])
						cylinder(d = $HingeMountWidth - ($HingeClearance * 2), h = $BoxOuterLength - (($HingeClearance + $HingeMountLength) * 2), $fn = 20, center = true);
			}
			//Shaft opening
			translate([($BoxOuterWidth / 2) + $HingeShaftOffset, 0, -$HingeShaftOffset])
				rotate(90, [1, 0, 0])
					cylinder(d = $HingeShaftDiameter, h = $BoxOuterLength - (($HingeClearance + $HingeMountLength) * 2), $fn = 20, center = true);
		}
		//Servo attach plate
		translate([($BoxOuterWidth + $ServoPlateWidth) / 2, .15, $BoxThickness / 2])
			cube([$ServoPlateWidth, .4 , $BoxThickness], center = true);
		translate([($BoxOuterWidth + $HingeClearance) / 2, 0, $BoxThickness / 2])
			cube([$HingeClearance, ($BoxOuterLength - (($HingeClearance + $HingeMountLength) * 2)), $BoxThickness], center = true);
		//Linkage attach plate
		translate([($BoxOuterWidth / 2) + $HingeMountWidth - $HingeClearance, - $BoxThickness / 2, -$ServoPlateHeight])
		{
			difference()
			{
				cube([$ServoPlateWidth - $HingeMountWidth + $HingeClearance, $BoxThickness, $ServoPlateHeight]);
				for (a =[1:5])
				{
					translate([a*1/5, 0.02, .15])
						rotate(90, [1, 0, 0])
							cylinder(d = 0.07, h = $BoxThickness * 2, $fn = 20, center = true);
				}
			}
		}
	}
}

module HingeMounts()
{
	difference()
	{
		union()
		{
			translate([$BoxOuterWidth / 2, ($BoxOuterLength / 2) - $HingeMountLength, $BoxHeight - $HingeMountHeight])
				cube([$HingeMountWidth, $HingeMountLength, $HingeMountHeight]);
			translate([$BoxOuterWidth / 2, -($BoxOuterLength / 2), $BoxHeight - $HingeMountHeight])
				cube([$HingeMountWidth, $HingeMountLength, $HingeMountHeight]);
		}
		//Hinge shaft opening
		translate([($BoxOuterWidth / 2) + $HingeShaftOffset, 0, $BoxHeight - $HingeShaftOffset])
			rotate(90, [1, 0, 0])
				cylinder(d = $HingeShaftDiameter + $HingeShaftClearance, h = $BoxOuterLength, center = true, $fn = 20);
		//Shamfer to help printing
		translate([$BoxOuterWidth / 2, -($BoxOuterLength / 2), $BoxHeight - $HingeMountHeight])
			rotate(45, [0, 1, 0])
				cube([1, $BoxOuterLength, 1]);
	}
}

module Band()
{
	color([.3, .3, .3])
		translate([0, ($BoxOuterLength) / 2, 0])
			rotate(90, [1, 0, 0])
				cylinder(d = $BandDiameter, h = $BoxOuterLength, $fn = 20);
}

module SilverFlat()
{
	translate([0, 0, 1.4])
		Silver();
}

module Silver()
{
color([.8, .8, .8])
	sphere(d = $BallSize, $fn = 20);
}

module ServoMount()
{
  $Addition = 0.7;
  
	difference()
	{
    translate([$Addition / 2, 0, 0])
		cube([1.2 + $Addition, $BoxThickness + 0.2, 2.5], center = true);
		translate([.4 + $Addition, -.255, -0.4])
			scale([1.03, 1.03, 1.03])
				Servo();
    translate([$Addition, 0, 0])
		rotate(90, [1, 0, 0])
		{
			translate([.227, 1.022, 0])
				cylinder(d = 0.18, h = ($BoxThickness * 2) + 0.2, $fn = 20, center = true);
			translate([-.239, 1.022, 0])
				cylinder(d = 0.18, h = ($BoxThickness * 2) + 0.2, $fn = 20, center = true);
			translate([.227, -.984, 0])
				cylinder(d = 0.18, h = ($BoxThickness * 2) + 0.2, $fn = 20, center = true);
			translate([-.239, -.984, 0])
				cylinder(d = 0.18, h = ($BoxThickness * 2) + 0.2, $fn = 20, center = true);
		}
	}
  translate([-$Addition + $BoxThickness, 0, -2.5 / 2])
  difference()
  {
    cube([1.2 + $Addition, 1, $BoxThickness]);
    translate([0, 1, 0])
    rotate(-27, [0, 0, 1])
    cube([1.6 + $Addition, 1, $BoxThickness]);
  }
}

module CaptureBox()
{
	color($BoxColor)
	{
		difference()
		{
			//Outer box
			translate([0, 0, ($BoxHeight - $BandDiameter) / 2])
				cube([$BoxOuterWidth, $BoxOuterLength, $BoxHeight + $BandDiameter], center = true);
			//Inner opening
			translate([0, 0, ($BoxHeight  - $BandDiameter) / 2 - 0.001])
				cube([$BoxInnerWidth, $BoxInnerLength, $BoxHeight + $BandDiameter + 0.003], center = true);
			//Band holes
			for (a =[1:7])
			{
				translate([((a - 4)*$BandSpacing) / 4, 0, 0])
					rotate(90, [1, 0, 0])
						cylinder(d = $BandDiameter * 1, h = $BoxOuterLength + 0.1, $fn = 20, center = true);
			}

		}
		HingeMounts();
	}
	//Servo mount
	translate([($BoxOuterWidth + 1) / 2, 0.58, (2.5 / 2) - $BandDiameter])
		ServoMount();
}

$SpindleDiameter = 20;
$SpindleLength = 25;
$ThreadSize = 0;
$Pitch = 3;

module FTCLifterSpindle()
{
  $HubDiameter = $SpindleDiameter + 8;
  $HubDepth = 6;
  $ShaftDiameter = 6 + 0.6;
  $FlatOffset = 0.5;
  $NutWidth = 5.5 + 0.2;
  $NutThickness = 1.9 + 0.5;
  $NutBore = 3.2 + 0.2;
  $NutOffset = 6;
  $RatchetCount = 20;
 
  difference()
  { 
    union()
    {
      //Lower hub
      difference()
      {
        cylinder(d = $HubDiameter, h = $HubDepth, $fn = 50);
        translate([0, -5 - (($SpindleDiameter - 20) / 2), - 5])
          rotate(35, [1, 0, 0])
            cylinder(d = 4, h = 16, $fn = 50);
      }
      //Thread guide
      translate([0, 0, $HubDepth])
        //#1 = 3.3, #2 = 4
        if ($DoThread == 1)
        {
          metric_thread (diameter=$SpindleDiameter, pitch=$Pitch, length=$SpindleLength, thread_size=$ThreadSize, groove=false);
        } 
        else
        {
          cylinder(d = $SpindleDiameter, h = $SpindleLength, $fn = 50);
        }
      difference()
      {
        //Upper hub
        translate([0, 0, $HubDepth + $SpindleLength])
          cylinder(d = $HubDiameter, h = $HubDepth, $fn = 50);
        //Cable tieoff upper
        translate([0, -5 - (($SpindleDiameter - 20) / 2), $HubDepth + $HubDepth + $SpindleLength + 5])
          rotate(145, [1, 0, 0])
            cylinder(d = 4, h = 16, $fn = 50);
      }
    }
    //Motor shaft opening
    difference()
    {
      //Shaft bore
      cylinder(d = $ShaftDiameter, h = $HubDepth + $HubDepth + $SpindleLength, $fn = 50);
      //Shaft bode flat side
      translate([-$ShaftDiameter/2, ($ShaftDiameter / 2) - $FlatOffset, 0])
        cube([$ShaftDiameter, $ShaftDiameter, $HubDepth + $HubDepth + $SpindleLength]);
    }
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
    //Ratchet teeth
    if ($DoRatchetBottom == 1)
      RatchetTeeth($RatchetCount = $RatchetCount, $HubDiameter = $HubDiameter, $HubDepth = $HubDepth);
    if ($DoRatchetTop == 1)
      translate([0, 0, $HubDepth + $SpindleLength])
        RatchetTeeth($RatchetCount = $RatchetCount, $HubDiameter = $HubDiameter, $HubDepth = $HubDepth);
  }
}

module RatchetTeeth()
{
    for (i = [1:$RatchetCount])
    {
      rotate(i * (360 / $RatchetCount), [0, 0, 01])
        translate([($HubDiameter / 2) + 1, 0, $HubDepth / 2])
          rotate(30, [0, 0, 1])
            scale([2, 1, 1])
              rotate(45, [0, 0, 1])
                cube([3, 3, $HubDepth], center = true);
    }

  }
  
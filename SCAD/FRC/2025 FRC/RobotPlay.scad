$fn = 20;
FrameThickness = 3;
DriveBaseWidth = 30;
DriveBaseDepth = 30;
DriveBaseHeight = 4;
BumperThickness = 3.5;
BumperHeight = 5;

CageOffset = 3.5;//Deep cage
CageW = 7.5;

HookH = 4;
HookL = 10;
HookGripH = 16;
HookAngle = 0;

module Frame(W, D, H, T)
{
  difference()
  {
    cube([W, D, H], center = true);
    cube([W - (2*T), D - (2*T), H + .01], center = true);
  }
}

module DriveBase(DoBumpers)
{
  color("silver")
    Frame(DriveBaseWidth, DriveBaseDepth, DriveBaseHeight, FrameThickness);
  if (DoBumpers)
    color("Red")
      Frame(DriveBaseWidth + (2*BumperThickness), DriveBaseDepth  + (2*BumperThickness), BumperHeight, BumperThickness);
}

module Cage()
{  
  D = 1.75;
  H = 24;
  
  color("DarkGreen")
  {
    difference()
    {
      cube([CageW, CageW, .1], center = true);
      cylinder(d = 3, h = 1, $fn = 20, center = true);
    }
    translate([(CageW - D) / 2, (CageW - D) / 2, 0])
      cylinder(d = D, h = H, $fn = 20);
    translate([-(CageW - D) / 2, (CageW - D) / 2, 0])
      cylinder(d = D, h = H, $fn = 20);
    translate([(CageW - D) / 2, -(CageW - D) / 2, 0])
      cylinder(d = D, h = H, $fn = 20);
    translate([-(CageW - D) / 2, -(CageW - D) / 2, 0])
      cylinder(d = D, h = H, $fn = 20);
    translate([0, 0, H])
      cube([CageW, CageW, .1], center = true);
  }
}

module CageHook()
{
  translate([0, 0, HookH + 1 - 0.5])
  {
    rotate(-HookAngle, [0, 1, 0])
    {
      translate([HookL, 0, -HookH - 1])
      {
        //Cone
        cylinder(d1 = 1, d2 = 4, h = 1);
        //Vertical hook bumber spacer
        translate([-1, -0.5, 1])
          cube([2, 1, HookH]);
        //Horizontal bumber clearance
        translate([-HookL, -0.5, HookH])
          cube([HookL + 1, 1, 2]);
      }
      //Gripper vertical
      translate([0, -0.5, 0])
        cube([2, 1, HookGripH]);
      //Gripper horizontal
      translate([0, -0.5, HookGripH])
        cube([HookL, 1, 2]);
    }
  }
}

translate([0, 0, (BumperHeight / 2) + 1])
  DriveBase(true);

translate([((DriveBaseWidth + CageW) / 2) + BumperThickness, 0, CageOffset])
  Cage();

translate([((DriveBaseWidth + CageW) / 2) + BumperThickness - HookL, 0, CageOffset])
  CageHook();
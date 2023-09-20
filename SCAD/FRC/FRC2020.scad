$FlyWheelDiameter = 4;
$BallDiameter = 7;
$Compression = 1;
$inchtom = 0.0254;

$StartLineOffset = 120;//Distance from wall to start line

PowerPort();
translate([-$StartLineOffset * $inchtom, 0, 0])
  ShowTrajectory();

module ShowTrajectory()
{
  va = -9.8;//Vertcal acceleration (9.8m/s^2)
  ha = 0;//Zero acceleration horizontally
  velocity = 8.55;//Initial velocity = 10 m/s
  angle = 55;//Launch angle
  drag = 0;//Drag factor (Not used yet)
  duration = 0.8;//Time of simulation in seconds
  steps = 20;//number of steps in simulation
  
  vu = velocity*sin(angle);//Vertical initial velocity component, +ve = up
  hu = velocity*cos(angle);//Horizontal initial velocity component
  echo(vu);
  for (step = [0: steps])
  {
    t = (step * duration)/ steps;
    vs=(vu*t) + (0.5*va*(t*t));
    hs=(hu*t) + (0.5*ha*(t*t));
    translate([hs, 0, vs])
      sphere(d = 7 * $inchtom, $fn = 20);
  }
}

module PowerPort()
{
  //Outer port
  difference()
  {
    //Main support
    translate([0, 0, 10*12*$inchtom / 2])
      cube([1 * $inchtom, 4*12*$inchtom, 10*12*$inchtom], center = true);
    //Outer port opening
    translate([0, 0, 98.25 * $inchtom])
      rotate(90, [0, 0, 1])
        rotate(90, [1, 0, 0])
          cylinder(d = (30 * $inchtom) / 0.866026, h = .1, $fn = 6, center = true);//Hex included circle conversion
    //Bottom port opening
    translate([-0.05, - 34 * $inchtom / 2, 18 * $inchtom])
      cube([.1, 34 * $inchtom, 10 * $inchtom]);
  }
  //Inner port
  translate([29.25 * $inchtom, 0, 98.25 * $inchtom])
  {
    difference()
    {
      cube([1 * $inchtom, 4*12*$inchtom, 3*12*$inchtom], center = true);
      rotate(90, [0, 1, 0])
        cylinder(d = 13 * $inchtom, h = 0.1, $fn = 50, center = true);
    }
  }
}
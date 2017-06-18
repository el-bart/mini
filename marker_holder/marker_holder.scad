holderDiameter = 25 + 2*1.5;
cubeLen = 7+8/2 + 0 + holderDiameter/2;

difference()
{
  union()
  {
    // mounting rod
    cube([7,8,20]);
    translate([7,8/2,0])
      cylinder(r=8/2, h=20, $fs=0.1);
    
    // connecting bar
    translate([0, 0, 20])
      cube([cubeLen, 8, 4]);
    
    // marker holder - main part
    translate([cubeLen, -holderDiameter/2+8, 0])
      cylinder(r=(holderDiameter)/2, h=50);
  }
  // marker holder drill
  translate([cubeLen, -holderDiameter/2+8, 0])
    translate([0, 0, 1.5])
      cylinder(r=25/2, h=50);
}

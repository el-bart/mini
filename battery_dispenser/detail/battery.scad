module batteryAA()
{
  cylinder(h=48.5, r=14.5/2, $fs=0.1);
  translate([0,0, 48.5])
    cylinder(h=2, r=5.5/2, $fs=0.1);
}

module batteryAAA()
{
  cylinder(h=42.5, r=10.5/2, $fs=0.1);
  translate([0,0, 42.5])
    cylinder(h=1.5, r=4/2, $fs=0.1);
}

// just an exhibition - not used directly
translate([20,0,0])
  batteryAA();
translate([0,0,0])
  batteryAAA();

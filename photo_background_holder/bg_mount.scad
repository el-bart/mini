use <m3d/fn.scad>


module screw_slot()
{
  spacing = 0.3;
  l = 24.3 + spacing;
  din = 3.5 + spacing;
  dout = 8.5;
  dh = 4;

  translate([0, 0, l])
    rotate([180, 0, 0])
    {
      cylinder(d=din, h=l, $fn=fn(30));
      cylinder(d1=dout, d2=din, h=dh, $fn=fn(35));
    }
}


module bg_mount(wall, dx)
{
  spacing = 0.6;
//  insert = [25, 10.1, 
//  core_size = [
}


bg_mount(wall=7, dx=50);
//screw_slot();

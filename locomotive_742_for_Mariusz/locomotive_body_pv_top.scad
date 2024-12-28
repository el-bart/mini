include <m3d/math.scad>
use <m3d/fn.scad>

module pv_set()
{
  pv_size = [52, 19, 0.25];
  spacing = 0.4;
  wall = 1;
  extra_h = 0.9;
  pv_int = pv_size + spacing*[2,2,0] + [0,0,extra_h];
  pv_ext = pv_int + wall*[2,2,1];
  hole = 4;
  
  module pv_mock()
  {
    cube(pv_size);
  }
  
  module pv_slot()
  {
    difference()
    {
      cube(pv_ext);
      translate(wall*[1,1,1])
      {
        cube(pv_int + [0,0,eps]);
        %translate(spacing*[1,1,0])
          pv_mock();
      }
      for(dy=[wall+hole/2, pv_ext.y-wall-hole/2])
        translate([pv_ext.x/2, dy, -wall])
          cylinder(d=hole, h=3*wall, $fn=fn(20));
    };
  }
  
  for(n=[0:4])
    translate([n*pv_ext.x, 0, 0])
      pv_slot();
}

module body()
{
  scale(1) // final scale is applied on g-code generation level
    rotate([0, 0, -90])
      translate([-90.9-5, -21, -30])
        import("locomotive_body.stl");
}

%body();
scale(0.5) // final scale is applied on g-code generation level
  pv_set();

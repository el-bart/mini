include <m3d/all.scad>

wall = 2;
rounding = 0.75;
spacing = 0.3;
body_len = 170;
dim_int = [39.4, 32.25] + spacing*[2,2];
dim_ext = dim_int + wall*[2,2];


module body()
{
  difference()
  {
    side_rounded_cube([dim_ext.x, dim_ext.y, body_len], rounding, $fn=fn(50));
    translate([0, 0, -eps])
      translate(wall*[1,1,0])
      cube([dim_int.x, dim_int.y, body_len + 2*eps]);
  }
}


body();

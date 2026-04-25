include <m3d/all.scad>

screw_d = 3;
screw_spacing = 0.5;

lcd_w = 16;
lcd_back_angle = 55;
lcd_len = 60;


module bottom()
{
  front_wall = 2;
  top_wall = 6+2;
  base_size = [lcd_len, front_wall+lcd_w+8, top_wall+10];

  module lcd_mock(dl)
  {
    l = base_size.x + dl;
    module block()
    {
      cube([l, lcd_w, base_size.z]);
    }

    block();
    translate([0, lcd_w, 0])
      rotate([-(90-lcd_back_angle), 0, 0])
        translate([0, -lcd_w, 0])
          block();
  }

  difference()
  {
    cube(base_size);
    // LCD slot
    translate([-eps, front_wall, top_wall])
      lcd_mock(dl=2*eps);
    // screw slot and hole
    translate([base_size.x/2, front_wall+lcd_w/2, 0])
    {
      translate([0, 0, -eps])
        cylinder(d=screw_d+screw_spacing, h=base_size.z, $fn=fn(50));
      translate([0, 0, top_wall+eps])
        ti_cnck_m3_standard(dl=eps);
    }
  }
}


rotate([0, 0, 90])
  bottom();

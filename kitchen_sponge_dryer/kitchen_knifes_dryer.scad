include <common/config.scad>
use <common/template.scad>

box_enc_size = [45, 70, 150] + [0, 0, sink_bump_h + wall + slope_h];


if(false)
  intersection()
  {
    dryer(box_enc_size, mocks=true);
    translate([0, box_enc_size.y/2, 0])
      cube([sink_x_base_length, box_enc_size.y, box_enc_size.z]);
  }
else
  dryer(box_enc_size, mocks=$preview);

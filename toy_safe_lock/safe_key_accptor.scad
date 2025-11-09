use <safe_key.scad>
include <detail/config.scad>
include <m3d/all.scad>

wall = 2;
key_spacing = 1.5;
box_int = [2*(key_insert_h+2), key_insert_len + 1, key_insert_d/2 + key_insert_h + key_spacing];
box_ext = box_int + wall*[2,1,1];

side = 2.5 * bolt_guide_screw_d;
wall_for_screws_size = [box_ext.x + 2*side, wall, box_ext.z];


module acceptor(mocks=false)
{
  module core()
  {
    translate([-box_ext.x/2, -wall, -wall])
    difference()
    {
      union()
      {
        cube(box_ext);
        // wall for screws
        translate([-side, box_ext.y-wall, 0])
          cube(wall_for_screws_size);
      }
      // internal cut
      translate(wall*[1,1,1])
        cube(box_int + eps*[0,1,1]);
      // screw holes
      for(dx=[0, box_ext.x + side])
        for(dz=[bolt_guide_screw_d/2, box_ext.z - bolt_guide_screw_d - bolt_guide_screw_d/2])
          translate([dx, 0, dz])
            translate([-side/2, box_ext.y-wall-eps, bolt_guide_screw_d/2])
            rotate([-90, 0, 0])
            cylinder(d=bolt_guide_screw_d, h=wall+2*eps, $fn=fn(50));
    }
  }

  module turn_block()
  {
    s = [wall, box_int.y, box_int.z/2];
    translate([-key_insert_d - key_spacing, 0, 0])
    cube(s);
  }

  module comb_profile()
  {
    spacing = 0.25;
    off = key_insert_d/2 + 1;
    w = key_tooth_spaceing - 2*spacing;
    s = [box_int.x/2 - off, w, key_insert_h - key_insert_d];
    for(n=[0:key_teeth-1])
      translate([off, -spacing + n*(key_tooth_len + key_tooth_spaceing), 0])
        cube(s);
  }

  core();
  turn_block();
  comb_profile();

  %if(mocks)
    translate([-key_insert_d/2, 0, key_insert_h + key_spacing])
    rotate([0, 90/*-55*/, 0])
    rotate([0, 0, 90])
    key();
}


acceptor(mocks=$preview);

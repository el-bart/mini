include <../m3d/all.scad>
include <config.scad>


module dbox_ext()
{
  module ext()
  {
    module base()
    {
      s = size_ext - roundings*[2,2,1];
      minkowski()
      {
        translate(roundings*[1,1,0])
          side_rounded_cube(s, corner_r=corner_r, $fn=fn(50));
        sphere(r=roundings, $fn=fn(25));
      }
    }

    // remove bottom rounding
    intersection()
    {
      base();
      cube(size_ext);
    }
  }

  module int()
  {
    assert(photo_spacing.x == photo_spacing.y);
    side_rounded_cube(size_int, corner_r=photo_spacing.x, $fn=fn(50));
  }

  difference()
  {
    ext();
    translate(walls)
      int();
  }
}


module dbox_cut_shape(only_cut=true)
{
  module profile_2d()
  {
    projection(cut=true)
      translate([0, 0, -size_ext.z/2])
      dbox_ext();
  }

  module profile_cut_line_2d()
  {
    assert(walls.x == walls.y);
    minkowski()
    {
      offset(r=-walls.x/2 + 0.1)
        profile_2d();
      circle(d=box_cut_spacing);
    }
  }

  module profile_inner()
  {
    hull()
      profile_cut_line_2d();
  }

  module profile_outer()
  {
    offset(r=box_cut_spacing) // ensure no leftover polygons around
      difference()
      {
        profile_2d();
        profile_inner();
      }
  }

  module z_cut()
  {
    linear_extrude(box_cut_spacing)
      profile_outer();
    linear_extrude(box_cut_edge_h)
      profile_cut_line_2d();
    translate([0, 0, box_cut_edge_h - box_cut_spacing])
      linear_extrude(box_cut_spacing + 0*box_cut_top_spacing_extra)
        profile_inner();
  }

  module bottom_half()
  {
    linear_extrude(box_cut_h)
      hull()
      profile_outer();
    translate([0, 0, box_cut_h])
      hull()
      {
        linear_extrude(box_cut_edge_h)
          offset(r=-0.1)
          profile_cut_line_2d();
        translate([0, 0, box_cut_edge_h - box_cut_spacing])
          linear_extrude(box_cut_spacing + 0*box_cut_top_spacing_extra)
          offset(r=-0.1)
          profile_inner();
      }
  }

  if(only_cut)
    translate([0, 0, box_cut_h])
      z_cut();
  else
    bottom_half();
}


module dbox_fingers_space()
{
  depth = walls.y/2 + box_cut_spacing/2;

  module slot()
  {
    module cut()
    {
      $fn=fn(40);
      translate([-eps, size_ext.y/2, box_cut_h])
        rotate([0, 90, 0])
        cylinder(d=finger_space_d, h=depth+eps);
    }

    hull()
      for(dy=[-1,+1])
        translate([0, dy*finger_space_len/2, 0])
          cut();
  }

  for(dx=[0, size_ext.x - depth])
    translate([dx, 0, 0])
      slot();
}


module dbox_ext_cut()
{
  difference()
  {
    dbox_ext();
    dbox_cut_shape();
    dbox_fingers_space();
  }
}


!
intersection()
{
  dbox_ext_cut();
  cube([20,200,70]);
}

intersection()
{
  dbox_cut_shape(false);
  cube([20,190,70]);
}

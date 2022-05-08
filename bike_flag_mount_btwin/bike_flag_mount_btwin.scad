use<m3d/fn.scad>
use<m3d/rounded_cube.scad>

eps = 0.01;
d_stick = 6; // flag's stick diameter
stick_hole_len = 40; // defines how deep stick goes into the form
d_a = 7; // bottom hole (aka: hole A)
d_b = 8; // top hole (aka: hole B)
a_b_distance = 10.5; // distance between A and B holes (edges! not the centers!)
b_top_distance = 18; // distance from top of B hole to end of bike's frame (edge! not the center!)

mount_len = d_a + a_b_distance + d_b + b_top_distance + 5;
flag_stick_len = 150;
box_size = [ d_b*2.5, mount_len + flag_stick_len, d_b*2.5 ];

module screw_holes(h, extra_d)
{
  translate([0, d_a/2+a_b_distance+d_b/2, 0])
    cylinder(d=d_b+extra_d, h=h, $fn=fn(60));
  cylinder(d=d_a+extra_d, h=h, $fn=fn(60));
}

module bike_flag_mount()
{
  difference()
  {
    rounded_cube(box_size, 3, $fn=fn(20));
    // screw mount cut
    {
      cut_size = [ box_size[0], mount_len + box_size[0]/2, box_size[2]/2];
      translate([-eps, -eps, box_size[2]/2])
        cube(cut_size + eps*[2,1,1]);
    }
    // screw holes
    translate([box_size[0]/2, box_size[0]/2, -eps])
      screw_holes(h=box_size[2]+2*eps, extra_d=0.5);
    // main flag stick hole
    translate([box_size[0]/2, box_size[1]-stick_hole_len, box_size[2]/2])
      rotate([-90, 0, 0])
        cylinder(d=d_stick+0.5, h=stick_hole_len+eps, $fn=fn(70));
    // flag screw-in hole
    translate([box_size[0]/2, box_size[1]-stick_hole_len+5, -eps])
      cylinder(d=3+0.5, h=box_size[2]+2*eps, $fn=fn(50));
  }
}

bike_flag_mount();

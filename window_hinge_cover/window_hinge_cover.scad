side_h = 17;
base_size = [21.6, 59, 6];
top_cylinder_start_h = 8;
top_r = side_h - top_cylinder_start_h;

module element()
{
  
//  cube(base_size);
//  translate([top_r, 0, top])
//    rotate([-90, 0, 0])
//      cylinder(r=top_r, h=base_size[1], $fn=100);
}

element();

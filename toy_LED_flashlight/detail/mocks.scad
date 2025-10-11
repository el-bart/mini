include <../m3d/all.scad>
include <config.scad>

module LED_assembly_mock()
{
  cylinder(d=led_lens_d, h=13.5, $fn=fn(30));
  translate([0, 0, 13.5])
  {
    // resistors
    for(dy=[-1,+1])
      translate([0, dy*(led_lens_d/2 - 2.5/2), 0])
        cylinder(d=2.5, h=11);
    // radiator
    translate(-9/2*[1, 1, 0])
      cube([9, 9, 5.1]);
  }
}


module battery_pack_mock()
{
  s = battery_pack_size;
  translate([-s.x/2, -s.y/2, 0])
    cube(s);
}


module switch_mock()
{
  top_size = [14.7, 20.75, 6];
  translate([-top_size.x/2, -top_size.y/2, 0])
    cube(top_size);

  bottom_size = [11.5, 18.6, 11.1];
  translate([-bottom_size.x/2, -bottom_size.y/2, -bottom_size.z])
    cube(bottom_size);

  // contacts
  cont_size = [7.5, 0.65, 7.5];
  for(dy=[-1,0,+1])
    translate([0, dy*(bottom_size.y/2 - 2), -bottom_size.z])
      translate([-cont_size.x/2, -cont_size.y/2, -cont_size.z])
      cube(cont_size);
}


translate([-40, 0, 0])
  LED_assembly_mock();

translate([40, 0, 0])
  battery_pack_mock();

switch_mock();

use <detail/mocks.scad>
include <detail/config.scad>
include <m3d/all.scad>

switch_space_len = 25;
LED_space_len = 30;

ext_size = [
  battery_pack_size.x + 2*2 + 2*wall,
  switch_space_len + 2*battery_pack_size.y + LED_space_len,
  led_lens_d + 2*wall
];
ext_rand = 2*wall;

cover_size = [
  ext_size.x - 2*ext_rand - 0.5,
  ext_size.y,
  ext_size.z/2
];


module body_ext()
{
  rounded_cube(ext_size, ext_rand, $fn=fn(50));
}

module bottom()
{
  difference()
  {
    body_ext();
#
    translate(cover_off/2*[1,1,0] + [0,0, ext_size.z - cover_size.z])
      cube(cover_size + [0,0,eps]);
  }
}


bottom();

use <detail/bathtub_submarine.scad>
include <detail/config.scad>

module sub_left()
{
  total_len = aft_len + amid_len + fwd_len;

  rotate([0, 90, 0])
    intersection()
    {
      bathtub_submarine();
      translate(-total_len*[2, 1, 1])
        cube(total_len* [2, 2, 2]);
    }
}

sub_left();

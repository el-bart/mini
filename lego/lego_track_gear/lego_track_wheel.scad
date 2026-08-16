include <m3d/all.scad>

module lego_track_wheel()
{
  module lego_axle_slot(length)
  {
    module lego_axle(length, spacing=0)
    {
      y = 1.80 + 2*spacing;
      x = 4.75 + 2*spacing;
      translate([0, 0, -length/2])
        linear_extrude(length)
        for(dr=[0, 90])
          rotate([0, 0, dr])
            square([x, y], center=true);
    }

    lego_axle(length=length, spacing=0.3);
  }

  lego_axle_slot(10);
}


lego_track_wheel();

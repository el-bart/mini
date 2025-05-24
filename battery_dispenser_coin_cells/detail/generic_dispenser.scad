include <../m3d/all.scad>

module generic_dispenser(batt_d, batt_h, disp_h, wall=1.6, spacing=1, back_wall_width_min=20, mocks=$preview)
{
  module battery_mock()
  {
    cylinder(d=batt_d, h=batt_h);
  }

  duct_tape_width = 20;
  leaf_r = max(2.5, 1.5*spacing); // amount of place to reserve for supporting batter from the bottom, on each side
  overlap = max(batt_d*0.2, 2);
  size = [max(duct_tape_width+1, batt_d + 2*spacing + 2*wall), batt_d/2 + overlap + spacing + 2*wall, disp_h];
  back_wall_width = max(back_wall_width_min, size.y);

  module holder()
  {
    module block()
    {
      translate([-size.x/2, batt_d/2 + spacing, 0])
      {
        cube([size.x, wall, size.z]);
        translate([0, -size.y + wall, 0])
          side_rounded_cube(size, wall, $fn=fn(30));
      }
    }

    difference()
    {
      block();
      // battery space
      translate([0, 0, wall])
        cylinder(d=batt_d + 2*spacing, h=disp_h, $fn=fn(60));
      // bottom groove to ease the extraction
      groove_size = [batt_d - 2*leaf_r, size.y, wall+2*eps];
      translate([-groove_size.x/2, batt_d/2 - groove_size.y, -eps])
      {
        cube(groove_size - [0, groove_size.y/2, 0]);
        translate([groove_size.x/2, groove_size.y/2, 0])
          cylinder(d=groove_size.x, h=groove_size.z, $fn=fn(60));
      }
      // extraction slot
      extraction_slot_size = [/*batt_d + 2*spacing*/2*size.x, size.y, batt_h*1.5];
      translate([-extraction_slot_size.x/2, -extraction_slot_size.y + spacing, wall])
        cube(extraction_slot_size);
    }

    %if(mocks)
      for(dh=[wall: batt_h + 0.25 : disp_h - batt_h/2])
        translate([0, 0, dh])
          battery_mock();
  }

  translate([0, 0, batt_d/2 + spacing + wall ])
    rotate([-90, 0, 0])
    holder();
}

// just some samples here...
//generic_dispenser(batt_d=20, batt_h=3.25, disp_h=150);
generic_dispenser(batt_d=8, batt_h=3.25, disp_h=150);

/*
 * configuration
 */
brushes_count = 2;


/*
 * modules
 */

module lower_tub()
{
  translate([0, 20+4, 0])
    difference()
    {
      cylinder(h=10+3, r=20);
      translate([0,0,3])
        cylinder(h=10+3, r2=20, r1=16);
    }
}

module upper_ring()
{
  translate([0, 24+5, 0])
    difference()
    {
      cylinder(h=16, r=24+5);
      cylinder(h=16, r=24+0);
    }
}

module back_wall()
{
  translate([0,0,0])
  {
    // lower part
    translate([-70/2, 0, 0])
      cube([70, 3, 20]);
    // upper part
    translate([-70/2, 0, 100-16+13])
      cube([70, 3, 20]);
    // connector
    translate([-20/2, 0, 0])
      cube([20, 3, 100]);
  }
}

module brush_holder()
{
  lower_tub();
  translate([0,0,100])
    upper_ring();
  back_wall();
  // lower mounting
  difference()
  {
    translate([-30/2, 3, 0])
      cube([30, 10, 10+3]);
    hull()
      lower_tub();
  }
  // upper mounting
  translate([0, 0, 100])
  {
    difference()
    {
      translate([-40/2, 3, 0])
        cube([40, 10, 16]);
      hull()
        upper_ring();
    }
  }
}

/*
 * main program
 */
for(offset = [0:brushes_count-1])
{
  translate(offset * [60, 0, 0])
    brush_holder();
}

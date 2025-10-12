use <lock_shackle.scad>
use <lock_key2.scad>
use <lock_key.scad>
use <lock_cap.scad>
use <lock_base.scad>
use <lock_opening_key.scad>

lock_shackle();

translate([5, 7, 0])
  lock_key2();

lock_key();

translate([-85, 0, 0])
  lock_cap();

translate([-80, 0, 0])
  lock_base();

translate([25, -9, 0])
  opening_key();

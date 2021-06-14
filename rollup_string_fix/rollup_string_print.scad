use <detail/rollup_string_fix.scad>
use <detail/rollup_string_limiter.scad>

// required quantities. adjust according to your needs.
// (note: you need two identical elements per functional part)
fixes    = 2;
limiters = 3;

// ball-size
r=(3+1)/2;

if(fixes)
  for(i = [0:2*fixes-1])
    translate([0, 10*i, 0])
      rollup_string_fix(r);

if(limiters)
  for(i = [0:2*limiters-1])
    translate([20, 10*i, 0])
      rollup_string_limiter(r);

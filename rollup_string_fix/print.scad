use <rollup_string_fix.scad>
use <rollup_string_limiter.scad>

// required quantities. adjust according to your needs.
// (note: you need two identical elements per functional part)
fixes = 2*2;
limiters = 3*2;

// ball-size
r=(3+2)/2;

for(i = [0:fixes-1])
  translate([0, 10*i, 0])
    rollup_string_fix(r);

for(i = [0:limiters-1])
  translate([20, 10*i, 0])
    rollup_string_limiter(r);

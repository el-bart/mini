cutW=2;
cutH=4;
width=2*1+cutW;
height=3+cutH;

difference()
{
  union()
  {
    translate([-width/2, 0, 0])
      cube([width, 51, height]);
    translate([-67/2, 31+width, 0])
      rotate([0, 0, -90])
        cube([width, 67, height]);
  }
  translate([-cutW/2, 0, 3])
    cube([cutW, 51, cutH]);
  translate([-67/2, 31+1, 3])
    cube([67, cutW, cutH]);
}

eps = 0.01;
spacing = 0.5;
d = 13;
dh = 8;

x_raw = 30.9;
y_raw = 22.9;
z_raw = 8.2;
x = x_raw - 2*spacing;
y = y_raw + dh + dh/2;
z = z_raw - 2*spacing;

cut = (x - d)/2;
echo(cut);

difference()
{
  cube([x, y, z]);
  for(dx=[0, x-cut])
    translate([dx, y_raw, -eps])
      #cube([cut, dh, z + 2*eps]);
}

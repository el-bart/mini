include <m3d/all.scad>

h = 40;
xx = 240;
x = xx/2;

r = ( h*h + x*x ) / (2*h);
echo(r);

intersection()
{
  translate([0, 0, -r+h])
    sphere(r=r, $fn=fn(100));
  center([1,1,0], xx*[1,1,1])
    cube(xx*[1,1,1]);
}

eps=0.01;
depth=2;
side = 20;
size = side*[1,1,1];
font_size = 15;

difference()
{
  cube(size);
  translate([size[0]/2, depth, size[2]/2])
    rotate([90,0,0])
      linear_extrude(height=depth+eps)
        text("X", size=font_size, valign="center", halign="center");
  translate([-eps, size[1]/2, size[2]/2])
    rotate([90,0,90])
      linear_extrude(height=depth+eps)
        text("Y", size=font_size, valign="center", halign="center");
  translate([size[0]/2, size[1]/2, size[2]-depth])
    #linear_extrude(height=depth+eps)
      text("Z", size=font_size, valign="center", halign="center");
}

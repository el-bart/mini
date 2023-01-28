include <../m3d/fn.scad>

spacing = 0.0;

wall = 1.6;
via_d = 60 - spacing;
via_h = 28 - spacing;
top_h = wall / 2;
top_d = via_d + 10;

eps = 0.01;
$fn = fn(400);

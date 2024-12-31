module tracks(length)
{
  scale_span = 30.45 + 2*2.3 - 2*0.5;
  real_span = 1435;
  scale_down = scale_span / real_span;

  sleeper_size = scale_down * [2500, 260, 150];
  sleeper_span = scale_down * 600;

  track_size = scale_down * [70, 0, 150] + [0, length, 0];
  track_span = scale_down * 1435;

  assert(track_span == scale_span);

  module sleeper()
  {
    translate([-sleeper_size.x/2, 0, 0])
      cube(sleeper_size);
  }

  module track(dir)
  {
    dx = dir < 0 ? -track_size.x : 0;
    translate([dx + dir*track_span/2, 0, 0])
      cube(track_size + [0, 0, sleeper_size.z]);
  }

  for(dir = [-1, +1])
    track(dir);
  for(dy = [0 : sleeper_span : length])
    translate([0, dy, 0])
      sleeper();
}


tracks(length=319.382); // ~320mm, with a nice, flat finish at the end

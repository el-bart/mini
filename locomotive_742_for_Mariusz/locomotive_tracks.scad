module tracks(length)
{
  scale_span = 30.45 + 2*2.3 - 2*0.5;
  real_span = 1435;
  scale_down = scale_span / real_span;

  sleeper_size = scale_down * [0, 260, 150] + [70, 0, 0];
  sleeper_span = 25;

  track_size_real = [70, 0, 150];
  track_size = [4.0, length, scale_down*track_size_real.z];
  track_span = scale_down * 1435;

  assert(track_span == scale_span);
  assert(track_size.x == 4.0);

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

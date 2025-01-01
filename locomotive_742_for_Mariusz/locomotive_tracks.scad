module tracks(length)
{
  sleeper_size = [70, 13, 5];
  sleeper_span = 20;

  track_size = [4.3, length, 3];
  track_span = 30.45 + 2*2.3 + 2*0.1;

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
  for(dy = [0 : sleeper_span+sleeper_size.y : length])
    translate([0, dy, 0])
      sleeper();
}


tracks(length=343); // ~320mm, with a nice, flat finish at the end

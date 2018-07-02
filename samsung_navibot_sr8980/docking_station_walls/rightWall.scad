use <leftWall.scad>

module rightWall()
{
  mirror([1,0,0])
    leftWall();
}

rightWall();

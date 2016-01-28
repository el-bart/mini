use <leftWall.scad>

module rightWall()
{
  mirror([0,1,0])
    leftWall();
}

rightWall();

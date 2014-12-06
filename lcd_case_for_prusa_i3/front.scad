use <lcd.scad>
use <menu_knob.scad>
use <menu_knob_manipulator.scad>
use <reset_button.scad>
use <sdcard_reader.scad>

boxSize = [143, 148, 6+7];
lcdOffset = boxSize - [98+5, 60+5, 12];
encoderOffset = [20-14/2, boxSize[1]-30/2-15/2, boxSize[2]-(6+7)];

//rotate([180, 0, 0])
{
  difference()
  {
    // main working area
    cube(boxSize);
    // prusa's framework  corner
    translate([15+5, 0, 0])
      cube([143-(15+5), 53, 6]);
    // LCD
    translate(lcdOffset)
      lcdBoard();
    // encoder
    translate(encoderOffset)
      menuKnob();
  }

  // LCD stub
  %translate(lcdOffset)
    lcdBoard();
  // encoder stub
  %translate(encoderOffset)
  {
    menuKnob();
    translate([7, 6, 23+4])
      rotate([180,0,0])
        menuKnobManipulator();
  }
}
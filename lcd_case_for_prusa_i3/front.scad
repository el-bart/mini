use <lcd.scad>
use <menu_knob.scad>
use <menu_knob_manipulator.scad>
use <reset_button.scad>
use <sdcard_reader.scad>


boxSize = [143, 148, 6+7];
lcdOffset = boxSize - [98+5, 60+5, 12];
encoderOffset = [20-14/2, boxSize[1]-30/2-15/2-3, boxSize[2]-(6+7)];
sdCardOffset = [35, 80, boxSize[2]-6];
resetButtonOffset = [encoderOffset[0]+14/2, 68, 1];

//rotate([180, 0, 0])
{
  difference()
  {
    // main working area
    cube(boxSize);
    // prusa's framework  corner
    translate([15, 0, 0])
      cube([143-15, 53, boxSize[2]]);
    // LCD
    translate(lcdOffset)
      lcdBoard();
    // encoder
    translate(encoderOffset)
      menuKnob();
    // SD card mount
    translate(sdCardOffset)
      rotate([0,180,0])
        sdCardReader();
    // reset button
    translate(resetButtonOffset)
      resetButton();
  }

  // main mounting legs
  for(offset = [ [boxSize[0]-16, 0, boxSize[2]-7], [boxSize[0]-70, 0, boxSize[2]-7] ])
    translate(offset)
      cube([16, 40+13, 7]);
  // side mounting wing
  translate([15, 0, 6])
    cube([18, 20, 7]);

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
  // SD card mount stub
  %translate(sdCardOffset)
    rotate([0,180,0])
      sdCardReader();
  // reset button stub
  %translate(resetButtonOffset)
    resetButton();
}
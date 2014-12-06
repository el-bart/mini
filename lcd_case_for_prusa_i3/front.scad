use <lcd.scad>
use <menu_knob.scad>
use <menu_knob_manipulator.scad>
use <reset_button.scad>
use <sdcard_reader.scad>
use <cable_guide.scad>

boxSize = [143, 148, 6+7];
lcdOffset = boxSize - [98+5, 60+5, 12];
encoderOffset = [20-14/2, boxSize[1]-30/2-15/2-3, boxSize[2]-(6+7)];
sdCardOffset = [35, 80, boxSize[2]-6];
resetButtonOffset = [encoderOffset[0]+14/2, 68, 1];

//rotate([180, 0, 0])
{
  difference()
  {
    union()
    {
      // main mounting legs
      for(offset = [ [boxSize[0]-16, 0, boxSize[2]-7], [boxSize[0]-70, 0, boxSize[2]-7] ])
        translate(offset)
          cube([16, 40+13, 7]);
      // side mounting wing
      translate([15, 0, 6])
        cube([18, 20, 7]);

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
        {
          translate([-2, -1/2, -8])
            cube([14+2*2, 12+1, 8+6]);
          menuKnob();
        }
        // SD card mount
        translate(sdCardOffset)
          rotate([0,180,0])
            sdCardReader();
        // reset button
        translate(resetButtonOffset)
        {
          translate([0, 0, -resetButtonOffset[2]])
            cylinder(r=(16+1)/2, h=boxSize[2])
          resetButton();
        }
        // cable guide drill
        translate([boxSize[0]-98-5, 40+16+10, 0])
          cableGuide();
        // side mounting wing cut-in, so that screw will hold tight
        cube([15, 40, 6]);
      }
    }

    // mounting drills
    for(offsetOY = [ 13/2+5/2, 40+13+5])
      for(offsetOX = [15/2, boxSize[0]-70+16/2, boxSize[0]-16/2])
        translate([offsetOX, offsetOY, -1])
          cylinder(r=5/2, h=6+7+2, $fs=1);
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
  // SD card mount stub
  %translate(sdCardOffset)
    rotate([0,180,0])
      sdCardReader();
  // reset button stub
  %translate(resetButtonOffset)
    resetButton();
}
use <detail/generic_dispenser.scad>

module dispenser_lr44(disp_h)
{
  generic_dispenser(batt_d=11.5, batt_h=5.2, disp_h=disp_h);
}

dispenser_lr44(disp_h=90);

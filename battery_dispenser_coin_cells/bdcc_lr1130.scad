use <detail/generic_dispenser.scad>

module dispenser_lr1130(disp_h)
{
  generic_dispenser(batt_d=11.5, batt_h=3, disp_h=disp_h);
}

dispenser_lr1130(disp_h=90);

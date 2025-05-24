use <detail/generic_dispenser.scad>

module dispenser_lr41(disp_h)
{
  generic_dispenser(batt_d=7.9, batt_h=3.5, disp_h=disp_h);
}

dispenser_lr41(disp_h=90);

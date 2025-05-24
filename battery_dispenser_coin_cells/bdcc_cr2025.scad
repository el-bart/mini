use <detail/generic_dispenser.scad>

module dispenser_cr2025(disp_h)
{
  generic_dispenser(batt_d=20, batt_h=2.5, disp_h=disp_h);
}

dispenser_cr2025(disp_h=90);

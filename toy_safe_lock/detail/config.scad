key_d = 7;
key_insert_d = 4;
key_insert_h = 16;
ken_teeth = 3;
ken_tooth_len = 2;
key_tooth_spaceing = 1.5;
key_insert_len = ken_teeth*ken_tooth_len + (ken_teeth-1)*key_tooth_spaceing;
key_total_len = key_insert_len + 2 + 40 + 20;

bolt_len = 80;
bolt_d = 7;
bolt_h = 10;

wall_block_wall = 1.6;
wall_block_notch_len = 5 + wall_block_wall;
wall_block_len = 70;
wall_block_h = max(bolt_d, 20/* == double-side duct tape width*/);

bolt_guide_screw_d = 2.9 + 0.3;
bolt_guide_h = bolt_guide_screw_d + 2*1.5;
bolt_guide_spacing = 0.25;
bolt_wall = 3;

return_spring_len = 70;
return_spring_h = 5;
return_spring_w = 3*0.4;
return_sprint_screw_d = bolt_guide_screw_d;

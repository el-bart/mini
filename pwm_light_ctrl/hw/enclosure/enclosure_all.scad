use <USB_C_trigger_board_adapter.scad>
use <PWM_controller.scad>

PWM_controller_all(mocks=$preview);

translate([-5, 0, 0])
  USB_C_trigger_board_adapter();

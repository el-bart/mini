#pragma once
#include "config.hpp"
#include "Direction.hpp"
#include "Buttons.hpp"
#include "Engines.hpp"
#include "Watchdog.hpp"

namespace detail
{

struct EnginesControl
{
  ~EnginesControl() { off(); }

  auto execute_step(const Direction dir)
  {
    switch(dir)
    {
      case Direction::Forward:  return execute_drive( [&] { left_.step_forward();  }, [&] { right_.step_forward();  } );
      case Direction::Backward: return execute_drive( [&] { left_.step_backward(); }, [&] { right_.step_backward(); } );
      case Direction::Left:     return execute_turn ( [&] { left_.step_backward(); }, [&] { right_.step_forward();  } );
      case Direction::Right:    return execute_turn ( [&] { left_.step_forward();  }, [&] { right_.step_backward(); } );
      case Direction::Stop:
                                off();
                                Watchdog::reset();
                                return false;
    }
    return false; // never reached
  }

private:
  void off()
  {
    left_.off();
    right_.off();
  }

  inline bool step_delay() const
  {
    for(auto i=0; i<7; ++i)
    {
      _delay_ms(1);
      Watchdog::reset();
      if( Buttons::any_pressed() )
        return false;
    }
    return true;
  }

  template<typename FL, typename FR>
  bool execute_action(FL&& left, FR&& right, const uint16_t steps)
  {
    for(auto i=0l; i<steps; ++i)
    {
      left();
      right();
      if( not step_delay() )
        return false;
    }
    return true;
  }

  template<typename FL, typename FR>
  bool execute_turn(FL&& left, FR&& right)
  {
    return execute_action(left, right, steps_per_turn);
  }

  template<typename FL, typename FR>
  bool execute_drive(FL&& left, FR&& right)
  {
    return execute_action(left, right, steps_per_drive_len);
  }

  Engines::Left left_;
  Engines::Right right_;
};


inline void inter_dir_delay()
{
  for(auto i=0; i<50; ++i)
  {
    _delay_ms(10);
    Watchdog::reset();
  }
}

}


template<uint8_t N>
void execute_program(const Direction (&dirs)[N])
{
  detail::EnginesControl ec;

  auto first_run = true;
  for(auto& dir: dirs)
  {
    if(first_run)
      first_run = false;
    else
      detail::inter_dir_delay();

    if( not ec.execute_step(dir) )
      return;
  }
}

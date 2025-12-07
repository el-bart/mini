#pragma once
#include "config.hpp"
#include "Direction.hpp"
#include "Buttons.hpp"
#include "Watchdog.hpp"

namespace detail
{

inline void wait()
{
  _delay_ms(1);
  Watchdog::reset();
}

inline bool is_state_stable_one_round(const bool state)
{
  auto fails = 0;
  for(auto i = 0; i < 100; ++i)
    if( Buttons::any_pressed() == not state )
      ++fails;
  return fails <= 2;
}

inline bool is_state_stable(const bool state)
{
  auto lastState = Buttons::any_pressed();
  auto lastMatchingRounds = 0;
  for(auto round = 0; round < 50; ++round)
  {
    wait();
    auto const stateNow = Buttons::any_pressed();
    if( not is_state_stable_one_round(state) )
    {
      lastState = stateNow;
      lastMatchingRounds = 0;
      continue;
    }
    if( stateNow != lastState )
    {
      lastState = stateNow;
      lastMatchingRounds = 0;
      continue;
    }
    ++lastMatchingRounds;
    if( lastMatchingRounds == 1 + 9 )
      return true;
  }
  return false;
}

inline bool wait_for_any_button_state(const bool state, const uint32_t timeout_ms)
{
  const auto no_timeout = static_cast<bool>( timeout_ms == 0u );
  for(uint32_t t=0; no_timeout || t<timeout_ms; ++t)
  {
    if( Buttons::any_pressed() == not state )
    {
      wait();
      continue;
    }
    if( is_state_stable(state) )
      return true;
  }
  return false;
}

inline bool wait_for_all_buttons_released()
{
  return wait_for_any_button_state(false, 0u);
}

inline bool wait_for_any_button_pressed()
{
  return wait_for_any_button_state(true, 2u*60'000u);
}


struct OptionalDirection
{
  static OptionalDirection empty() { return OptionalDirection{}; }

  OptionalDirection(Direction dir):
    dir_{dir},
    has_value_{true}
  { }

  const Direction dir_{Direction::Stop};
  const bool has_value_{false};

private:
  OptionalDirection() = default;
};


inline OptionalDirection read_next_direction()
{
  while(true)
  {
    if( not wait_for_any_button_pressed() )
      return OptionalDirection::empty();

    if( Buttons::forward_pressed() )
    {
      wait_for_all_buttons_released();
      return Direction::Forward;
    }
    if( Buttons::backward_pressed() )
    {
      wait_for_all_buttons_released();
      return Direction::Backward;
    }
    if( Buttons::left_pressed() )
    {
      wait_for_all_buttons_released();
      return Direction::Left;
    }
    if( Buttons::right_pressed() )
    {
      wait_for_all_buttons_released();
      return Direction::Right;
    }
    if( Buttons::start_pressed() )
    {
      wait_for_all_buttons_released();
      return Direction::Stop;
    }
  }
}

}


template<uint8_t N>
bool read_program(Direction (&dirs)[N])
{
  for(auto i=0; i<N-1; ++i)
  {
    const auto opt_dir = detail::read_next_direction();
    if(not opt_dir.has_value_)
      return false;
    const auto dir = opt_dir.dir_;
    dirs[i] = dir;
    if(dir == Direction::Stop)
      return true;
  }

  detail::wait_for_all_buttons_released();

  dirs[N-1] = Direction::Stop;
  return true;
}

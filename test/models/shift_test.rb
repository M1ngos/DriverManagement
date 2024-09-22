# test/models/shift_test.rb
require "test_helper"

class ShiftTest < ActiveSupport::TestCase
  def setup
    @driver = Driver.create!(email: "test@example.com", password: "password") # Adjust as necessary
  end

  test "calculates no extra pay for 8 hours" do
    shift = Shift.create!(driver: @driver, clock_in: Time.zone.now, clock_out: Time.zone.now + 8.hours)
    assert_equal 0, shift.extra_pay
  end

  test "calculates extra pay for 9 hours" do
    shift = Shift.create!(driver: @driver, clock_in: Time.zone.now, clock_out: Time.zone.now + 9.hours)
    assert_equal 100, shift.extra_pay # $100 for 1 extra hour
  end

  test "calculates extra pay for 10 hours" do
    shift = Shift.create!(driver: @driver, clock_in: Time.zone.now, clock_out: Time.zone.now + 10.hours)
    assert_equal 200, shift.extra_pay # $200 for 2 extra hours
  end
end

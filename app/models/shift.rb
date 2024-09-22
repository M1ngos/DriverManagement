class Shift < ApplicationRecord
  belongs_to :driver

  EXTRA_HOURLY_RATE = 100
  WORK_HOURS_LIMIT = 8

  # Validate clock_in is always required
  validates :clock_in, presence: true

  # Validate clock_out only when it is being set (on update)
  validates :clock_out, presence: true, on: :update

  # Custom validation to ensure clock_out is after clock_in
  validate :clock_in_before_clock_out

  def clock_in_before_clock_out
    if clock_out.present? && clock_out < clock_in
      errors.add(:clock_out, "must be after clock in")
    end
  end

  def total_hours
    return 0 unless clock_in && clock_out
    ((clock_out - clock_in) / 3600).round(2) # Total hours worked
  end

  def extra_hours
    total = total_hours
    return 0 if total <= WORK_HOURS_LIMIT
    (total - WORK_HOURS_LIMIT).round(2) # Extra hours
  end

  def extra_pay
    return 0 unless total_hours > WORK_HOURS_LIMIT
    (total_hours - WORK_HOURS_LIMIT) * EXTRA_HOURLY_RATE
  end
end

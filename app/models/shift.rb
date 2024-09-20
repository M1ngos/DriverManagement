class Shift < ApplicationRecord
  belongs_to :driver

  # Validate clock_in is always required
  validates :clock_in, presence: true

  # Validate clock_out only when it is being set (on update)
  validates :clock_out, presence: true, on: :update

  # Custom validation to ensure clock_out is after clock_in
  validate :clock_in_before_clock_out

  private

  def clock_in_before_clock_out
    if clock_out.present? && clock_out < clock_in
      errors.add(:clock_out, "must be after clock in")
    end
  end
end

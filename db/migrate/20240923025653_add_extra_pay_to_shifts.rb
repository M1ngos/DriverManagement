class AddExtraPayToShifts < ActiveRecord::Migration[7.2]
  def change
    add_column :shifts, :extra_pay, :decimal, precision: 10, scale: 2, default: 0
  end
end

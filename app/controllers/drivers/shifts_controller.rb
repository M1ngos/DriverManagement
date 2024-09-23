  # app/controllers/drivers/shifts_controller.rb
  class Drivers::ShiftsController < ApplicationController
    before_action :authenticate_driver!

    def create
      if current_driver.clock_in
        Rails.logger.debug "Successfully clocked in"
        redirect_to driver_dashboard_path, notice: "Clocked in successfully."
      else
        Rails.logger.debug "Failed to clock in"
        redirect_to driver_dashboard_path, alert: "Failed to clock in."
      end
    end

    def update
      @shift = current_driver.shifts.find(params[:id])
      extra_pay = @shift.extra_pay

      if @shift.update(shift_params.merge(extra_pay: extra_pay))
        Rails.logger.debug "Clocked out successfully. Extra Pay: #{extra_pay}"
        redirect_to driver_dashboard_path, notice: "Clocked out successfully. Extra Pay: #{extra_pay} MZN"
      else
        Rails.logger.debug "Failed to clock out. Errors: #{@shift&.errors.full_messages.join(", ")}"
        redirect_to driver_dashboard_path, alert: "Failed to clock out."
      end
    end

    private

    def shift_params
      params.require(:shift).permit(:clock_in, :clock_out)
    end
  end

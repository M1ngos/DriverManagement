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
      # Update an existing shift with clock_out time
      @shift = current_driver.shifts.find(params[:id])
      if @shift.update(shift_params)
        redirect_to driver_dashboard_path, notice: "Clocked out successfully."
      else
        redirect_to driver_dashboard_path, alert: "Failed to clock out."
      end
    end

    private

    def shift_params
      params.require(:shift).permit(:clock_in, :clock_out)
    end
  end

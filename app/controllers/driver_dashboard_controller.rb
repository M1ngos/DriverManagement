class DriverDashboardController < ApplicationController
  before_action :authenticate_driver!

  def index
    @current_shift = current_driver.current_shift
    @shifts = Shift.where(driver: current_driver)
    @tasks = current_driver.tasks
  end
end

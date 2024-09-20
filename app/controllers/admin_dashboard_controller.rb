class AdminDashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    # Add any logic you need for the dashboard
  end
end

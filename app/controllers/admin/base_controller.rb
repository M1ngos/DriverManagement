# app/controllers/admin/base_controller.rb
class Admin::BaseController < ActionController::Base
  before_action :authenticate_admin!

  around_action :use_default_locale

  private

  # Use default locale for all RailsAdmin actions
  def use_default_locale(&block)
    # Executes the request in the default locale context
    I18n.with_locale(I18n.default_locale, &block)
  end


  # Ensure that only admin users can access RailsAdmin
  #  def authenticate_admin!
  #     unless current_user&.admin?
  #       redirect_to root_path, alert: "You are not authorized to access this page."
  #     end
  #  end
end

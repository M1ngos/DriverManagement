RailsAdmin.config do |config|
  config.parent_controller = "Admin::BaseController"
  config.asset_source = :importmap
  config.main_app_name = [ "Gestão de Motoristas", "- Prototype" ]

 ### Popular gems integration
 ## == Devise ==
 config.authenticate_with do
   warden.authenticate! scope: :admin
 end

 #  config.current_user_method(&:current_user)

 # Ensure only admin users can access the dashboard
 config.authorize_with do
  redirect_to main_app.root_path unless current_admin # Adjust this to check for the current admin
 end

 ## == CancanCan ==
 # config.authorize_with :cancancan

 ## == Pundit ==
 # config.authorize_with :pundit

 ## == PaperTrail ==
 # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

 ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

 ## == Gravatar integration ==
 ## To disable Gravatar integration in Navigation Bar set to false
 # config.show_gravatar = true

 ### Admin Model Configuration ###
 config.model "Admin" do
    list do
      field :id
      field :email
      field :created_at
      field :updated_at
    end
  end

 ### Driver Model Configuration ###
 config.model "Driver" do
    list do
      field :id
      field :email
      field :username
      field :created_at
      field :updated_at
      field :client_id
    end
  end
  ### Shift Model Configuration ###
  config.model "Shift" do
    list do
      field :driver_id
      field :clock_in
      field :clock_out
      field :extra_pay do
        formatted_value do
          value ? "#{value} MZN" : "0 MZN"
        end
      end
    end
  end





  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

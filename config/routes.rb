Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path
  get "admin_dashboard/index"
  get "driver_dashboard/index"
  # Public homepage
  root "public#home"

  # Devise routes
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  devise_for :drivers, controllers: {
    sessions: "drivers/sessions"
  }

  # Dashboard routes
  authenticate :admin do
    get "admin_dashboard", to: "admin_dashboard#index", as: :admin_dashboard
  end

  authenticate :driver do
    get "driver_dashboard", to: "driver_dashboard#index", as: :driver_dashboard
  end

  # Namespace for admin routes
  namespace :admin do
    get "dashboard", to: "dashboard#index"
    resources :clients
    resources :drivers
    resources :tasks
  end

  # Namespace for driver routes
  namespace :drivers do
    # get "shifts/create"
    # get "shifts/update"
    get "dashboard", to: "drivers_dashboard#index", as: :driver_dashboard
    patch "tasks/:id/toggle_completion", to: "tasks#toggle_completion", as: :toggle_task_completion
    # get "dashboard", to: "dashboard#index"
    resources :shifts, only: [ :create, :update ]
    resources :tasks, only: [ :index, :show, :update ]
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end

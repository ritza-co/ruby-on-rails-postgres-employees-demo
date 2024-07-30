Rails.application.routes.draw do
  root 'employees#index'
  resources :employees, only: [:index, :create, :update, :destroy]

  # Keep the health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
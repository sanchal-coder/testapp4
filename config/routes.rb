Rails.application.routes.draw do

  root to: redirect('/users/sign_in')
  # Set up routes for user authentication with Devise
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # Define routes accessible to users with the receptionist role
  authenticate :user, lambda { |u| u.receptionist? } do
    resources :patients
  end

  # Define routes accessible to users with the doctor role
  authenticate :user, lambda { |u| u.doctor? } do
    namespace :doctor do
      resources :patients, only: [:index]  # Doctors can only view the list of patients
    end
  end

  # Health check route for load balancers and uptime monitors
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA related routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end

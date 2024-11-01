Rails.application.routes.draw do
  devise_for :users
  
  # Define las rutas CRUD para `training_sessions`
  resources :training_sessions

  # Define la ruta raíz como el índice de `training_sessions`
  root to: "training_sessions#index"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end

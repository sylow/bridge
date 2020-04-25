Rails.application.routes.draw do
  post "/api/v1/auth/login", to: "api/v1/auth#login"

  namespace :api do
    namespace :v1 do
      resources :games 
      resources :users
      resources :deals
      resources :hands
    end
  end
end

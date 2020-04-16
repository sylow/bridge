Rails.application.routes.draw do
  resources :plays

  namespace :api do
    namespace :v1 do
      resources :games 
      resources :deals
      resources :hands
    end
  end
end

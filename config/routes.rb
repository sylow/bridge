Rails.application.routes.draw do

  root to: 'plays#show', id: 1

  resources :plays

  namespace :api do
    namespace :v1 do
      resources :games 
      resources :deals
      resources :hands
    end
  end
end

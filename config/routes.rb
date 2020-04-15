Rails.application.routes.draw do
  resources :plays

  namespace :api do
    namespace :v1 do
      resources :deals do
        resources :hands
      end
    end
  end
end

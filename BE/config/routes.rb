Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pre_builds
      resources :price_ranges
      resources :purposes
      resources :details
      resources :types
      get '/search', to: 'search#search'   
      get '/users', to: 'users#index'
      post '/users', to: 'users#create'
      post '/login', to: 'sessions#login'

    end
  end
end

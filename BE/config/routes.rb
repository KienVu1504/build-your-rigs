Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pre_builds
      resources :price_ranges
      resources :purposes
      resources :pr_attributes
      resources :products
      get '/search_pr', to: 'search#search_pr'
      get '/search_pre', to: 'search#search_pre'

      resources :users
      post '/login', to: 'sessions#login'
    end
  end
end

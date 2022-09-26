Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pre_builds
      resources :price_ranges
      resources :purposes
      resources :pr_attributes
      resources :products
      get '/search', to: 'search#search'
      resources :users, only: %i[show create index]
      post '/login', to: 'sessions#login'
    end
  end
end

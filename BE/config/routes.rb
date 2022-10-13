Rails.application.routes.draw do
  # set default url
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  namespace :api do
    namespace :v1 do
      resources :pre_builds
      resources :price_ranges
      resources :purposes
      resources :pr_attributes
      resources :products
      resources :brands
      resources :comments, only: %i[destroy create index]
      get '/search_pr', to: 'search#search_pr'
      get '/search_pre', to: 'search#search_pre'
      get '/search_brands', to: 'search#search_brands'
      get '/search_comment', to: 'search#search_comments'
      get '/brand_count', to: 'brands#count'




      post '/selected', to: 'pr_attributes#selected'
      resources :users
      post '/login', to: 'sessions#login'
    end
  end
end

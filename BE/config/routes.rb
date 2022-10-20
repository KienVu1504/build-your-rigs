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
      resources :reports#, only: %i[index update]

      get '/search_pr', to: 'search#search_pr'
      get '/search_pre', to: 'search#search_pre'
      get '/search_brands', to: 'search#search_brands'
      get '/search_comment', to: 'search#search_comments'
      get '/search_report', to: 'search#search_report'

      
      get '/brand_count', to: 'brands#count'
      get '/all_brand', to: 'brands#all_brand'

      post '/show_comments/:id', to: 'pr_attributes#show_comments'
      post '/show_items', to: 'pr_attributes#show_items'
      post '/selected', to: 'pr_attributes#selected'
      resources :users
      post '/login', to: 'sessions#login'

      resources :pr_attributes do
        resources :comments
      end

      resources :comments do
        resources :comments
        resources :reports
        # member do
        #   post :reports
        # end
      end
    end
  end
end

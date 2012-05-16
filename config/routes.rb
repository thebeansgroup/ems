Ems::Engine.routes.draw do
  root :to => "ems#index"
  
  # insight rules
  resources :category do
    resources :articles
    resources :news
    resources :reports
  end
  
  resources :articles
  resources :news
  resources :reports
  resources :tags
  resources :channels
  resources :categories
  resources :images
  resources :media
end

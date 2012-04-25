Ems::Engine.routes.draw do
  get "ems/index"
  root :to => "ems#index"  
  resources :reports
  resources :news
  resources :articles
  resources :tags
  resources :channels
  resources :categories
end

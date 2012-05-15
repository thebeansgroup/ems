Ems::Engine.routes.draw do
  resources :images

  resources :media

  get "ems/index"
  root :to => "ems#index"  
  resources :reports
  resources :news
  resources :articles
  resources :tags
  resources :channels
  resources :categories
end

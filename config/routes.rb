Ems::Engine.routes.draw do
  resources :reports

  resources :news

  resources :articles

  resources :tags
  resources :channels
  resources :categories

  get "ems/index"

  root :to => "ems#index"
end

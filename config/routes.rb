Ems::Engine.routes.draw do
  resources :articles

  resources :tags
  resources :channels
  resources :categories

  get "ems/index"

  root :to => "ems#index"
end

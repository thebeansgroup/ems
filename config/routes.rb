Ems::Engine.routes.draw do
  resources :tags

  resources :posts

  get "ems/index"

  root :to => "ems#index"
end
